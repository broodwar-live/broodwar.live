+++
title = "Damage Types"
description = "How Normal, Concussive, Explosive and spell damage interact with unit sizes in Brood War."
slug = "damage-types"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Damage"]
verified = "2026-10-11"
+++

## Overview

Every weapon in StarCraft: Brood War has a **damage type** that scales its damage against the target's [size](@/wiki/mechanics/armor-types.md). The multiplier is applied after armor and only to hit-point damage — Protoss shields always take the full amount.

## The multipliers

| Damage type | vs Small | vs Medium | vs Large |
|-------------|----------|-----------|----------|
| Normal      | 100%     | 100%      | 100%     |
| Concussive  | 100%     | 50%       | 25%      |
| Explosive   | 50%      | 75%       | 100%     |

Buildings are Large, so concussive weapons deal only 25% to them. Spells that deal damage — Psionic Storm, Irradiate — use an "ignore armor" type that skips both armor and the size multiplier, and Plague bypasses shields and armor entirely.

## Which units use which type

- **Concussive**: only three units — the **Vulture**, **Firebat** and **Ghost**.
- **Explosive**: Siege Tank (both modes), Hydralisk, Dragoon, Goliath (air attack), Wraith (air attack), Scout (air attack), Valkyrie, Corsair, Arbiter, Devourer, Missile Turret, Sunken Colony, Spider Mine, Infested Terran — and the Battlecruiser's Yamato Cannon.
- **Normal**: everything else, including Marines, Zealots, Zerglings, Mutalisks, Ultralisks, Lurkers, Archons, Reavers, Guardians, workers, Battlecruisers and the ground attacks of Goliaths, Wraiths and Scouts.

## Examples

- A sieged tank (70 explosive) does 35 to a Zergling (small, 0 armor) but the full 70 to a Dragoon's hit points (minus 1 armor).
- A Vulture (20 concussive) does full damage to Zerglings, Marines and Zealots' hit points, but only a quarter to Dragoons, Siege Tanks or buildings once shields are gone.
- Hydralisks and Dragoons deal explosive damage, so they are less efficient against small units such as Zerglings and Marines than their listed damage suggests.
