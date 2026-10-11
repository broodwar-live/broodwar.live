+++
title = "Restoration"
description = "Restoration is a Medic spell that removes harmful status effects from a single unit."
slug = "restoration"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "레스토레이션"
caster = "medic"
energy = 50
hp_cost = 0
range = 6
hotkey = "R"
researched_at = "academy"
research_minerals = 100
research_gas = 100
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Restoration"]
verified = "2026-10-11"
+++
Restoration cleanses one non-building unit. In the engine it removes Parasite, Optical Flare blindness, Ensnare, Plague, Irradiate, Lockdown, Maelstrom and Acid Spores. It does **not** end Stasis Field. Casting it on a hallucination destroys the hallucination.

It costs 50 energy, has a range of 6 and is researched at the [Academy](@/wiki/buildings/academy.md) for 100 minerals and 100 gas (1,200 frames, 80 s).

Restoration is seldom researched in professional games. Its typical uses are saving an expensive unit — a Battlecruiser or Siege Tank under Plague or Lockdown — or removing a Parasite from a unit that is feeding the opponent vision. Its energy competes with the Medic's healing.
