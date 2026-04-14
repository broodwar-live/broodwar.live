+++
title = "Armor & Unit Size"
description = "How armor, unit size, and upgrade levels affect damage calculations in Brood War."
slug = "armor-types"
template = "wiki/mechanic.html"
+++

## Overview

In StarCraft: Brood War, every unit has an **armor value** and a **unit size** (Small, Medium, or Large). These two properties, combined with the attacker's damage type, determine how much damage is actually dealt per hit. Armor and size interactions are fundamental to understanding why certain unit matchups play out the way they do.

## Unit Sizes

Every unit in the game is classified as one of three sizes:

- **Small**: Zerglings, Marines, Zealots, Scourge, Vultures, Firebats, Interceptors
- **Medium**: Hydralisks, Medics, Lurkers, Ghosts, Valkryies, Mutalisks, Corsairs
- **Large**: Ultralisks, Dragoons, Siege Tanks, Carriers, Battlecruisers, Archons, Reavers

Unit size interacts with the attacker's damage type (see Damage Types article). A Siege Tank's explosive damage deals full damage to large units but only 50% to small units.

## Armor Mechanics

Armor **reduces incoming damage per hit** by a flat amount. The formula is:

```
effective_damage = max(base_damage - target_armor, 0.5)
```

Each point of armor subtracts 1 point from every individual hit of damage. The minimum damage per hit is 0.5, meaning armor can never completely negate an attack.

### Armor Upgrades

Each armor upgrade level adds **+1 armor** to all units of that type. Upgrades are researched at the appropriate tech building (Engineering Bay for Terran infantry, Forge for Protoss ground units, Evolution Chamber for Zerg). Each race can upgrade armor up to **+3** through three successive research levels.

## Armor vs Fast Attackers

Because armor reduces damage **per hit**, it is proportionally more effective against units with fast attack speeds and low per-hit damage than against units with slow attacks and high per-hit damage.

For example, a Marine attacks every 15 frames and deals 6 base damage. Against a unit with 3 armor, each Marine shot deals only 3 damage — a 50% reduction. But a Siege Tank in siege mode deals 70 damage per shot. Against 3 armor, it still deals 67 — less than a 5% reduction.

This is why armor upgrades are especially valuable against bio-heavy compositions (Marines, Hydralisks) and less impactful against siege units.

## Protoss Shields

Protoss units have a unique additional layer: **plasma shields**. Shields absorb damage before hit points, and shield damage **always takes full damage regardless of damage type**. This means concussive and explosive damage reductions only apply once the shield is depleted and hit points are being damaged. Shield armor can be upgraded separately at the Forge.

## Strategic Takeaways

- Armor upgrades are most impactful against fast-attacking, low-damage units
- Weapon upgrades are always valuable, but especially when facing high-armor opponents
- Protoss shields act as a universal damage buffer, making early-game Zealots and Dragoons deceptively tanky
- The +1 attack vs +1 armor race is a real strategic decision — getting your upgrades ahead of your opponent provides a meaningful combat advantage
