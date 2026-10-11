+++
title = "Lurker"
description = "The Lurker is a Zerg unit, added in Brood War, that morphs from a Hydralisk and attacks only while burrowed, hitting enemy ground units in a line with its spines."
slug = "lurker"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/lurker.jpg"
name_ko = "러커"
type = "ground"
minerals = 125
gas = 125
supply = 2
hp = 125
shields = 0
armor = 1
damage = 20
damage_type = "normal"
build_time = 40
attack_speed = 37
range = 6
speed = 5.82
size = "medium"
ground_attack = true
air_attack = false
dps = 8.11
sight = 8
morphs_from = "hydralisk"
abilities = []
upgrades = ["lurker-aspect", "missile-attacks", "carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Lurker was introduced in Brood War. It morphs from a Hydralisk after Lurker Aspect is researched at the Hydralisk Den (which requires a Lair). A Lurker cannot attack until it burrows; once burrowed it is invisible without detection and attacks with spines that damage every enemy ground unit in a line.

## Versus Terran

Lurkers are a key ZvT unit against Marine/Medic armies. Terran answers them with Comsat Station scans, Science Vessels and Siege Tanks, which outrange them.

## Versus Protoss

Lurkers are a core part of many ZvP armies, holding positions against Zealots and Dragoons and forcing Protoss to bring Observers.

## Versus Zerg

Lurkers appear in some ZvZ games to hold ground against Zerglings; the opponent needs Overlords or Spore Colonies to detect them.

## Key Mechanics

- 20 normal damage in a line, 37-frame cooldown, range 6
- Can only attack while burrowed; burrowed Lurkers need detection to be targeted
- The line splash hits enemy units only
- Total cost 125/125 (Hydralisk 75/25 plus 50/100 to morph), 2 supply
- 125 HP, 1 base armor, medium size; takes 4 slots in an Overlord
