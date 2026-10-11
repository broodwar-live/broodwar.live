# In-browser replay parser

`replay_wasm.js` and `replay_wasm_bg.wasm` are build artifacts of the
`replay-wasm` crate. Do not edit them by hand; rebuild with
`scripts/build-wasm.sh`.

- Repository: https://github.com/broodwar-live/bw-engine
- Commit: `6a9fb2b` (docs: add NOTICE on OpenBW provenance and mark simulation as frozen)
- Toolchain: rustc 1.97.1 (8bab26f4f 2026-07-14), wasm-pack 0.13.1
- Size: 292270 bytes raw, 185125 bytes gzip -9

Build command (run from the bw-engine root; `--no-default-features`
builds the parser only, without the `map` and `sim` features):

```sh
RUSTFLAGS="--remap-path-prefix=<src>=/bw-engine --remap-path-prefix=$HOME/.cargo=/cargo --remap-path-prefix=<sysroot>=/rustc" \
  wasm-pack build --release --target web crates/replay-wasm --no-default-features
```

Exported API: `parseReplay(bytes: Uint8Array)` returns the serialized
`replay_core::Replay` (header, commands, command_warnings, build_order,
player_apm, timeline, metadata, extra_sections, map_data) or throws on an
unreadable file. The page loads it lazily from `static/js/replay-analyzer.js`
when the first file is chosen; nothing is uploaded.
