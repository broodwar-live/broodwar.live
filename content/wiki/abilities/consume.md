+++
title = "Consume"
description = "Consume lets a Defiler sacrifice one of its own Zerg units to gain 50 energy."
slug = "consume"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_ko = "컨슘"
caster = "defiler"
energy = 0
hp_cost = 0
hotkey = "C"
researched_at = "defiler-mound"
research_minerals = 100
research_gas = 100
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Consume"]
verified = "2026-10-11"
+++
Consume kills one of the caster's own units and gives the Defiler 50 energy, capped at its maximum (200, or 250 with the Defiler energy upgrade). The amount is the same whatever the sacrificed unit's cost or remaining HP. Larvae, buildings and units in Stasis Field cannot be consumed, and consuming a hallucination grants no energy.

It costs no energy, needs the Defiler to be in contact with the target, and is researched at the [Defiler Mound](@/wiki/buildings/defiler-mound.md) for 100 minerals and 100 gas (1,500 frames, 100 s).

Consume is what lets Defilers cast repeatedly: one pair of Zerglings (50 minerals) yields 100 energy, enough for a Dark Swarm. In late-game ZvT and ZvP, Zerg players keep Zerglings near their Defilers for this purpose, and running out of fodder in the middle of a fight leaves the Defiler unable to cast.
