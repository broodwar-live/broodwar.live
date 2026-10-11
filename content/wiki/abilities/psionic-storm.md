+++
title = "Psionic Storm"
description = "Psionic Storm is a High Templar spell that deals 112 damage to all units in an area over a few seconds."
slug = "psionic-storm"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_ko = "사이오닉 스톰"
caster = "high-templar"
energy = 75
hp_cost = 0
damage = 112
damage_ticks = 8
range = 9
aoe = "48 px radius"
hotkey = "T"
researched_at = "templar-archives"
research_minerals = 200
research_gas = 200
research_time = 120
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Psionic_Storm"]
verified = "2026-10-11"
+++
Psionic Storm creates a storm at the target point that hits every unit within 48 pixels — air and ground, enemy and friendly, including the casting Templar — for 14 damage per hit over 8 hits, 112 in total. The damage ignores armor and unit size but is taken by shields first. Storms do not stack: a unit can only be damaged by one storm at a time. Buildings and units in Stasis Field are immune, and hallucinations are destroyed.

It costs 75 energy, has a range of 9 and is researched at the [Templar Archives](@/wiki/buildings/templar-archives.md) for 200 minerals and 200 gas (1,800 frames, 120 s).

Storm is the core Protoss splash spell in every matchup: it punishes clumped Hydralisks, Mutalisks and Zerglings in PvZ, Marine/Medic in PvT, and Dragoon or Reaver/Shuttle groups in PvP. Because the damage arrives over a short period, units can partly escape it by moving out immediately. EMP Shockwave on the Templar is the main Terran counter.
