#!/usr/bin/env bash
# Rebuild the in-browser replay parser (static/wasm/) from bw-engine.
#
# Usage: scripts/build-wasm.sh [path-to-bw-engine] [git-ref]
#   path-to-bw-engine  local clone of github.com/broodwar-live/bw-engine
#                      (default: ../bw-engine next to this repo)
#   git-ref            commit, tag or branch to build (default: the pinned SHA below)
#
# The ref is exported with `git archive` into a temp dir, so the bw-engine
# clone's working tree and checked-out branch are never touched.
# Requires: git, cargo with the wasm32-unknown-unknown target, wasm-pack.
set -euo pipefail

PINNED_REF="1a64593"
SITE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
BW_ENGINE="${1:-$SITE_DIR/../bw-engine}"
REF="${2:-$PINNED_REF}"
OUT="$SITE_DIR/static/wasm"

SHA="$(git -C "$BW_ENGINE" rev-parse --short=7 "$REF^{commit}")"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

git -C "$BW_ENGINE" archive "$SHA" | tar -x -C "$TMP/"

# Strip local paths from panic locations so the build is reproducible.
export RUSTFLAGS="--remap-path-prefix=$TMP=/bw-engine --remap-path-prefix=${CARGO_HOME:-$HOME/.cargo}=/cargo --remap-path-prefix=$(rustc --print sysroot)=/rustc"
export CARGO_TARGET_DIR="$TMP/target"

# Parser-only bundle: `--no-default-features` drops the `map` and `sim`
# features (map/MPQ assets and the game simulation).
(cd "$TMP" && wasm-pack build --release --target web --out-dir "$TMP/pkg" \
  crates/replay-wasm --no-default-features)

mkdir -p "$OUT"
cp "$TMP/pkg/replay_wasm.js" "$TMP/pkg/replay_wasm_bg.wasm" "$OUT/"

RAW=$(wc -c < "$OUT/replay_wasm_bg.wasm" | tr -d ' ')
GZ=$(gzip -9 -c "$OUT/replay_wasm_bg.wasm" | wc -c | tr -d ' ')

cat > "$OUT/SOURCE.md" <<MD
# In-browser replay parser

\`replay_wasm.js\` and \`replay_wasm_bg.wasm\` are build artifacts of the
\`replay-wasm\` crate. Do not edit them by hand; rebuild with
\`scripts/build-wasm.sh\`.

- Repository: https://github.com/broodwar-live/bw-engine
- Commit: \`$SHA\` ($(git -C "$BW_ENGINE" log -1 --format='%s' "$SHA"))
- Toolchain: $(rustc --version), $(wasm-pack --version)
- Size: $RAW bytes raw, $GZ bytes gzip -9

Build command (run from the bw-engine root; \`--no-default-features\`
builds the parser only, without the \`map\` and \`sim\` features):

\`\`\`sh
RUSTFLAGS="--remap-path-prefix=<src>=/bw-engine --remap-path-prefix=\$HOME/.cargo=/cargo --remap-path-prefix=<sysroot>=/rustc" \\
  wasm-pack build --release --target web crates/replay-wasm --no-default-features
\`\`\`

Exported API: \`parseReplay(bytes: Uint8Array, options?)\` returns the parsed
replay (header, commands, command_warnings, build_order, player_apm,
timeline, metadata, extra_sections) plus replay-core's analyses:
\`production\` (build order with modelled supply, larvae and dropped orders),
\`openings\`, \`phases\` and \`apm_curve\`. \`map_data\` is only included with
\`{mapData: true}\` (or via \`getMapData(bytes)\`). Unreadable files throw an
\`Error\` with a \`code\` (\`NOT_A_REPLAY\`, \`TRUNCATED\`, \`CORRUPT\`,
\`UNSUPPORTED\`). The page loads it lazily from
\`static/js/replay-analyzer.js\` when the first file is chosen; nothing is
uploaded.
MD
echo "Built bw-engine $SHA -> $OUT ($RAW bytes, $GZ gzip)"
