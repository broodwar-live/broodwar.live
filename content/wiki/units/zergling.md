+++
title = "Zergling"
description = "The Zergling is the Zerg's fast, cheap melee unit, hatched in pairs from a single larva after a Spawning Pool is built."
slug = "zergling"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/zergling.jpg"
name_ko = "저글링"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 35
shields = 0
armor = 0
damage = 5
damage_type = "normal"
build_time = 28
attack_speed = 8
range = 1
speed = 5.49
speed_upgraded = 8.24
size = "small"
ground_attack = true
air_attack = false
dps = 9.38
sight = 5
built_from = "hatchery"
hotkey = "Z"
requires = ["spawning-pool"]
abilities = ["burrow"]
upgrades = ["metabolic-boost", "adrenal-glands", "melee-attacks", "carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
Zerglings are the first Zerg combat unit. One larva produces two Zerglings for 50 minerals and 1 supply in total. They are fragile individually, but very fast once Metabolic Boost is researched, and Adrenal Glands (which requires a Hive) greatly increases their attack rate late in the game.

## Versus Terran

In ZvT, Zerglings are used for early pressure and map control, and later as a cheap partner for Lurkers, Defilers and Ultralisks. Under Dark Swarm they can attack Terran ground armies without taking ranged fire.

## Versus Protoss

Zerglings help defend and harass in ZvP, run past Protoss armies to attack expansions, and in the late game fight alongside Ultralisks and Defilers.

## Versus Zerg

ZvZ often starts with Zergling fights, and early Zergling control and timing can decide the game before Mutalisks arrive.

## Key Mechanics

- 5 normal damage, 8-frame cooldown, melee
- Metabolic Boost (Spawning Pool) increases movement speed
- Adrenal Glands (Spawning Pool, requires Hive) increases attack speed
- 35 HP, 0 armor, small size; can burrow after the Burrow research
