+++
title = "Disruption Web"
description = "Disruption Web is a Corsair spell that stops ground units and buildings beneath it from attacking."
slug = "disruption-web"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_ko = "디스럽션 웹"
caster = "corsair"
energy = 125
hp_cost = 0
range = 9
aoe = "120×80 px"
duration = 24.0
hotkey = "D"
researched_at = "fleet-beacon"
research_minerals = 200
research_gas = 200
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Disruption_Web"]
verified = "2026-10-11"
+++
Disruption Web places a 120×80-pixel field on the ground for 360 frames (24 game seconds, about 15 seconds of real time on Fastest). Every ground unit and building under it — including the caster's own — cannot attack while it stays inside. Air units are unaffected, units can walk out of the field, spellcasters can still cast, and Spider Mines can still detonate.

It costs 125 energy, has a range of 9 and is researched at the [Fleet Beacon](@/wiki/buildings/fleet-beacon.md) for 200 minerals and 200 gas (1,200 frames, 80 s).

Disruption Web is uncommon. It is seen mostly in PvZ alongside Corsair/Reaver play — webbing Hydralisks or Spore Colonies to protect Reavers and Corsairs — and occasionally in PvT on clumps of Siege Tanks. Because it also silences friendly ground units, it is best cast where only the enemy is shooting.
