+++
title = "Marine"
description = "The Marine is the Terran's basic Barracks infantry unit, a cheap 50-mineral rifleman that can shoot both ground and air targets."
slug = "marine"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/marine.jpg"
name_ko = "마린"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 40
shields = 0
armor = 0
damage = 6
damage_type = "normal"
build_time = 24
attack_speed = 15
range = 4
range_upgraded = 5
speed = 4.0
size = "small"
ground_attack = true
air_attack = true
dps = 6.0
sight = 7
built_from = "barracks"
hotkey = "M"
abilities = ["stim-pack"]
upgrades = ["stim-pack", "u-238-shells", "infantry-weapons", "infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Marine is the first combat unit available to Terran and one of the most important. It costs only 50 minerals, attacks both ground and air, and scales well with Stim Pack, U-238 Shells, Medic support and infantry upgrades. Because it is small and fragile, its value depends heavily on how well it is controlled against splash damage.

## Versus Zerg

Marines are the backbone of the standard bio style in TvZ: Marine/Medic groups backed by Science Vessels. Stimmed Marines deal well with Mutalisks and Zerglings, while Lurkers, Dark Swarm and Plague are the main threats. Splitting Marines against Lurker spines and Mutalisk bounces is a core Terran skill.

## Versus Terran

In TvT the game is decided mostly by Siege Tanks, Vultures, Goliaths and air units. Marines usually appear in small numbers early on, typically in a Bunker for defence.

## Versus Protoss

In TvP Terran usually transitions to mech (Siege Tanks, Vultures, Goliaths). Marines are mainly an early-game defensive unit, often placed in a Bunker against Zealot or Dragoon pressure. Large bio armies are uncommon in the matchup because Psionic Storm and Reavers punish clumped infantry.

## Key Mechanics

- 6 normal damage, 15-frame cooldown, range 4 (5 with U-238 Shells)
- Stim Pack (researched at the Academy) costs the Marine 10 HP and temporarily increases attack and movement speed
- Normal damage deals full damage to every unit size, so Marines are equally effective against small, medium and large targets before armor
- Occupies 1 slot in a Bunker or transport
