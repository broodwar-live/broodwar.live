#!/usr/bin/env python3
"""Validate the team-league data (Proleague etc.) and the pages built from it.

Usage: python3 scripts/check-team-leagues.py <build-dir> [content-dir]

Team-league season pages (content/tournaments/*.md with extra.team_bracket, schema in
templates/tournaments/team-season.html) and team-league series rows (extra.seasons[] with
winner_team / runner_up_team, templates/tournaments/series.html) are checked for:

  * set winners summing to each team match's score, leg winners to each tie's score, and
    the winner reaching the majority of best_of (series_best_of for ties);
  * the final (last round, single match) agreeing with the page's champion / runner-up /
    final_score / final_date and with the season's row on the series page;
  * every team, player and map slug resolving to a page (EN and KO), races being t/p/z/r,
    and the teams of every bracket match appearing in the season's `teams` list;
  * standings: match wins equal match losses (set totals that do not balance are a note);
  * KO pages carrying the same data as EN (round names, format and award labels may differ);
  * built pages: data-tl-sets / data-tl-1v1 / data-tl-finals on every player page and
    data-tl-team-finals on every team page equal an independent recomputation.

Exits 1 on any error.
"""
import re
import sys
import tomllib
from collections import Counter, defaultdict
from pathlib import Path

RACES = {"t", "p", "z", "r"}


def front_matter(path):
    parts = path.read_text(encoding="utf-8").split("+++", 2)
    return tomllib.loads(parts[1]) if len(parts) == 3 else {}


def side_won(a, b):
    return "a" if a > b else "b" if b > a else ""


