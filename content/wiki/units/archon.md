+++
title = "Archon"
description = "The Archon is a powerful Protoss unit formed by merging two High Templar, with 350 shields and a splash-damage attack against ground and air."
slug = "archon"
template = "wiki/unit.html"
[taxonomies]
race = ["protoss"]
[extra]
image = "/images/wiki/units/archon.jpg"
name_ko = "아콘"
type = "ground"
minerals = 100
gas = 300
supply = 4
hp = 10
shields = 350
armor = 0
damage = 30
damage_type = "normal"
build_time = 20
attack_speed = 20
range = 2
speed = 4.92
size = "large"
ground_attack = true
air_attack = true
dps = 22.5
sight = 8
merges_from = "high-templar"
abilities = []
upgrades = ["ground-weapons", "ground-armor", "plasma-shields"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
An Archon is created by merging two High Templar. It has only 10 HP but 350 shields, and its psionic attack deals splash damage to both ground and air units at short range.

## Versus Terran

Archons are useful against Marines and Vultures, but EMP Shockwave removes their shields and leaves them very vulnerable.

## Versus Protoss

Archons appear in some PvP games, usually in the mid and late game.

## Versus Zerg

Archons are especially strong in PvZ because their splash damage is effective against groups of Mutalisks and Zerglings.

## Key Mechanics

- 30 normal damage with splash, 20-frame cooldown, range 2, hits ground and air
- 10 HP, 350 shields, 0 armor, large size
- Cost equals two High Templar (100/300) and 4 supply; merging takes 20 seconds
- Takes 4 slots in a Shuttle
