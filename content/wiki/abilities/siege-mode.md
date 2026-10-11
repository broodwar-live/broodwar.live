+++
title = "Siege Mode"
description = "Siege Mode turns the Siege Tank into an immobile long-range artillery piece with splash damage."
slug = "siege-mode"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "시즈 모드"
caster = "siege-tank"
energy = 0
hp_cost = 0
damage = 70
range = 12
aoe = "10 / 25 / 40 px"
hotkey = "O"
researched_at = "machine-shop"
research_minerals = 150
research_gas = 150
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Siege_Tank"]
verified = "2026-10-11"
+++
Siege Mode converts a Siege Tank into a stationary artillery piece. In Tank Mode its Arclite Cannon deals 30 explosive damage at range 7 with a 37-frame cooldown. In Siege Mode the Arclite Shock Cannon deals 70 explosive damage at range 12 with a 75-frame cooldown, plus radial splash: full damage within 10 pixels of the impact, 50% within 25 pixels and 25% within 40 pixels. The splash hurts the tank owner's own units as well. A sieged tank cannot move and has a minimum range of 64 pixels (2 tiles), so units right next to it cannot be targeted.

The research, Siege Tech, is done at the [Machine Shop](@/wiki/buildings/machine-shop.md) for 150 minerals and 150 gas (1,200 frames, 80 s).

Siege Mode is the basis of Terran positional play. Sieged tanks let Terran hold ground in TvZ and TvP, and TvT is largely decided by tank positioning. Because the sieged range (12) exceeds the tank's sight (10), spotters such as floating buildings, Science Vessels or forward units are needed to use the full range, and the tank is vulnerable while it packs up to move.
