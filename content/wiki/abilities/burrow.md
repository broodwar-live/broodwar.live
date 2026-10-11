+++
title = "Burrow"
description = "Burrow lets most Zerg ground units hide underground, invisible to enemies without detection."
slug = "burrow"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_ko = "버로우"
caster = "zergling"
energy = 0
hp_cost = 0
hotkey = "U"
researched_at = "hatchery"
research_minerals = 100
research_gas = 100
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Burrow"]
verified = "2026-10-11"
+++
Burrow lets a Zerg ground unit dig into the ground, where enemies can only see it with detection. A burrowed unit cannot move and — except for the Lurker — cannot attack, but it keeps providing vision. Burrowing costs no energy and can be toggled at will.

The research is done at a [Hatchery](@/wiki/buildings/hatchery.md) (or Lair/Hive) for 100 minerals and 100 gas (1,200 frames, 80 s). It applies to Drones, Zerglings, Hydralisks, Defilers and Infested Terrans. Lurkers burrow without the research and can attack only while burrowed; Ultralisks cannot burrow.

Burrow is not a standard research but has real uses: burrowed Zerglings act as scouts and can block an opponent from placing a base at an expansion, burrowed Drones can survive harassment such as Reaver drops, and burrowed units are not hit by Irradiate splash, Plague or Ensnare. Comsat scans and every mobile or static detector reveal burrowed units.
