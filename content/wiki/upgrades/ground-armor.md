+++
title = "Ground Armor"
description = "Ground Armor is the Protoss Forge upgrade that gives Protoss ground units +1 armor per level, up to three levels."
slug = "ground-armor"
template = "wiki/upgrade.html"
[taxonomies]
race = ["protoss"]
[extra]
race = "protoss"
minerals = 100
gas = 100
levels = 3
researched_at = "forge"
research_time = 266
affects = ["probe", "zealot", "dragoon", "high-templar", "dark-templar", "archon", "dark-archon", "reaver"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UpgradeType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Upgrades"]
verified = "2026-10-11"
+++
Each level of Ground Armor adds 1 armor to Protoss ground units: Probes, Zealots, Dragoons, High Templar, Dark Templar, Archons, Dark Archons and Reavers. Armor only reduces damage that reaches hit points; damage to shields is reduced by Plasma Shields instead. Levels 2 and 3 need a Templar Archives.

Ground Armor is especially useful for Zealots against Zerglings and Marines, whose low per-hit damage it reduces noticeably once shields are down.

| Level | Minerals / Gas | Research time | Requires |
|---|---|---|---|
| 1 | 100 / 100 | 266 s | — |
| 2 | 175 / 175 | 298 s | Templar Archives |
| 3 | 250 / 250 | 330 s | Templar Archives |

Research times are in game seconds at Normal speed (frames ÷ 15), the convention used across this wiki.
