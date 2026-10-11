+++
title = "EMP Shockwave"
description = "EMP Shockwave is a Science Vessel spell that removes all shields and energy from units in an area."
slug = "emp-shockwave"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "EMP 충격파"
caster = "science-vessel"
energy = 100
hp_cost = 0
range = 8
aoe = "128×128 px"
hotkey = "E"
researched_at = "science-facility"
research_minerals = 200
research_gas = 200
research_time = 120
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/EMP_Shockwave"]
verified = "2026-10-11"
+++
EMP Shockwave fires a missile at a target point. On impact every unit and building whose footprint touches a 128×128-pixel square centred on that point (64 pixels in each direction, roughly a 4×4-tile area) has its plasma shields and its energy set to zero. Units in Stasis Field are unaffected, the casting Vessel is spared, hallucinations in the area are destroyed, and allied and own units are hit just like enemies.

It costs 100 energy, has a range of 8 and is researched at the [Science Facility](@/wiki/buildings/science-facility.md) for 200 minerals and 200 gas (1,800 frames, 120 s).

EMP is chiefly a TvP spell. Draining the energy of Arbiters and High Templar prevents Recall, Stasis Field and Psionic Storm, and stripping shields matters most against shield-heavy units such as Archons (10 HP, 350 shields) and Carriers. Against a Dragoon (80 shields, 100 HP) a hit removes 44% of its total durability. In TvT it can deny Yamato Cannon by draining Battlecruisers.
