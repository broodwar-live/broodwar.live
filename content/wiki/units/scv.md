+++
title = "SCV"
description = "The SCV is the Terran worker unit, built from the Command Center, that gathers resources, constructs buildings and repairs mechanical units and structures."
slug = "scv"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/scv.jpg"
name_ko = "건설로봇"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 60
shields = 0
armor = 0
damage = 5
damage_type = "normal"
build_time = 20
attack_speed = 15
range = 1
speed = 4.92
size = "small"
ground_attack = true
air_attack = false
dps = 5.0
sight = 7
built_from = "command-center"
abilities = []
upgrades = ["infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The SCV is the Terran worker. It gathers minerals and gas, constructs every Terran building, and can repair mechanical units and buildings for a fraction of their cost. Unlike a Drone, an SCV is not consumed when it constructs a building; it stays occupied until the structure is complete.

## Role in All Matchups

SCVs are the foundation of the Terran economy. Beyond mining, players use them to repair Bunkers, Siege Tanks and Battlecruisers, to wall in at the top of a ramp in TvZ, and occasionally to fight in early-game emergencies thanks to their 60 HP, the highest of the three workers.

## Key Mechanics

- 5 normal damage, 15-frame cooldown, melee range
- 60 HP, 0 armor, small size
- Returns 8 minerals per trip from a mineral field
- Repair costs resources and restores HP to mechanical units and Terran buildings
