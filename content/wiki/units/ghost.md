+++
title = "Ghost"
description = "The Ghost is a Terran infantry spellcaster that can cloak, disable mechanical units with Lockdown and call down Nuclear Strikes."
slug = "ghost"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/ghost.jpg"
name_ko = "고스트"
type = "ground"
minerals = 25
gas = 75
supply = 1
hp = 45
shields = 0
armor = 0
damage = 10
damage_type = "concussive"
build_time = 50
attack_speed = 22
range = 7
speed = 4.0
size = "small"
ground_attack = true
air_attack = true
dps = 6.82
sight = 9
built_from = "barracks"
abilities = ["lockdown", "nuclear-strike", "cloaking-field"]
upgrades = ["infantry-weapons", "infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Ghost is a Barracks infantry unit that requires an Academy and a Covert Ops add-on on the Science Facility. It has a modest concussive rifle, but its value comes from its abilities: Personnel Cloaking, Lockdown and Nuclear Strike.

## Versus Zerg

Ghosts are uncommon in TvZ. Lockdown only affects mechanical units, so it has no targets in a Zerg army, and the Ghost's concussive attack is weak against larger Zerg units.

## Versus Terran

Lockdown can disable Siege Tanks, Goliaths, Dropships, Battlecruisers and other mechanical units, so Ghosts occasionally appear in long TvT games.

## Versus Protoss

Lockdown works on Protoss mechanical units such as Dragoons, Reavers, Shuttles, Carriers and Arbiters, which gives Ghosts a niche role in late-game TvP, especially against Carrier and Arbiter play.

## Key Mechanics

- 10 concussive damage, 22-frame cooldown, range 7; hits both ground and air
- Lockdown (100 energy, researched at Covert Ops) temporarily disables a mechanical unit
- Personnel Cloaking (25 energy to activate, then drains energy) makes the Ghost invisible to units without detection
- Nuclear Strike requires a Nuclear Silo add-on on a Command Center; the Ghost must stay alive and in place while the missile is guided in
