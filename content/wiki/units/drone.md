+++
title = "Drone"
description = "The Drone is the Zerg worker unit, morphed from larva, that gathers resources and is consumed when it mutates into a building."
slug = "drone"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/drone.jpg"
name_ko = "드론"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 40
shields = 0
armor = 0
damage = 5
damage_type = "normal"
build_time = 20
attack_speed = 22
range = 1
speed = 4.92
size = "small"
ground_attack = true
air_attack = false
dps = 3.41
sight = 7
built_from = "hatchery"
abilities = ["burrow"]
upgrades = ["carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Drone gathers minerals and gas like the other races' workers, but it also becomes the building when the Zerg player constructs a structure. Every Zerg building therefore costs a Drone as well as its listed resources, so balancing Drones, buildings and army is the central economic decision for Zerg.

## Role in All Matchups

Zerg players try to make as many Drones as they safely can, then switch production to army when an attack is coming. Losing Drones hurts Zerg particularly badly, so worker harassment from Vultures, Reavers, Mutalisks or Dark Templar is a common way to attack a Zerg economy.

## Key Mechanics

- 5 normal damage, 22-frame cooldown, melee
- 40 HP, 0 armor, small size
- Returns 8 minerals per trip from a mineral field
- Consumed when it morphs into a building; cancelling the building returns the Drone along with most of the cost
- The "extractor trick": morphing an Extractor at the supply cap frees a supply slot, allowing an extra unit to be made before the Extractor is cancelled
