+++
title = "Dark Archon"
description = "The Dark Archon is a Protoss spellcaster, added in Brood War, formed by merging two Dark Templar and able to cast Feedback, Mind Control and Maelstrom."
slug = "dark-archon"
template = "wiki/unit.html"
[taxonomies]
race = ["protoss"]
[extra]
image = "/images/wiki/units/dark-archon.jpg"
name_ko = "다크 아콘"
type = "ground"
minerals = 250
gas = 200
supply = 4
hp = 25
shields = 200
armor = 1
damage = 0
damage_type = "normal"
build_time = 20
attack_speed = 0
range = 0
speed = 4.92
size = "large"
ground_attack = false
air_attack = false
sight = 10
merges_from = "dark-templar"
abilities = ["mind-control", "maelstrom", "feedback"]
upgrades = ["mind-control", "maelstrom", "ground-armor", "plasma-shields"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Dark Archon is created by merging two Dark Templar. It has no attack and relies on three spells: Feedback, Maelstrom and Mind Control.

## Role in Competitive Play

Dark Archons are uncommon. Mind Control can steal an enemy unit, and in PvZ or PvT stealing a worker can give Protoss access to a second race's buildings and units. Maelstrom stops biological units for a short time and has been used against Zerg. Feedback drains the target's energy and damages it by the same amount.

## Key Mechanics

- Feedback (50 energy): removes all of the target's energy and deals damage equal to the energy removed
- Mind Control (150 energy, researched at the Templar Archives): permanently takes control of the target, but drains the Dark Archon's shields
- Maelstrom (100 energy, researched at the Templar Archives): stops biological units in an area from moving or attacking for a short time
- 25 HP, 200 shields, 1 base armor, large size; cost equals two Dark Templar (250/200)
