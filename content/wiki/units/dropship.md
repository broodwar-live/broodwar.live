+++
title = "Dropship"
description = "The Dropship is the Terran Starport transport, requiring a Control Tower, that carries up to eight slots of ground units."
slug = "dropship"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/dropship.jpg"
name_ko = "드랍십"
type = "air"
minerals = 100
gas = 100
supply = 2
hp = 150
shields = 0
armor = 1
damage = 0
damage_type = "normal"
build_time = 50
attack_speed = 0
range = 0
speed = 5.47
size = "large"
ground_attack = false
air_attack = false
sight = 8
built_from = "starport"
abilities = []
upgrades = ["ship-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Dropship is built at a Starport with a Control Tower. It has no attack and carries up to 8 slots of ground units. It is the vehicle for Terran drop play: landing Siege Tanks, Vultures or infantry on cliffs, behind enemy armies or in undefended expansions.

## Versus Zerg

Marine/Medic drops into Zerg expansions and mineral lines are a common way to put pressure on Zerg while the main army holds position.

## Versus Terran

Tank and Vulture drops are an important tool for breaking or flanking tank lines in TvT.

## Versus Protoss

Terran uses Dropships in TvP to land tanks and Vultures in unexpected places, forcing Protoss to split its army.

## Key Mechanics

- Capacity: 8 slots. Marines, Firebats, Medics, Ghosts and SCVs take 1, Vultures and Goliaths take 2, Siege Tanks take 4
- Large size, 150 HP, 1 base armor
- If a loaded Dropship is destroyed, every unit inside dies with it
