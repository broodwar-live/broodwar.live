+++
title = "Irradiate"
description = "Irradiate is a Science Vessel spell that deals 250 damage over time to biological units around its target."
slug = "irradiate"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "이래디에이트"
caster = "science-vessel"
energy = 75
hp_cost = 0
damage = 250
range = 9
aoe = "32 px around target"
duration = 40.0
hotkey = "I"
researched_at = "science-facility"
research_minerals = 200
research_gas = 200
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Irradiate"]
verified = "2026-10-11"
+++
Irradiate can be cast on any non-building unit. For 75 status ticks (600 frames — 40 game seconds, about 25 seconds of real time on Fastest) the irradiated unit emits radiation that deals 250 damage in total, ignoring armor, to every biological unit within 32 pixels of it — including the target itself if it is biological. The damage does not fall off with distance, so two irradiated units standing together hurt each other twice. Mechanical units take no damage; casting it on your own tank or Vessel near enemy biological units is known as the "Eraser" trick. Burrowed units only take damage if they are the irradiated unit, and larvae, eggs and buildings are immune.

It costs 75 energy, has a range of 9 and is researched at the [Science Facility](@/wiki/buildings/science-facility.md) for 200 minerals and 200 gas (1,200 frames, 80 s).

Irradiate is a cornerstone of TvZ. Stacked Mutalisks take heavy losses from one cast, and Defilers, Lurkers and Ultralisks are prime single targets. Since every Zerg unit is biological, the spell is far more useful against Zerg than against Protoss or Terran.
