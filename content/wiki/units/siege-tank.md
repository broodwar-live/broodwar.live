+++
title = "Siege Tank"
description = "The Siege Tank is the Terran Factory's armored artillery unit that can switch to Siege Mode for long-range explosive splash damage."
slug = "siege-tank"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/siege-tank.jpg"
name_ko = "시즈 탱크"
type = "ground"
minerals = 150
gas = 100
supply = 2
hp = 150
shields = 0
armor = 1
damage = 30
damage_type = "explosive"
build_time = 50
attack_speed = 37
range = 7
speed = 4.0
size = "large"
ground_attack = true
air_attack = false
dps = 12.16
sight = 10
built_from = "factory"
hotkey = "T"
abilities = ["siege-mode"]
upgrades = ["siege-tech", "vehicle-weapons", "vehicle-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Siege Tank requires a Machine Shop add-on on the Factory. In Tank Mode it is a mobile ground unit; after Siege Mode is researched it can deploy into a stationary artillery platform with much greater range and damage. Sieged tanks define how Terran controls space in every matchup.

## Versus Zerg

Siege Tanks support both bio and mech styles in TvZ, breaking Lurker positions from outside their range and protecting expansions. Dark Swarm is the main way Zerg neutralizes them.

## Versus Terran

TvT is largely a positional battle between tank lines. Players fight over high ground, use Dropships to land tanks behind enemy lines, and protect their own lines with Spider Mines and Goliaths.

## Versus Protoss

Tanks are the backbone of Terran mech in TvP, holding positions against Dragoons and Zealots. Protoss counters with flanking attacks, Zealot charges into the minimum-range gap, Arbiter Stasis and Recall, and Carriers.

## Key Mechanics

- Tank Mode: 30 explosive damage, 37-frame cooldown, range 7
- Siege Mode: 70 explosive damage with splash, 75-frame cooldown, range 12, minimum range 2
- Siege-mode splash also damages friendly units in the blast
- Explosive damage: 100% vs large, 75% vs medium, 50% vs small units
- Takes 4 slots in a Dropship
