+++
title = "Spider Mines"
description = "Spider Mines are burrowing explosives laid by Vultures that leap at nearby enemy ground units."
slug = "spider-mines"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "스파이더 마인"
caster = "vulture"
energy = 0
hp_cost = 0
damage = 125
aoe = "50 / 75 / 100 px"
hotkey = "I"
researched_at = "machine-shop"
research_minerals = 100
research_gas = 100
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Spider_Mine"]
verified = "2026-10-11"
+++
Once Spider Mines are researched, each Vulture carries three mines it can plant on the ground. A planted mine burrows and stays hidden until a hostile non-hovering ground unit comes near; it then unburrows, chases the target and explodes for 125 explosive damage with radial splash — full damage within 50 pixels, 50% within 75 pixels and 25% within 100 pixels. The splash also damages the mine owner's own units. Mines are triggered by cloaked units even when those units are not detected, and they ignore air and hovering units. Burrowed mines can only be attacked once detected.

The research is done at the [Machine Shop](@/wiki/buildings/machine-shop.md) for 100 minerals and 100 gas (1,200 frames, 80 s). Planting mines costs no energy; a Vulture simply runs out after three.

Mines are a staple of Terran mech. They protect tank lines, watch expansions and attack paths, and punish clumped ground armies. Players clear them with detection plus ranged fire, or by deliberately triggering them with a cheap unit.
