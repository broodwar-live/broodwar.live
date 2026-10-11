+++
title = "Dragoon"
description = "The Dragoon is the Protoss Gateway's ranged walker, requiring a Cybernetics Core, that attacks ground and air with explosive damage."
slug = "dragoon"
template = "wiki/unit.html"
[taxonomies]
race = ["protoss"]
[extra]
image = "/images/wiki/units/dragoon.jpg"
name_ko = "드라군"
type = "ground"
minerals = 125
gas = 50
supply = 2
hp = 100
shields = 80
armor = 1
damage = 20
damage_type = "explosive"
build_time = 50
attack_speed = 30
range = 4
range_upgraded = 6
speed = 5.0
size = "large"
ground_attack = true
air_attack = true
dps = 10.0
sight = 8
built_from = "gateway"
hotkey = "D"
requires = ["cybernetics-core"]
abilities = []
upgrades = ["ground-weapons", "ground-armor", "plasma-shields"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Dragoon is built at the Gateway once a Cybernetics Core is completed. It is a durable ranged unit that can hit ground and air targets. Singularity Charge, researched at the Cybernetics Core, increases its range from 4 to 6 and is a standard upgrade.

## Versus Terran

Dragoons are the core of Protoss armies in PvT, fighting Vultures, Siege Tanks and Goliaths. Their explosive damage is effective against large mechanical units but weak against small units such as Marines.

## Versus Protoss

PvP is often decided by early Dragoon battles, where micro and focus fire matter a great deal. Reavers are a strong counter to groups of Dragoons.

## Versus Zerg

Dragoons are less central in PvZ because their explosive damage is weak against Zerglings, but they are useful against Mutalisks and Lurkers.

## Key Mechanics

- 20 explosive damage, 30-frame cooldown, range 4 (6 with Singularity Charge), hits ground and air
- Explosive damage: 100% vs large, 75% vs medium, 50% vs small
- 100 HP, 80 shields, 1 base armor, large size
- Takes 4 slots in a Shuttle
