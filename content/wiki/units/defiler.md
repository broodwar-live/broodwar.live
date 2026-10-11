+++
title = "Defiler"
description = "The Defiler is the Zerg's late-game ground spellcaster, hatched from larva after a Defiler Mound, that casts Dark Swarm and Plague and regains energy with Consume."
slug = "defiler"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/defiler.jpg"
name_ko = "디파일러"
type = "ground"
minerals = 50
gas = 150
supply = 2
hp = 80
shields = 0
armor = 1
damage = 0
damage_type = "normal"
build_time = 50
attack_speed = 0
range = 0
speed = 4.0
size = "medium"
ground_attack = false
air_attack = false
sight = 10
built_from = "hatchery"
abilities = ["dark-swarm", "plague", "consume", "burrow"]
upgrades = ["consume", "plague", "carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
The Defiler requires a Defiler Mound (Hive tech). It has no attack, but its spells shape late-game fights. Dark Swarm creates a cloud that protects ground units under it from most ranged attacks, Plague damages every unit in an area over time without killing them, and Consume sacrifices a friendly Zerg unit to restore energy.

## Versus Terran

Defilers are central to late-game ZvT. Dark Swarm allows Zerglings, Ultralisks and Lurkers to fight Terran bio and Siege Tanks, and Plague weakens Marines and Medics. Terran counters with Irradiate, splash damage and by hunting Defilers.

## Versus Protoss

Defilers are used in late ZvP, where Plague damages Protoss shields and HP and Dark Swarm blocks Dragoon fire. Psionic Storm and Reavers can still damage units under Dark Swarm.

## Versus Zerg

Defilers are rare in ZvZ, which usually ends before Hive tech.

## Key Mechanics

- Dark Swarm (100 energy): ground units under the cloud cannot be hit by most ranged attacks; melee attacks, spells and some splash attacks still work
- Plague (150 energy, researched at the Defiler Mound): 300 damage over time to all units in the area, cannot reduce a unit below 1 HP
- Consume (researched at the Defiler Mound): sacrifices a friendly Zerg unit to restore 50 energy
- 80 HP, 1 base armor, medium size; can burrow after the Burrow research
