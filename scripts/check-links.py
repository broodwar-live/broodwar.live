#!/usr/bin/env python3
"""Crawl a built Zola site and report broken internal links (href/src).

Usage: check-links.py <build-dir>   (exits 1 if any link is broken)
"""
import os, re, sys, collections
from urllib.parse import urlparse, unquote
root = sys.argv[1]
base = "https://broodwar.live"
attr = re.compile(r'''(?:href|src)=(?:"([^"]*)"|'([^']*)'|([^\s>"']+))''')
broken = collections.defaultdict(set)
def exists(path):
    p = unquote(path).split("#")[0].split("?")[0]
    if not p.startswith("/"): return True
    f = os.path.join(root, p.lstrip("/"))
    if os.path.isfile(f): return True
    if os.path.isdir(f) and os.path.isfile(os.path.join(f, "index.html")): return True
    return False
for d, _, files in os.walk(root):
    for fn in files:
        if not fn.endswith(".html"): continue
        fp = os.path.join(d, fn)
        html = open(fp, encoding="utf-8", errors="replace").read()
        html = re.sub(r"<script.*?</script>", "", html, flags=re.S)
        for m in attr.finditer(html):
            u = next(g for g in m.groups() if g is not None)
            if u.startswith(base): u = u[len(base):] or "/"
            pu = urlparse(u)
            if pu.scheme or u.startswith("//") or u.startswith("#") or not u: continue
            if not u.startswith("/"):
                u = os.path.normpath(os.path.join("/" + os.path.relpath(d, root), u))
            if not exists(u):
                broken[u.split("#")[0]].add("/" + os.path.relpath(fp, root))
total = sum(len(v) for v in broken.values())
print(f"broken targets: {len(broken)}  (page-link pairs: {total})")
for k in sorted(broken):
    srcs = sorted(broken[k])
    print(f"{k}  <- {len(srcs)} e.g. {srcs[0]}")

sys.exit(1 if total else 0)
