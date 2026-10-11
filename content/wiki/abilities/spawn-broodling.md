+++
title = "Spawn Broodling"
description = "Spawn Broodling is a Queen spell that instantly kills a non-robotic ground unit and spawns Broodlings."
slug = "spawn-broodling"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_ko = "스폰 브루들링"
caster = "queen"
energy = 150
hp_cost = 0
range = 9
hotkey = "B"
researched_at = "queens-nest"
research_minerals = 100
research_gas = 100
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Queen_(Unit)"]
verified = "2026-10-11"
+++
Spawn Broodling instantly kills one ground unit regardless of its hit points, shields or armor, and spawns up to two Broodlings for the Queen's owner where it stood. Broodlings are weak melee units that expire after 1,800 frames (120 game seconds, about 76 seconds of real time on Fastest). The spell cannot target air units, buildings, robotic units (on the ground, Probes and Reavers) or Archons and Dark Archons, and a hallucinated target is destroyed without spawning anything.

It costs 150 energy, has a range of 9 and is researched at the [Queen's Nest](@/wiki/buildings/queens-nest.md) for 100 minerals and 100 gas (1,200 frames, 80 s).

The classic target is a sieged Siege Tank; High Templar, Dark Templar, Defilers and other expensive ground units are also valid. Queens are fragile and rarely built in professional games, so the spell is a niche tool.
