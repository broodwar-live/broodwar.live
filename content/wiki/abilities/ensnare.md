+++
title = "Ensnare"
description = "Ensnare is a Queen spell that slows the movement and attack rate of units in an area."
slug = "ensnare"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_ko = "인스네어"
caster = "queen"
energy = 75
hp_cost = 0
range = 9
aoe = "128×128 px"
duration = 40.0
hotkey = "E"
researched_at = "queens-nest"
research_minerals = 100
research_gas = 100
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Ensnare"]
verified = "2026-10-11"
+++
Ensnare covers every non-building, non-burrowed unit touching a 128×128-pixel square around the target point (air and ground, friend and foe, but not the casting Queen). For 75 status ticks (600 frames — 40 game seconds, about 25 seconds of real time on Fastest) affected units move at half speed, accelerate and turn 25% slower, and have their weapon cooldown increased by 25%. If the unit has Stim Pack active or a speed or attack-rate upgrade, Ensnare instead cancels that bonus. An ensnared cloaked unit is visible to the enemy.

It costs 75 energy, has a range of 9 and is researched at the [Queen's Nest](@/wiki/buildings/queens-nest.md) for 100 minerals and 100 gas (1,200 frames, 80 s). Restoration removes it.

Queens are uncommon, so Ensnare is a niche spell. It is most useful against groups that rely on speed — Mutalisks, Corsairs, stimmed bio — and to reveal cloaked units such as Wraiths or Arbiter-cloaked armies.
