+++
title = "Dark Swarm"
description = "Dark Swarm is a Defiler spell that creates a cloud protecting ground units beneath it from ranged attacks."
slug = "dark-swarm"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_ko = "다크 스웜"
caster = "defiler"
energy = 100
hp_cost = 0
range = 9
aoe = "160×160 px"
duration = 60.0
hotkey = "W"
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Dark_Swarm", "https://liquipedia.net/starcraft/Splash_Damage"]
verified = "2026-10-11"
+++
Dark Swarm creates a 160×160-pixel cloud at the target location that lasts 900 frames (60 game seconds, about 38 seconds of real time on Fastest). Any ground unit under the cloud — friend or foe — cannot be hit by ranged attacks: in the engine its chance to dodge such attacks becomes 100%. Buildings and air units are not protected.

Melee attacks still work under the swarm, as do attacks without a projectile (Firebats, Reaver Scarabs, Spider Mines, Infested Terrans) and spells such as Psionic Storm, Plague, Irradiate, Ensnare and Yamato Cannon. Units under the cloud can still fire out of it normally.

It costs 100 energy, has a range of 9 and needs no research. Dark Swarm is the centrepiece of late-game Zerg against Terran: under it Zerglings, Ultralisks and Lurkers can engage Marines and Siege Tanks that would otherwise shred them. Terrans answer with Firebats, Irradiate and by pulling back out of the cloud. Defilers sustain repeated casts with Consume.