def strip_labels(e):
    """Season extra without the fields KO pages may translate."""
    e = dict(e)
    e.pop("format", None)
    e["awards"] = [{k: v for k, v in a.items() if k != "award"} for a in e.get("awards", [])]
    e["team_bracket"] = [{k: v for k, v in rd.items() if k != "round"} for rd in e.get("team_bracket", [])]
    return e


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    build = Path(sys.argv[1])
    content = Path(sys.argv[2]) if len(sys.argv) > 2 else Path(__file__).resolve().parent.parent / "content"
    errors, notes = [], []

    def exists(kind, slug, where):
        base = {"team": content / "wiki" / "teams", "player": content / "players", "map": content / "wiki" / "maps"}[kind]
        for suffix in (".md", ".ko.md"):
            if not (base / (slug + suffix)).exists():
                errors.append(f"{where}: {kind} slug '{slug}' has no {base.relative_to(content)}/{slug}{suffix}")

    tdir = content / "tournaments"
    pages = {p.name: front_matter(p) for p in sorted(tdir.glob("*.md")) if not p.name.startswith("_")}
    series_rows = {}  # (lang, series slug, season) -> row
    team_finals = Counter()  # (slug, "w"|"l")
    for name, fm in pages.items():
        lang = "ko" if name.endswith(".ko.md") else "en"
        for s in fm.get("extra", {}).get("seasons", []) or []:
            if "winner_team" not in s and "runner_up_team" not in s:
                continue
            where = f"{name} season '{s.get('season')}'"
            series_rows[(lang, fm.get("slug"), s.get("season"))] = s
            for k in ("winner_team", "runner_up_team"):
                if s.get(k):
                    exists("team", s[k], where)
                    if lang == "en":
                        team_finals[(s[k], "w" if k == "winner_team" else "l")] += 1
            if s.get("score") and not re.fullmatch(r"\d+–\d+", s["score"]):
                errors.append(f"{where}: score '{s['score']}' is not 'N–M' (en dash)")
    for (lang, slug, season), row in series_rows.items():
        if lang == "en" and series_rows.get(("ko", slug, season)) != row:
            errors.append(f"{slug} season '{season}': EN and KO series rows differ")

    # player slug -> Counter(w, l, w1, l1, fw, fl)
    rec = defaultdict(Counter)
    seasons = 0
    en_extra = {}
    for name, fm in pages.items():
        e = fm.get("extra", {})
        bracket = e.get("team_bracket")
        if not bracket:
            continue
        lang = "ko" if name.endswith(".ko.md") else "en"
        where = name
        if lang == "en":
            seasons += 1
            en_extra[name[:-3]] = e
        else:
            base = en_extra.get(name[:-6]) or front_matter(tdir / (name[:-6] + ".md")).get("extra", {})
            if strip_labels(e) != strip_labels(base):
                errors.append(f"{where}: data differs from the EN page (beyond round/format/award labels)")
        row = series_rows.get((lang, e.get("series_slug"), e.get("season")))
        if row is None:
            errors.append(f"{where}: no row for season '{e.get('season')}' on tournaments/{e.get('series_slug')}")
        team_names = {t["name"] for t in e.get("teams", [])}
        for t in e.get("teams", []):
            if t.get("slug"):
                exists("team", t["slug"], where)
        for mp in e.get("maps", []):
            if mp.get("slug"):
                exists("map", mp["slug"], where)
        for aw in e.get("awards", []):
            if aw.get("slug"):
                exists("player", aw["slug"], where)
        st = e.get("standings") or []
        if st:
            for s in st:
                if s.get("slug"):
                    exists("team", s["slug"], where)
            if sum(s["w"] for s in st) != sum(s["l"] for s in st):
                errors.append(f"{where}: standings match wins {sum(s['w'] for s in st)} != losses {sum(s['l'] for s in st)}")
            if lang == "en" and sum(s["set_w"] for s in st) != sum(s["set_l"] for s in st):
                notes.append(f"{where}: standings set totals do not balance "
                             f"({sum(s['set_w'] for s in st)}–{sum(s['set_l'] for s in st)}, as in the source)")

        for ri, rd in enumerate(bracket):
            is_final = ri == len(bracket) - 1 and len(rd["matches"]) == 1
            bo, sbo = rd.get("best_of"), rd.get("series_best_of")
            for mi, m in enumerate(rd["matches"], 1):
                mw = f"{where} {rd.get('round')} #{mi} ({m.get('a')} v {m.get('b')})"
                for side in ("a", "b"):
                    if m.get(side + "_team"):
                        exists("team", m[side + "_team"], mw)
                    if team_names and m.get(side) not in team_names:
                        errors.append(f"{mw}: team '{m.get(side)}' is not in the season's teams list")
                sa, sb = m.get("score_a"), m.get("score_b")
                if m.get("walkover"):
                    if m["walkover"] not in ("a", "b"):
                        errors.append(f"{mw}: walkover must be 'a' or 'b'")
                    continue
                if sa is None or sb is None:
                    errors.append(f"{mw}: missing score_a / score_b")
                    continue
                games = m.get("legs") or ([m] if "sets" in m else [])
                if m.get("legs"):
                    lw = Counter()
                    for li, lg in enumerate(m["legs"], 1):
                        w = side_won(lg["score_a"], lg["score_b"])
                        lw[w] += 1
                    if (lw["a"], lw["b"]) != (sa, sb):
                        errors.append(f"{mw}: legs won {lw['a']}–{lw['b']} != score {sa}–{sb}")
                    if sbo and max(sa, sb) != (sbo + 1) // 2:
                        errors.append(f"{mw}: winner has {max(sa, sb)} matches, best of {sbo} needs {(sbo + 1) // 2}")
                for gi, g in enumerate(games, 1):
                    gw = f"{mw}" + (f" match {gi}" if m.get("legs") else "")
                    sets = g.get("sets") or []
                    c = Counter(s.get("winner") for s in sets)
                    if set(c) - {"a", "b"}:
                        errors.append(f"{gw}: set winner must be 'a' or 'b'")
                    if (c["a"], c["b"]) != (g["score_a"], g["score_b"]):
                        errors.append(f"{gw}: set winners {c['a']}–{c['b']} != score {g['score_a']}–{g['score_b']}")
                    if bo and max(g["score_a"], g["score_b"]) != (bo + 1) // 2:
                        errors.append(f"{gw}: winner has {max(g['score_a'], g['score_b'])} sets, Bo{bo} needs {(bo + 1) // 2}")
                    for si, s in enumerate(sets, 1):
                        for f in ("a", "a2", "b", "b2"):
                            if f not in s:
                                continue
                            if s.get(f + "_slug"):
                                exists("player", s[f + "_slug"], f"{gw} set {si}")
                            if s.get(f + "_race", "") not in RACES:
                                errors.append(f"{gw} set {si}: {s[f]} race '{s.get(f + '_race', '')}' not in t/p/z/r")
                        if s.get("map_slug"):
                            exists("map", s["map_slug"], f"{gw} set {si}")
                        if lang != "en" or s.get("walkover"):
                            continue
                        two = "a2" in s or "b2" in s
                        for side in ("a", "b"):
                            for f in (side, side + "2"):
                                slug = s.get(f + "_slug")
                                if not slug:
                                    continue
                                r = rec[slug]
                                res = "w" if s["winner"] == side else "l"
                                r[res] += 1
                                if not two:
                                    r[res + "1"] += 1
                                if is_final:
                                    r["f" + res] += 1
                if is_final:
                    won = side_won(sa, sb)
                    champ, runner = (m.get("a_team"), m.get("b_team")) if won == "a" else (m.get("b_team"), m.get("a_team"))
                    if (champ, runner) != (e.get("champion_team"), e.get("runner_up_team")):
                        errors.append(f"{where}: final winner/loser {champ}/{runner} != champion_team/runner_up_team")
                    score = f"{max(sa, sb)}–{min(sa, sb)}"
                    if score != e.get("final_score"):
                        errors.append(f"{where}: final {score} != final_score {e.get('final_score')}")
                    if m.get("date") != e.get("final_date"):
                        errors.append(f"{where}: final date {m.get('date')} != final_date {e.get('final_date')}")
                    if row is not None:
                        for k_row, k_page in (("winner_team", "champion_team"), ("runner_up_team", "runner_up_team"),
                                              ("winner", "champion"), ("runner_up", "runner_up"),
                                              ("score", "final_score"), ("final_date", "final_date")):
                            if row.get(k_row) != e.get(k_page):
                                errors.append(f"{where}: series row {k_row} '{row.get(k_row)}' != page {k_page} '{e.get(k_page)}'")
                        if m.get("legs"):
                            detail = ", ".join(f"{lg['score_a']}–{lg['score_b']}" if won == "a" else f"{lg['score_b']}–{lg['score_a']}"
                                               for lg in m["legs"])
                            if row.get("score_detail") != detail:
                                errors.append(f"{where}: series row score_detail '{row.get('score_detail')}' != legs '{detail}'")

    # Built pages
    attr = re.compile(r'data-tl-(sets|1v1|finals|team-finals)="?(\d+)-(\d+)')
    checked = 0
    for lang_dir in (build / "players", build / "ko" / "players"):
        for html in sorted(lang_dir.glob("*/index.html")):
            slug = html.parent.name
            got = {k: (int(w), int(l)) for k, w, l in attr.findall(html.read_text(encoding="utf-8"))}
            c = rec.get(slug)
            want = {} if not c else {"sets": (c["w"], c["l"]), "1v1": (c["w1"], c["l1"]), "finals": (c["fw"], c["fl"])}
            if got != want:
                errors.append(f"{html.relative_to(build)}: page {got or 'no team-league sets'} != data {want or 'none'}")
            checked += 1
    for lang_dir in (build / "wiki" / "teams", build / "ko" / "wiki" / "teams"):
        for html in sorted(lang_dir.glob("*/index.html")):
            slug = html.parent.name
            got = {k: (int(w), int(l)) for k, w, l in attr.findall(html.read_text(encoding="utf-8"))}
            w, l = team_finals[(slug, "w")], team_finals[(slug, "l")]
            want = {"team-finals": (w, l)} if w + l else {}
            if got != want:
                errors.append(f"{html.relative_to(build)}: page {got or 'no finals'} != data {want or 'none'}")
            checked += 1
    if not checked:
        errors.append(f"no player or team pages found under {build}")

    for n in notes:
        print(f"note: {n}")
    for err in errors:
        print(f"ERROR {err}")
    print(f"{seasons} team-league season pages, {len(series_rows) // 2} series rows, {len(rec)} players with sets, "
          f"{checked} built pages checked; {len(errors)} errors")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
