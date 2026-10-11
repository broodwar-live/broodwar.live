+++
title = "Wraith"
description = "The Wraith is a Terran Starport fighter with a strong air-to-air missile attack, a weaker ground laser and the ability to cloak after research at the Control Tower."
slug = "wraith"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/wraith.jpg"
name_ko = "레이스"
type = "air"
minerals = 150
gas = 100
supply = 2
hp = 120
shields = 0
armor = 0
damage = 8
damage_type = "normal"
build_time = 60
attack_speed = 30
range = 5
speed = 6.67
size = "large"
ground_attack = true
air_attack = true
dps = 4.0
sight = 7
built_from = "starport"
abilities = []
upgrades = ["cloaking-field", "ship-weapons", "ship-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Wraith is the basic Starport combat ship. Its Gemini missiles deal 20 explosive damage to air targets, while its burst lasers deal 8 normal damage to ground targets. With Cloaking Field researched at the Control Tower, Wraiths can turn invisible at the cost of energy.

## Versus Zerg

Wraiths are an uncommon choice in TvZ; they can hunt Overlords but are vulnerable to Scourge, Mutalisks and Hydralisks.

## Versus Terran

Wraith openings, often with cloak, are a known TvT strategy for harassing and forcing the opponent to invest in Missile Turrets, Comsat Station scans and Goliaths.

## Versus Protoss

Wraiths are rare in standard TvP because Protoss has strong anti-air in Dragoons and Observers can detect cloaked Wraiths.

## Key Mechanics

- Air: 20 explosive damage, 22-frame cooldown, range 5
- Ground: 8 normal damage, 30-frame cooldown, range 5
- Cloaking Field: 25 energy to activate, then drains energy over time
- Large size, 120 HP, 0 armor
