+++
title = "Firebat"
description = "The Firebat is a Terran Barracks infantry unit that requires an Academy and deals short-range concussive splash damage, making it strong against small melee units."
slug = "firebat"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/firebat.jpg"
name_ko = "파이어뱃"
type = "ground"
minerals = 50
gas = 25
supply = 1
hp = 50
shields = 0
armor = 1
damage = 8
damage_type = "concussive"
build_time = 24
attack_speed = 22
range = 1
speed = 4.0
size = "small"
ground_attack = true
air_attack = false
sight = 7
built_from = "barracks"
hotkey = "F"
requires = ["academy"]
abilities = []
upgrades = ["stim-pack", "infantry-weapons", "infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://liquipedia.net/starcraft/Firebat"]
verified = "2026-10-11"
+++
The Firebat is a short-ranged flamethrower infantry unit built at the Barracks once an Academy is finished. Each flame burst produces up to three small splash hits of 8 concussive damage each, laid out in a line in front of the Firebat; a typical target is caught by two of them, which is why the game lists the attack as 16 damage. This is very effective against small units such as Zerglings and Zealots but weak against medium and large targets.

## Versus Zerg

Firebats are mainly used early in TvZ, for example inside a Bunker or alongside Marines, to hold off Zergling attacks. They are usually a small supplement to a Marine/Medic army rather than its core.

## Versus Terran

Firebats see very little use in TvT, where the fighting revolves around Factory and Starport units.

## Versus Protoss

Against Protoss, Firebats can help defend against early Zealot attacks, but because most Terran players move to mech in TvP they are rarely built in large numbers.

## Key Mechanics

- 8 concussive damage per hit, up to 3 splash hits per attack (2 on a typical target, shown in-game as 16 damage), 22-frame cooldown, very short range
- Concussive damage: 100% vs small, 50% vs medium, 25% vs large units
- Can use Stim Pack (costs 10 HP) like the Marine
- 50 HP and 1 base armor, more durable than a Marine
