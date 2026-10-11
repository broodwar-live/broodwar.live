+++
title = "Hydralisk"
description = "The Hydralisk is the Zerg's main ranged ground unit, hatched from larva after a Hydralisk Den, able to hit both ground and air and to morph into a Lurker."
slug = "hydralisk"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/hydralisk.jpg"
name_ko = "히드라리스크"
type = "ground"
minerals = 75
gas = 25
supply = 1
hp = 80
shields = 0
armor = 0
damage = 10
damage_type = "explosive"
build_time = 28
attack_speed = 15
range = 4
range_upgraded = 5
speed = 3.66
speed_upgraded = 5.49
size = "medium"
ground_attack = true
air_attack = true
dps = 10.0
sight = 6
built_from = "hatchery"
hotkey = "H"
requires = ["hydralisk-den"]
abilities = ["burrow"]
upgrades = ["muscular-augments", "grooved-spines", "lurker-aspect", "missile-attacks", "carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Hydralisk is a 75/25 ranged unit that attacks ground and air targets with explosive spines. Muscular Augments (speed) and Grooved Spines (range) are researched at the Hydralisk Den, and after Lurker Aspect is researched, Hydralisks can morph into Lurkers.

## Versus Terran

In ZvT, Hydralisks are mainly used as the base unit for Lurkers. Massed Hydralisks are weak against Terran bio, Siege Tanks and Science Vessel Irradiate.

## Versus Protoss

Hydralisks are a standard part of ZvP armies, often with Zerglings and Lurkers. They provide anti-air against Corsairs, Shuttles and Scouts, but are vulnerable to Psionic Storm and Reavers.

## Versus Zerg

Hydralisks appear in some ZvZ games, mostly as anti-air against Mutalisks or as the base for Lurkers.

## Key Mechanics

- 10 explosive damage, 15-frame cooldown, range 4 (5 with Grooved Spines)
- Explosive damage: 100% vs large, 75% vs medium, 50% vs small
- Muscular Augments increases movement speed
- 80 HP, 0 armor, medium size; can burrow after the Burrow research
