# In-browser replay parser

`replay_wasm.js` and `replay_wasm_bg.wasm` are build artifacts of the
`replay-wasm` crate. Do not edit them by hand; rebuild with
`scripts/build-wasm.sh`.

- Repository: https://github.com/broodwar-live/bw-engine
- Commit: `1a64593` (feat(wasm): return analyses from parseReplay and drop map_data by default)
- Toolchain: rustc 1.97.1 (8bab26f4f 2026-07-14), wasm-pack 0.13.1
- Size: 360619 bytes raw, 214074 bytes gzip -9

Build command (run from the bw-engine root; `--no-default-features`
builds the parser only, without the `map` and `sim` features):

```sh
RUSTFLAGS="--remap-path-prefix=<src>=/bw-engine --remap-path-prefix=$HOME/.cargo=/cargo --remap-path-prefix=<sysroot>=/rustc" \
  wasm-pack build --release --target web crates/replay-wasm --no-default-features
```

Exported API: `parseReplay(bytes: Uint8Array, options?)` returns the parsed
replay (header, commands, command_warnings, build_order, player_apm,
timeline, metadata, extra_sections) plus replay-core's analyses:
`production` (build order with modelled supply, larvae and dropped orders),
`openings`, `phases` and `apm_curve`. `map_data` is only included with
`{mapData: true}` (or via `getMapData(bytes)`). Unreadable files throw an
`Error` with a `code` (`NOT_A_REPLAY`, `TRUNCATED`, `CORRUPT`,
`UNSUPPORTED`). The page loads it lazily from
`static/js/replay-analyzer.js` when the first file is chosen; nothing is
uploaded.
