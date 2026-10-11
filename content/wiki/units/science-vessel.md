+++
title = "Science Vessel"
description = "The Science Vessel is a Terran Starport support ship and detector that casts Defensive Matrix, EMP Shockwave and Irradiate."
slug = "science-vessel"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/science-vessel.jpg"
name_ko = "사이언스 베슬"
type = "air"
minerals = 100
gas = 225
supply = 2
hp = 200
shields = 0
armor = 1
damage = 0
damage_type = "normal"
build_time = 80
attack_speed = 0
range = 0
speed = 5.0
size = "large"
ground_attack = false
air_attack = false
sight = 10
built_from = "starport"
abilities = ["defensive-matrix", "emp-shockwave", "irradiate"]
upgrades = ["irradiate", "ship-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Science Vessel requires a Starport with a Control Tower and a Science Facility. It has no attack, but it is a mobile detector and carries three spells, which make it one of Terran's most important units in TvZ and TvP.

## Versus Zerg

Science Vessels are essential in TvZ. They detect Lurkers, and Irradiate kills Mutalisks, Defilers and Lurkers, which are all biological. Keeping Vessels alive against Scourge is a constant concern.

## Versus Terran

In TvT, Vessels are used mostly as detectors against cloaked Wraiths and Ghosts, and Defensive Matrix can protect a key unit.

## Versus Protoss

EMP Shockwave removes shields and energy in an area, so Vessels are the key answer to High Templar, Arbiters and shield-heavy units such as Archons.

## Key Mechanics

- Detector
- Defensive Matrix (100 energy) puts a damage-absorbing barrier on a unit
- EMP Shockwave (100 energy, researched at the Science Facility) removes all shields and energy in the target area
- Irradiate (75 energy, researched at the Science Facility) deals damage over time to biological units around the target
