#!/usr/bin/env python3
"""Check the player-comparison data (/compare.json) against the built player pages.

Usage: python3 scripts/check-compare-data.py <build-dir> [content-dir]

/compare.json (templates/compare.json, read by static/js/compare.js) is generated from the
same season data as the player pages, but by a separate template. This script recomputes,
from the JSON alone and with the rules compare.js uses, and checks:

  * every player slug in the JSON (player index and match/set entries) resolves to a built
    player page, EN and KO, and every built player page is in the index; every season
    resolves to a built season page (EN and KO);
  * titles / runner-ups in the index equal the series pages' season lists (content);
  * no match entry sits at a bracket slot marked `upcoming = true` (an ongoing season's
    unplayed match, e.g. its final) -- those are not played and must not be counted;
  * per player: playoff series / games / finals W-L and team-league sets W-L equal the
    page's data-rec-* / data-tl-* attributes (EN and KO);
  * per pair: series, games and 1v1 team-league set W-L equal the head-to-head row
    (data-h2h) on both players' pages, and pairs that never met have no row; 1v1 set W-L
    also equals the rows of the page's team-league set list (data-opp / data-tl-res),
    which is all a page without individual playoff matches shows. Pairs: all
    pairs among the 30 players with the most titles, plus 50 random pairs (fixed seed),
    plus every pair that met at least once.

Exits 1 on any mismatch.
"""
import gzip
import itertools
import json
import random
import re
import sys
import tomllib
from collections import Counter, defaultdict
from pathlib import Path


