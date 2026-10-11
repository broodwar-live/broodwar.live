+++
title = "Medic"
description = "The Medic is a Terran Barracks support unit, added in Brood War, that heals biological units and can cast Restoration and Optical Flare."
slug = "medic"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/medic.jpg"
name_ko = "메딕"
type = "ground"
minerals = 50
gas = 25
supply = 1
hp = 60
shields = 0
armor = 1
damage = 0
damage_type = "normal"
build_time = 30
attack_speed = 0
range = 0
speed = 4.0
size = "small"
ground_attack = false
air_attack = false
sight = 9
built_from = "barracks"
abilities = ["restoration", "optical-flare"]
upgrades = ["infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Medic was added in Brood War. It is built at the Barracks after an Academy is completed and has no attack. Instead it automatically heals nearby biological units using energy, which makes Marine/Medic groups far more durable than Marines alone.

## Versus Zerg

Medics are a core part of Terran bio in TvZ. They keep Marines alive through Zergling and Mutalisk engagements, and Restoration can remove Ensnare, Parasite and similar effects.

## Versus Terran

Medics are rarely used in TvT, where infantry is not the main army.

## Versus Protoss

Medics see limited use in TvP because Terran usually plays mech; they appear mainly in less common bio-based builds.

## Key Mechanics

- Healing restores HP to biological units at the cost of energy
- Restoration (50 energy, researched at the Academy) removes most negative status effects, such as Ensnare, Parasite, Irradiate, Plague and Lockdown
- Optical Flare (75 energy, researched at the Academy) reduces the target unit's sight range for the rest of its life
- 60 HP, 1 base armor, small size
