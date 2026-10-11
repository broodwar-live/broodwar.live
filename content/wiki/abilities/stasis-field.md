+++
title = "Stasis Field"
description = "Stasis Field is an Arbiter spell that freezes all units in an area, making them untouchable for its duration."
slug = "stasis-field"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_ko = "스테이시스 필드"
caster = "arbiter"
energy = 100
hp_cost = 0
range = 9
aoe = "96×96 px"
duration = 69.9
hotkey = "T"
researched_at = "arbiter-tribunal"
research_minerals = 150
research_gas = 150
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Stasis_Field"]
verified = "2026-10-11"
+++
Stasis Field freezes every non-building, non-burrowed unit touching a 96×96-pixel square around the target point — enemy and friendly alike — for 131 status ticks (about 1,048 frames: roughly 70 game seconds, or about 44 seconds of real time on Fastest). Frozen units cannot move, attack or cast, and they are invulnerable: they cannot be attacked or targeted by spells (EMP Shockwave, Psionic Storm and Feedback all leave them alone). Restoration cannot end it; the units simply wait it out.

It costs 100 energy, has a range of 9 and is researched at the [Arbiter Tribunal](@/wiki/buildings/arbiter-tribunal.md) for 150 minerals and 150 gas (1,500 frames, 100 s).

Stasis is used to split an army. In PvT, freezing part of a Siege Tank line or the Terran reinforcements lets the Protoss fight the rest at an advantage. Because frozen units block movement, stasising enemies right in front of your own army can get in the way of your attack.
