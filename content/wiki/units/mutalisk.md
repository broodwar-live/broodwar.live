+++
title = "Mutalisk"
description = "The Mutalisk is a fast Zerg flyer, hatched from larva after a Spire, whose bouncing glaive attack hits ground and air targets."
slug = "mutalisk"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/mutalisk.jpg"
name_ko = "뮤탈리스크"
type = "air"
minerals = 100
gas = 100
supply = 2
hp = 120
shields = 0
armor = 0
damage = 9
damage_type = "normal"
build_time = 40
attack_speed = 30
range = 3
speed = 6.67
size = "small"
ground_attack = true
air_attack = true
dps = 4.5
sight = 7
built_from = "hatchery"
hotkey = "M"
requires = ["spire"]
abilities = []
upgrades = ["flyer-attacks", "flyer-carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Mutalisk requires a Spire. It is fast, attacks both ground and air, and its Glave Wurm bounces from the first target to up to two more nearby targets for reduced damage. Mutalisks are also the base unit for Guardians and Devourers once a Greater Spire is built.

## Versus Terran

Mutalisks are used in ZvT to harass Terran bases and pick off Medics, Science Vessels and isolated units. Terran answers with Missile Turrets, Marines and Valkyries.

## Versus Protoss

In ZvP, Mutalisks can harass Protoss mineral lines and force Photon Cannons, although Corsairs, Archons and Dragoons counter them in direct fights.

## Versus Zerg

Mutalisk battles are central to ZvZ, where the player with more Mutalisks or better Scourge use often wins air control.

## Key Mechanics

- 9 normal damage, 30-frame cooldown, range 3, hits ground and air
- The glaive bounces to two more targets, dealing one third and then one ninth of the damage
- 120 HP, 0 armor, small size
