+++
title = "Probe"
description = "The Probe is the Protoss worker unit, built from the Nexus, that gathers resources and warps in buildings without having to stay during construction."
slug = "probe"
template = "wiki/unit.html"
[taxonomies]
race = ["protoss"]
[extra]
image = "/images/wiki/units/probe.jpg"
name_ko = "프로브"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 20
shields = 20
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
sight = 8
built_from = "nexus"
abilities = []
upgrades = ["ground-armor", "plasma-shields"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Probe gathers minerals and gas and places Protoss buildings. Unlike an SCV or a Drone, it only needs to start the warp-in; the building then completes on its own, so one Probe can start several buildings in quick succession.

## Role in All Matchups

Probes are the base of the Protoss economy. They are also used for early scouting, for blocking or harassing the opponent's worker scout, and in some builds to place proxy Gateways or Pylons near the enemy base.

## Key Mechanics

- 5 normal damage, 22-frame cooldown, melee
- 20 HP and 20 shields, 0 armor, small size
- Returns 8 minerals per trip from a mineral field
