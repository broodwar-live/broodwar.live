+++
title = "Attack Mechanics"
description = "Weapon cooldowns, attack range, targeting priority, and combat modifiers in Brood War."
slug = "attack-mechanics"
template = "wiki/mechanic.html"
+++

## Overview

Combat in StarCraft: Brood War is governed by a precise set of attack mechanics: weapon cooldowns, range values, targeting priority, and various upgrades that modify attack behavior. Understanding these mechanics lets players make better decisions about when to engage, which units to target, and how to position their armies.

## Weapon Cooldown

Every unit has a **weapon cooldown** — the number of game frames between consecutive attacks. Lower cooldown means faster attacks. Some key values:

| Unit        | Cooldown (frames) | Approx. attacks/sec |
|-------------|-------------------|---------------------|
| Zergling    | 8 (5 with Adrenal) | 1.9 (3.0)         |
| Marine      | 15                | 1.0                 |
| Hydralisk   | 15                | 1.0                 |
| Dragoon     | 30                | 0.5                 |
| Siege Tank  | 75 (siege mode)   | 0.2                 |

Weapon cooldown is why Marines and Hydralisks are heavily affected by armor (they attack frequently with low damage per hit, so armor's per-hit reduction is proportionally large), while Siege Tanks and Reavers are barely affected (they attack rarely but deal massive damage per hit).

## Attack Range

Range determines how far a unit can attack. Units with longer range can fire while staying out of the enemy's reach, which is a significant tactical advantage.

Notable range values (in game tiles):
- **Dragoon**: 4 (6 with Singularity Charge upgrade) — this upgrade is considered mandatory
- **Marine**: 4 (5 with U-238 Shells upgrade)
- **Hydralisk**: 4 (5 with Grooved Spines upgrade)
- **Siege Tank (siege mode)**: 12 — the longest ground attack range in the game
- **Lurker**: 6 — burrowed attack range

Range upgrades are among the most important in the game. An un-upgraded Dragoon with 4 range is significantly weaker than one with 6 range, which is why Protoss players rush the Singularity Charge research.

## Targeting Priority

When a unit is ordered to attack-move, it automatically selects a target based on proximity and whether the target can be attacked. The auto-targeting AI is relatively simple:

1. The unit selects the nearest enemy unit it can attack
2. It continues attacking that target until it dies or moves out of range
3. It then retargets to the next nearest enemy

This basic AI is why **focus fire** (manually selecting targets) is so important. A group of 12 Dragoons on attack-move will spread their fire across multiple targets, while 12 Dragoons focus-firing will instantly kill one target at a time, which is far more efficient in reducing the opponent's damage output.

## Stim Pack

The Terran Stim Pack upgrade allows Marines and Firebats to **increase their attack speed by 50% and movement speed** at the cost of 10 HP. For Marines, this changes the weapon cooldown from 15 frames to 7.5 frames, effectively doubling their DPS. Stim Pack is one of the most cost-efficient upgrades in the game and is the cornerstone of bio play.

The HP cost means Stimmed Marines need Medic support to sustain, creating the classic Marine/Medic composition.

## Adrenal Glands

The Zerg upgrade Adrenal Glands (requires Hive) nearly **doubles Zergling attack speed**, reducing their cooldown from 8 frames to 5 frames. Combined with their already low cost and small size, "cracklings" (Adrenal Zerglings) become one of the most cost-efficient units in the game for overwhelming slower, more expensive units.

## Overkill

**Overkill** occurs when multiple units fire at the same target simultaneously, dealing more total damage than needed to kill it. The excess damage is wasted. Overkill is most severe with slow, high-damage units like Siege Tanks — if three Tanks fire at a single Zergling, two of those shots are completely wasted.

Skilled players minimize overkill through focus fire, unit splitting, and careful target selection. Conversely, sending cheap units to absorb overkill shots (Zergling sacrificial waves) is a valid counter-strategy against siege lines.
