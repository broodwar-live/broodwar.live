+++
title = "Infested Terran"
description = "The Infested Terran is a Zerg suicide unit produced from an Infested Command Center that explodes for 500 damage in an area."
slug = "infested-terran"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/infested-terran.jpg"
name_ko = "감염된 테란"
type = "ground"
minerals = 100
gas = 50
supply = 1
hp = 60
shields = 0
armor = 0
damage = 500
damage_type = "explosive"
build_time = 40
attack_speed = 0
range = 0
speed = 5.82
size = "small"
ground_attack = true
air_attack = false
sight = 5
built_from = "infested-command-center"
abilities = ["burrow"]
upgrades = ["carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
Infested Terrans can only be produced from an Infested Command Center, which a Queen creates by infesting a Terran Command Center that is below half HP. The unit runs at the target and explodes, dealing heavy splash damage.

## Role in Competitive Play

Infested Terrans are almost never seen in competitive play because the opponent must be Terran and must let a damaged Command Center be infested. They are a curiosity rather than a strategic option.

## Key Mechanics

- 500 explosive splash damage on detonation, ground only; the unit dies when it explodes
- 60 HP, 0 armor, small size
- Can burrow after the Burrow research
