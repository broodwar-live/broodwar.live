+++
title = "Optical Flare"
description = "Optical Flare is a Medic spell that blinds a unit, cutting its sight range and removing its detection."
slug = "optical-flare"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "옵티컬 플레어"
caster = "medic"
energy = 75
hp_cost = 0
range = 9
hotkey = "F"
researched_at = "academy"
research_minerals = 100
research_gas = 100
research_time = 120
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Optical_Flare"]
verified = "2026-10-11"
+++
Optical Flare permanently blinds a single non-building unit. In the engine a blinded unit's sight range drops to 2 tiles and it can no longer act as a detector. The effect lasts until the unit dies or a Medic removes it with Restoration. Flaring a hallucination destroys it.

It costs 75 energy, has a range of 9 and is researched at the [Academy](@/wiki/buildings/academy.md) for 100 minerals and 100 gas (1,800 frames, 120 s).

Flare is rarely used. Its main purpose is to take away detection — blinding an Observer or Overlord so that cloaked Wraiths, Ghosts or Spider Mines can operate — and a blinded detector does not stand out when the opponent has several units selected.
