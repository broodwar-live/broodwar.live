#!/usr/bin/env python3
"""Report KO->EN link leaks: links on built /ko/ pages that point to a non-/ko/
internal path even though a /ko/ equivalent exists.

Usage: check-ko-links.py <build-dir> [-v]
Ignored: static assets (files with an extension other than .html), external
links, fragment-only links, and EN targets with no /ko/ twin (listed separately).
"""
import os, re, sys, collections
from urllib.parse import urlparse, unquote
root = sys.argv[1]
verbose = "-v" in sys.argv
base = "https://broodwar.live"
attr = re.compile(r'''<a\b[^>]*?\bhref=(?:"([^"]*)"|'([^']*)'|([^\s>"']+))''', re.I)
# hreflang alternates and the language switcher are supposed to point at EN.
skip_tag = re.compile(r'hreflang=|aria-current="true"[^>]*>\s*English|>\s*English\s*<', re.I)

def page_exists(p):
    f = os.path.join(root, p.lstrip("/"))
    return os.path.isfile(f) or os.path.isfile(os.path.join(f, "index.html"))

leaks = collections.defaultdict(set)
no_twin = collections.defaultdict(set)
ko_root = os.path.join(root, "ko")
for d, _, files in os.walk(ko_root):
    for fn in files:
        if not fn.endswith(".html"): continue
        fp = os.path.join(d, fn)
        src = "/" + os.path.relpath(fp, root)
        html = open(fp, encoding="utf-8", errors="replace").read()
        html = re.sub(r"<script.*?</script>", "", html, flags=re.S)
        for m in re.finditer(r"<a\b[^>]*>(?:[^<]{0,40})", html, flags=re.I):
            tag = m.group(0)
            # the EN half of the language switcher is the only intended EN link
            if re.search(r">\s*English", tag): continue
            h = attr.match(tag)
            if not h: continue
            u = next(g for g in h.groups() if g is not None)
            if u.startswith(base): u = u[len(base):] or "/"
            pu = urlparse(u)
            if pu.scheme or u.startswith("//") or u.startswith("#") or not u: continue
            if not u.startswith("/"):
                u = os.path.normpath(os.path.join("/" + os.path.relpath(d, root), u))
            path = unquote(pu.path if u == pu.geturl() else urlparse(u).path)
            if path == "/ko" or path.startswith("/ko/"): continue
            last = path.rstrip("/").rsplit("/", 1)[-1]
            if "." in last and not last.endswith(".html"): continue  # static asset
            if page_exists("/ko" + path):
                leaks[path].add(src)
            else:
                no_twin[path].add(src)
total = sum(len(v) for v in leaks.values())
print(f"KO->EN leaks: {len(leaks)} targets  (page-link pairs: {total})")
for k in sorted(leaks, key=lambda k: -len(leaks[k])):
    s = sorted(leaks[k]); print(f"  {k}  <- {len(s)} e.g. {s[0]}")
print(f"EN-only targets linked from KO (no /ko/ twin): {len(no_twin)}")
for k in sorted(no_twin):
    s = sorted(no_twin[k]); print(f"  {k}  <- {len(s)} e.g. {s[0]}")

sys.exit(1 if total or no_twin else 0)
