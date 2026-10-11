+++
title = "Plague"
description = "Plague is a Defiler spell that deals heavy damage over time but cannot kill its targets."
slug = "plague"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_ko = "플레이그"
caster = "defiler"
energy = 150
hp_cost = 0
damage = 300
range = 9
aoe = "128×128 px"
duration = 40.0
hotkey = "G"
researched_at = "defiler-mound"
research_minerals = 200
research_gas = 200
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Plague"]
verified = "2026-10-11"
+++
Plague infects every non-burrowed unit and building touching a 128×128-pixel square around the target point, friend or foe (but not the casting Defiler). For 75 status ticks (600 frames — 40 game seconds, about 25 seconds of real time on Fastest) each victim loses about 3.95 hit points per tick, roughly 296 in total against a nominal 300. The damage goes straight to hit points: it ignores armor and does not touch Protoss shields. A tick is skipped whenever it would kill the unit, so Plague alone never finishes anything off.

It costs 150 energy, has a range of 9 and is researched at the [Defiler Mound](@/wiki/buildings/defiler-mound.md) for 200 minerals and 200 gas (1,500 frames, 100 s). A plagued cloaked unit is visible to the enemy, and Restoration removes the effect.

Plague is most effective against Terran: Marines, Medics, Science Vessels and tanks are left at a few HP for Zerglings or Mutalisks to finish, and Terran buildings that fall into the burning range may burn down unless repaired. Protoss units keep their shields, so the spell is weaker in ZvP, though it still cripples high-HP targets such as Carriers.
