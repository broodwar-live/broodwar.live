#!/usr/bin/env python3
"""Check the player-page playoff records against the tournament data.

Usage: python3 scripts/check-playoff-records.py <build-dir> [content-dir]

The playoff record on each player page (templates/players/player.html +
players/playoff-record.html) is aggregated in Tera from the bracket matches on the
season pages. This script recomputes it independently from content/tournaments/*.md and
checks, for every player page in the build (EN and KO):

  * series / games / finals W-L in the page's data-rec-* attributes equal the
    recomputation from the brackets;
  * finals W-L equals the titles / runner-up counts in the series pages' season lists
    (the source of the Titles table), counting the seasons that have a bracket.

Series seasons without a bracketed season page are reported but are not an error: the
record only covers playoffs recorded on season pages. Exits 1 on any mismatch.
"""
import re
import sys
import tomllib
from collections import Counter, defaultdict
from pathlib import Path


def front_matter(path):
    text = path.read_text(encoding="utf-8")
    parts = text.split("+++", 2)
    return tomllib.loads(parts[1]) if len(parts) == 3 else {}


def winner(m):
    """'a' | 'b' | '' -- mirrors the template: walkover side, else the higher score."""
    wo = m.get("walkover")
    if wo in ("a", "b"):
        return wo
    sa, sb = m.get("score_a"), m.get("score_b")
    if sa is None or sb is None or sa == sb:
        return ""
    return "a" if sa > sb else "b"


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    build = Path(sys.argv[1])
    content = Path(sys.argv[2]) if len(sys.argv) > 2 else Path(__file__).resolve().parent.parent / "content"

    pages = [front_matter(p) for p in sorted((content / "tournaments").glob("*.md"))
             if not p.name.endswith(".ko.md") and not p.name.startswith("_")]

    rec = defaultdict(Counter)  # slug -> sw, sl, gw, gl, fw, fl
    bracketed = set()  # (series_slug, season)
    for fm in pages:
        e = fm.get("extra", {})
        bracket = e.get("bracket") or []
        if not bracket:
            continue
        bracketed.add((e.get("series_slug"), e.get("season")))
        for ri, rd in enumerate(bracket):
            is_final = ri == len(bracket) - 1 and len(rd["matches"]) == 1
            for m in rd["matches"]:
                w = winner(m)
                games = "score_a" in m and "score_b" in m and not m.get("walkover")
                for me, op in (("a", "b"), ("b", "a")):
                    slug = m.get(me + "_slug")
                    if not slug:
                        continue
                    c = rec[slug]
                    if w:
                        res = "w" if w == me else "l"
                        c["s" + res] += 1
                        if is_final:
                            c["f" + res] += 1
                    if games:
                        c["gw"] += m["score_" + me]
                        c["gl"] += m["score_" + op]

    titles = defaultdict(Counter)  # slug -> fw, fl from the series season lists
    uncovered = []
    for fm in pages:
        for s in fm.get("extra", {}).get("seasons", []) or []:
            if (fm.get("slug"), s.get("season")) not in bracketed:
                if s.get("winner_slug") or s.get("runner_up_slug"):
                    uncovered.append(f"{fm.get('slug')} {s.get('season')}")
                continue
            if s.get("winner_slug"):
                titles[s["winner_slug"]]["fw"] += 1
            if s.get("runner_up_slug"):
                titles[s["runner_up_slug"]]["fl"] += 1

    errors = []
    for slug in sorted(set(rec) | set(titles)):
        r, t = rec.get(slug, Counter()), titles.get(slug, Counter())
        a, b = (r["fw"], r["fl"]), (t["fw"], t["fl"])
        if a != b:
            errors.append(f"{slug}: bracket finals {a[0]}-{a[1]} != series titles/runner-up {b[0]}-{b[1]}")

    attr = re.compile(r'data-rec-(series|games|finals)="?(\d+)-(\d+)')
    checked = 0
    for lang_dir in (build / "players", build / "ko" / "players"):
        for html in sorted(lang_dir.glob("*/index.html")):
            slug = html.parent.name
            got = {k: (int(w), int(l)) for k, w, l in attr.findall(html.read_text(encoding="utf-8"))}
            c = rec.get(slug, Counter())
            want = {}
            if slug in rec:
                want = {"series": (c["sw"], c["sl"]), "games": (c["gw"], c["gl"]), "finals": (c["fw"], c["fl"])}
            if got != want:
                errors.append(f"{html.relative_to(build)}: page {got or 'no record'} != data {want or 'no record'}")
            checked += 1

    if not checked:
        errors.append(f"no player pages found under {build}")
    for u in uncovered:
        print(f"note: no bracket for {u}; its final is not in the playoff record")
    for err in errors:
        print(f"ERROR {err}")
    print(f"{checked} player pages checked, {len(rec)} players with playoff matches, "
          f"{sum(c['fw'] for c in rec.values())} finals; {len(errors)} errors")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
