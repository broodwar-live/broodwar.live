+++
title = "Attack Mechanics"
description = "Weapon cooldowns, attack range, miss chance and attack-speed modifiers in Brood War."
slug = "attack-mechanics"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UpgradeType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Damage", "https://liquipedia.net/starcraft/Game_Speed", "https://liquipedia.net/starcraft/Lift_off"]
verified = "2026-10-11"
+++

## Overview

Combat in StarCraft: Brood War runs on a small set of rules: weapon cooldowns measured in frames, attack ranges measured in pixels, a few sources of miss chance, and upgrades or spells that modify those values.

## Weapon cooldown

A weapon's **cooldown** is the number of frames between attacks. At Fastest speed one frame is about 42 ms, so the real rate of fire is roughly 23.8 ÷ cooldown attacks per second. Values from the weapon data:

| Unit | Cooldown (frames) | Attacks per real second (Fastest) |
|------|-------------------|-----------------------------------|
| Zergling | 8 | ≈ 3.0 |
| Marine | 15 | ≈ 1.6 |
| Hydralisk | 15 | ≈ 1.6 |
| Zealot | 22 (two hits per attack) | ≈ 1.1 |
| Dragoon | 30 | ≈ 0.8 |
| Siege Tank (Siege Mode) | 75 | ≈ 0.3 |

**Stim Pack** and **Adrenal Glands** both halve the weapon cooldown in the engine (a stimmed Marine fires every 7 frames). The engine never lets a cooldown drop below 5 frames, so an Adrenal Zergling attacks every 5 frames rather than 4. **Ensnare** adds 25% to cooldowns, or cancels a Stim/Adrenal bonus, and each stack of Devourer Acid Spores also slows attacks.

## Attack range

Ranges are measured in pixels; one tile is 32 pixels. Notable values:

- **Marine** 4 (5 with U-238 Shells)
- **Hydralisk** 4 (5 with Grooved Spines)
- **Dragoon** 4 (6 with Singularity Charge)
- **Goliath** air attack 5 (8 with Charon Boosters)
- **Lurker** 6 (burrowed only)
- **Siege Tank** 7 in Tank Mode, 12 in Siege Mode, with a minimum range of 2 in Siege Mode

## Misses

Only ranged attacks can miss. Any ranged attack has a 1-in-256 chance to miss. A ground unit attacking a ground target on **higher ground**, or a target standing under certain doodads such as trees, hits only 136 of 256 times (about 53%) — the attack misses about 47% of the time. Under **Dark Swarm** ranged attacks against ground units always miss. Melee attacks never miss, and air units neither cause nor suffer the high-ground penalty.

## Target selection

Units that are idle or attack-moving pick targets automatically, and the game's priority rules favour units that pose a threat — for example, attack-moving units go for Siege Tanks and Marines before SCVs and Medics. Manual **focus fire** is often better: concentrating shots kills units one at a time and removes enemy damage faster, while slow, high-damage attacks such as tank shells easily **overkill** small targets.