def front_matter(path):
    parts = path.read_text(encoding="utf-8").split("+++", 2)
    return tomllib.loads(parts[1]) if len(parts) == 3 else {}


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    build = Path(sys.argv[1])
    content = Path(sys.argv[2]) if len(sys.argv) > 2 else Path(__file__).resolve().parent.parent / "content"
    errors = []
    data_path = build / "compare.json"
    if not data_path.exists():
        print(f"ERROR {data_path} is missing")
        return 1
    raw_bytes = data_path.read_bytes()
    data = json.loads(raw_bytes)
    index = {p[0]: p for p in data["p"]}

    # --- Slugs resolve -----------------------------------------------------------------
    built = {d.name for d in (build / "players").iterdir() if (d / "index.html").exists()}
    built_ko = {d.name for d in (build / "ko" / "players").iterdir() if (d / "index.html").exists()}
    for slug in index:
        if slug not in built or slug not in built_ko:
            errors.append(f"player '{slug}' has no built page (EN and KO)")
    for slug in built - set(index):
        errors.append(f"built player page '{slug}' is missing from the JSON index")
    for s in data["s"]:
        for base in (build / "tournaments", build / "ko" / "tournaments"):
            if not (base / s[0] / "index.html").exists():
                errors.append(f"season '{s[0]}' has no built page {base / s[0]}")
        for ri in s[6]:
            if not 0 <= ri < len(data["r"]):
                errors.append(f"season '{s[0]}': round index {ri} out of range")

    def ref_ok(ref, where):
        if ref and not ref.startswith("~") and ref not in index:
            errors.append(f"{where}: player '{ref}' is not in the index")

    for m in data["m"]:
        for ref in (m[4], m[5]):
            ref_ok(ref, f"match {data['s'][m[0]][0]} r{m[1]} m{m[2]}")
    for g in data["t"]:
        for st in g[8]:
            for ref in (st[0], st[1], *st[7:9]):
                ref_ok(ref, f"set {data['s'][g[0]][0]} r{g[1]} m{g[2]}")

    # --- Titles ------------------------------------------------------------------------
    titles = Counter()
    for p in sorted((content / "tournaments").glob("*.md")):
        if p.name.endswith(".ko.md") or p.name.startswith("_"):
            continue
        for s in front_matter(p).get("extra", {}).get("seasons", []) or []:
            if s.get("winner_slug"):
                titles[(s["winner_slug"], "w")] += 1
            if s.get("runner_up_slug"):
                titles[(s["runner_up_slug"], "r")] += 1
    for slug, p in index.items():
        if (p[5], p[6]) != (titles[(slug, "w")], titles[(slug, "r")]):
            errors.append(f"{slug}: index titles {p[5]}/{p[6]} != series pages {titles[(slug, 'w')]}/{titles[(slug, 'r')]}")

    # --- Upcoming (unplayed) bracket slots are not in the JSON ------------------------
    upcoming = set()  # (season slug, round index, 1-based match index)
    for p in sorted((content / "tournaments").glob("*.md")):
        if p.name.endswith(".ko.md") or p.name.startswith("_"):
            continue
        fm = front_matter(p)
        for ri, rd in enumerate(fm.get("extra", {}).get("bracket", []) or []):
            for mi, m in enumerate(rd.get("matches", []), 1):
                if m.get("upcoming"):
                    upcoming.add((fm.get("slug"), ri, mi))
    for m in data["m"]:
        if (data["s"][m[0]][0], m[1], m[2]) in upcoming:
            errors.append(f"match {data['s'][m[0]][0]} r{m[1]} m{m[2]} is an upcoming (unplayed) slot but is in the JSON")

    # --- Recompute (compare.js rules) --------------------------------------------------
    career = defaultdict(Counter)  # slug -> sw sl gw gl fw fl tw tl
    pair = defaultdict(Counter)  # (a, b) -> sw sl gw gl tw tl n (from a's side)
    for _, _, _, _, a, b, sa, sb, w, x in data["m"]:
        wo, fin = bool(x & 1), bool(x & 2)
        for me, op, mg, og, side in ((a, b, sa, sb, "a"), (b, a, sb, sa, "b")):
            c, h = career[me], pair[(me, op)]
            h["n"] += 1
            if w:
                r = "w" if w == side else "l"
                c["s" + r] += 1
                h["s" + r] += 1
                if fin:
                    c["f" + r] += 1
            if not wo:
                c["gw"] += mg
                c["gl"] += og
                h["gw"] += mg
                h["gl"] += og
    for g in data["t"]:
        for st in g[8]:
            two = len(st) > 7
            sides = {"a": [st[0]] + ([st[7]] if two else []), "b": [st[1]] + ([st[8]] if two else [])}
            for side, players in sides.items():
                r = "w" if st[2] == side else "l"
                for me in players:
                    career[me]["t" + r] += 1
            if not two:
                for me, op, side in ((st[0], st[1], "a"), (st[1], st[0], "b")):
                    h = pair[(me, op)]
                    h["n"] += 1
                    h["t" + ("w" if st[2] == side else "l")] += 1

    # --- Built pages -------------------------------------------------------------------
    rec_attr = re.compile(r'data-(rec-series|rec-games|rec-finals|tl-sets)="?(\d+)-(\d+)')
    # Minified HTML may reorder attributes and drop quotes: read each <tr> tag's attributes.
    row_tag = re.compile(r'<tr\b[^>]*\bdata-h2h="[^"]*"[^>]*>')
    opp_attr = re.compile(r'\bdata-opp="?([^" >]+)')
    tl_tag = re.compile(r'<tr\b[^>]*\bdata-tl-res=[^>]*>')
    tl_res = re.compile(r'\bdata-tl-res="?([WL])')
    h2h_attr = re.compile(r'\bdata-h2h="(\d+)-(\d+) (\d+)-(\d+) (\d+)-(\d+)"')
    pages = {}
    for lang, base in (("en", build / "players"), ("ko", build / "ko" / "players")):
        for slug in index:
            html = base / slug / "index.html"
            if not html.exists():
                continue
            text = html.read_text(encoding="utf-8")
            attrs = {k: (int(w), int(l)) for k, w, l in rec_attr.findall(text)}
            rows = {}
            for tag in row_tag.findall(text):
                o, v = opp_attr.search(tag), h2h_attr.search(tag)
                if not o or not v:
                    errors.append(f"{lang} {slug}: unreadable head-to-head row {tag}")
                    continue
                rows[o.group(1)] = tuple(int(x) for x in v.groups())
            # 1v1 team-league sets per opponent, from the set list (2v2 rows have no data-opp).
            tl_rows = defaultdict(lambda: [0, 0])
            for tag in tl_tag.findall(text):
                o, r = opp_attr.search(tag), tl_res.search(tag)
                if o and r:
                    tl_rows[o.group(1)][0 if r.group(1) == "W" else 1] += 1
            pages[(lang, slug)] = (attrs, rows, "data-rec-h2h" in text, tl_rows)
            c = career.get(slug, Counter())
            want = {}
            if c["sw"] + c["sl"] + c["gw"] + c["gl"] or any(slug in (m[4], m[5]) for m in data["m"]):
                want.update({"rec-series": (c["sw"], c["sl"]), "rec-games": (c["gw"], c["gl"]), "rec-finals": (c["fw"], c["fl"])})
            if c["tw"] + c["tl"]:
                want["tl-sets"] = (c["tw"], c["tl"])
            if attrs != want:
                errors.append(f"{lang} {slug}: page {attrs or 'no record'} != JSON {want or 'no record'}")

    ranked = sorted(index, key=lambda s: (-index[s][5], s))[:30]
    pairs = set(itertools.combinations(sorted(ranked), 2))
    rng = random.Random(20261011)
    slugs = sorted(index)
    sampled = set()
    while len(sampled) < 50:
        a, b = rng.sample(slugs, 2)
        sampled.add(tuple(sorted((a, b))))
    pairs |= sampled
    met = {tuple(sorted(k)) for k in pair if not k[0].startswith("~") and not k[1].startswith("~")}
    pairs |= met
    checked = 0
    for a, b in sorted(pairs):
        for me, op in ((a, b), (b, a)):
            h = pair.get((me, op), Counter())
            want = (h["sw"], h["sl"], h["gw"], h["gl"], h["tw"], h["tl"]) if h["n"] else None
            for lang in ("en", "ko"):
                if (lang, me) not in pages:
                    continue
                _, rows, has_h2h, tl_rows = pages[(lang, me)]
                if has_h2h:
                    got = rows.get(op)
                    if got != want:
                        errors.append(f"{lang} {me} vs {op}: head-to-head row {got} != JSON {want}")
                elif h["sw"] + h["sl"] + h["gw"] + h["gl"]:
                    errors.append(f"{lang} {me} vs {op}: JSON has playoff series but the page has no head-to-head table")
                got_tl = tuple(tl_rows.get(op, (0, 0)))
                if got_tl != (h["tw"], h["tl"]):
                    errors.append(f"{lang} {me} vs {op}: team-league set list {got_tl} != JSON 1v1 sets {(h['tw'], h['tl'])}")
                checked += 1

    for err in errors[:200]:
        print(f"ERROR {err}")
    if len(errors) > 200:
        print(f"... and {len(errors) - 200} more")

    print(f"compare.json: {len(raw_bytes)} bytes ({len(gzip.compress(raw_bytes, 9))} gzipped), {len(index)} players, "
          f"{len(data['s'])} seasons, {len(data['m'])} matches, {sum(len(g[8]) for g in data['t'])} sets; "
          f"{len(pairs)} pairs ({len(met)} that met) checked on {checked} head-to-head tables; "
          f"{len(upcoming)} upcoming slots excluded; {len(errors)} errors")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
