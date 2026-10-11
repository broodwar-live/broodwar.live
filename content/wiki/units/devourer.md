+++
title = "Devourer"
description = "The Devourer is a Zerg air-to-air unit, added in Brood War and morphed from a Mutalisk at a Greater Spire, whose attacks stack Acid Spores on its targets."
slug = "devourer"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/devourer.jpg"
name_ko = "디바우러"
type = "air"
minerals = 250
gas = 150
supply = 2
hp = 250
shields = 0
armor = 2
damage = 25
damage_type = "explosive"
build_time = 40
attack_speed = 100
range = 6
speed = 5.0
size = "large"
ground_attack = false
air_attack = true
dps = 3.75
sight = 10
morphs_from = "mutalisk"
abilities = []
upgrades = ["flyer-attacks", "flyer-carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Devourer was introduced in Brood War. It morphs from a Mutalisk once a Greater Spire is built and attacks only air units. Each hit leaves Acid Spores on the target, which lower its armor and slow its attack rate; the effect stacks up to nine times.

## Role in Competitive Play

Devourers are uncommon. They are mostly seen in long games where Zerg needs to deal with large groups of air units, such as Corsairs, Carriers or Wraiths, often alongside Mutalisks or Scourge.

## Key Mechanics

- 25 explosive damage, 100-frame cooldown, range 6, air targets only
- Acid Spores: each stack reduces the target's armor by 1 and increases its attack cooldown; up to 9 stacks
- Total cost 250/150 (Mutalisk 100/100 plus 150/50 to morph), 2 supply
- 250 HP, 2 base armor, large size
