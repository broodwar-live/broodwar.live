+++
title = "Lockdown"
description = "Lockdown is a Ghost spell that temporarily disables a single mechanical unit."
slug = "lockdown"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "락다운"
caster = "ghost"
energy = 100
hp_cost = 0
range = 8
duration = 69.9
hotkey = "L"
researched_at = "covert-ops"
research_minerals = 200
research_gas = 200
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Lockdown"]
verified = "2026-10-11"
+++
Lockdown disables one mechanical, non-building unit: it cannot move, attack or use abilities, and a locked-down Carrier recalls its Interceptors. The effect lasts 131 status ticks — about 1,048 frames, roughly 70 game seconds or about 44 seconds of real time on Fastest — the same duration as Stasis Field. Unlike Stasis, the target can still be attacked, and a locked-down cloaked unit is visible to the enemy. A Medic's Restoration removes it.

It costs 100 energy, has a range of 8 and is researched at the [Covert Ops](@/wiki/buildings/covert-ops.md) for 200 minerals and 200 gas (1,500 frames, 100 s). It has no effect on Zerg, since no Zerg unit is mechanical.

Lockdown is rare in professional play. When it appears it is aimed at high-value mechanical targets: Carriers, Arbiters (stopping Recall and Stasis), Battlecruisers or Siege Tanks. Keeping the Ghost cloaked helps it get close enough to cast.
