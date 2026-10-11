+++
title = "Splash & Area Damage"
description = "Splash radii, falloff, friendly fire and area spells in Brood War."
slug = "splash-damage"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Splash_Damage", "https://liquipedia.net/starcraft/Damage", "https://liquipedia.net/starcraft/Nuclear_Strike"]
verified = "2026-10-11"
+++

## Overview

Most attacks in StarCraft: Brood War hit one target, but several weapons and spells damage everything in an area. Splash scales with how tightly the enemy is packed, which is why spreading units matters so much against it.

## Radial splash and falloff

Radial splash weapons have three radii. A unit within the **inner** radius of the impact takes 100% damage, within the **medium** radius 50%, and within the **outer** radius 25%; armor and the damage-type multiplier are applied after this reduction. Burrowed units only take splash if they are inside the inner radius. Splash also hits cloaked units that are not detected.

| Source | Damage | Inner / medium / outer radius (px) | Hurts own units? |
|--------|--------|------------------------------------|------------------|
| Siege Tank (Siege Mode) | 70 explosive | 10 / 25 / 40 | Yes |
| Spider Mine | 125 explosive | 50 / 75 / 100 | Yes |
| Infested Terran | 500 explosive | 20 / 40 / 60 | Yes |
| Reaver Scarab | 100 normal (125 upgraded) | 20 / 40 / 60 | No |
| Archon | 30 normal | 3 / 15 / 30 | No |
| Firebat | 8 concussive | 15 / 20 / 25 | No |
| Corsair, Valkyrie | air-to-air splash | 5 / 50 / 100 | No |
| Nuclear Strike | 500 or ⅔ of max HP + shields | 128 / 192 / 256 | Yes |

Weapons that do not hurt their owner's units still hit **allied** players' units in team games.

## Line splash

The **Lurker**'s spines travel in a line from the Lurker toward its target and deal full damage (20 normal) to every enemy ground unit along the line; it does not hurt its owner's units.

## Area spells

- **Psionic Storm**: 112 damage (8 × 14) to all units within 48 px, including friendly ones; ignores armor; does not stack; buildings are immune.
- **Irradiate**: 250 damage over time to biological units within 32 px of the irradiated unit.
- **Plague**: about 296 damage over time to units and buildings in a 128×128 px area; cannot kill.
- **EMP Shockwave**, **Ensnare**, **Stasis Field**, **Maelstrom**, **Dark Swarm** and **Disruption Web** affect an area without dealing damage.

## Strategic implications

Splash rewards spreading against tanks, Reavers, Lurkers and Storm, and punishes clumping. Because tank and mine splash hits friendly units, Terran players must keep their own forces from standing in their tanks' line of fire or in their own minefields.
