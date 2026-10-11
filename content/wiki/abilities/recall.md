+++
title = "Recall"
description = "Recall is an Arbiter spell that teleports the caster's units from a target area to the Arbiter."
slug = "recall"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_ko = "리콜"
caster = "arbiter"
energy = 150
hp_cost = 0
aoe = "128×128 px"
hotkey = "R"
researched_at = "arbiter-tribunal"
research_minerals = 150
research_gas = 150
research_time = 120
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Recall"]
verified = "2026-10-11"
+++
Recall targets any point on the map; the Arbiter does not need to move. About 22 frames after the cast, every unit belonging to the caster in a 128×128-pixel square around the target point is teleported next to the Arbiter. Buildings, burrowed units, hallucinations and units in Stasis Field are left behind, as are allied players' units. The energy is spent the moment the spell is cast. Ground units cannot be recalled onto terrain they could not stand on.

It costs 150 energy and is researched at the [Arbiter Tribunal](@/wiki/buildings/arbiter-tribunal.md) for 150 minerals and 150 gas (1,800 frames, 120 s).

Recall is mostly a late-game PvT weapon: an Arbiter slips into the Terran main or an expansion and brings the army in behind the tank lines. The Arbiter itself is not cloaked (it cloaks the units around it), so Terrans patrol vulnerable areas with Science Vessels to EMP or shoot down incoming Arbiters, and place Spider Mines and turrets where a Recall is likely.
