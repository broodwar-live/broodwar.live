+++
title = "Maelstrom"
description = "Maelstrom is a Dark Archon spell that briefly freezes biological units in an area."
slug = "maelstrom"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_ko = "메일스트롬"
caster = "dark-archon"
energy = 100
hp_cost = 0
range = 10
aoe = "96×96 px"
duration = 11.7
hotkey = "E"
researched_at = "templar-archives"
research_minerals = 100
research_gas = 100
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Maelstrom"]
verified = "2026-10-11"
+++
Maelstrom stuns every biological, non-building, non-burrowed unit touching a 96×96-pixel square around the target point — air or ground, friend or foe — for 22 status ticks (about 176 frames: roughly 12 game seconds, or about 7.4 seconds of real time on Fastest). Stunned units cannot move, attack or cast. Mechanical units are unaffected, hallucinations in the area are destroyed, and a stunned cloaked unit is visible to the enemy. Restoration removes the stun.

It costs 100 energy, has a range of 10 and is researched at the [Templar Archives](@/wiki/buildings/templar-archives.md) for 100 minerals and 100 gas (1,500 frames, 100 s).

Every Zerg unit is biological, so Maelstrom is at its best in PvZ, where it can freeze a Mutalisk flock or a Hydralisk group for Archons, Reavers or Psionic Storm to punish. Against Terran it affects only infantry (and SCVs), and against Protoss only Zealots and Templar. Dark Archon cost keeps it rare.
