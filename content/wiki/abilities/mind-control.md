+++
title = "Mind Control"
description = "Mind Control is a Dark Archon spell that permanently takes control of an enemy unit."
slug = "mind-control"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_ko = "마인드 컨트롤"
caster = "dark-archon"
energy = 150
hp_cost = 0
range = 8
hotkey = "C"
researched_at = "templar-archives"
research_minerals = 200
research_gas = 200
research_time = 120
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Mind_Control"]
verified = "2026-10-11"
+++
Mind Control permanently transfers one enemy non-building unit to the caster. Larvae, eggs, Spider Mines, Interceptors and Scarabs cannot be taken, nor can units in Stasis Field. Casting it drains the Dark Archon's shields to zero. A controlled unit keeps its unit-specific researches (a stolen High Templar, for example, brings its researched spells with it) but not the previous owner's weapon, armor or shield upgrade levels. Units inside a controlled transport change sides with it.

It costs 150 energy, has a range of 8 and is researched at the [Templar Archives](@/wiki/buildings/templar-archives.md) for 200 minerals and 200 gas (1,800 frames, 120 s).

Mind Control is rare in professional games. Its best-known use is stealing a worker — an SCV or Drone — to build a second race's tech; it can also take high-value units such as Carriers, Siege Tanks or Defilers, and stolen units count against a separate race's supply cap. The Dark Archon is left without shields afterwards and should be protected.
