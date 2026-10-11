+++
title = "Armor & Unit Size"
description = "How armor, unit size, shields and upgrades affect damage calculations in Brood War."
slug = "armor-types"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UpgradeType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Armor", "https://liquipedia.net/starcraft/Damage"]
verified = "2026-10-11"
+++

## Overview

Every unit and building in StarCraft: Brood War has an **armor** value and a **size** — Small, Medium or Large. Together with the attacker's [damage type](@/wiki/mechanics/damage-types.md) they decide how much of a hit actually lands.

## Unit sizes

Sizes come from the game data (BWAPI):

- **Small**: Marine, Firebat, Medic, Ghost, SCV, Zergling, Drone, Scourge, Infested Terran, Mutalisk, Probe, Zealot, High Templar, Dark Templar, Observer, Interceptor, Spider Mine
- **Medium**: Vulture, Hydralisk, Lurker, Queen, Defiler, Corsair
- **Large**: Goliath, Siege Tank, Wraith, Dropship, Science Vessel, Valkyrie, Battlecruiser, Overlord, Ultralisk, Guardian, Devourer, Dragoon, Reaver, Shuttle, Scout, Arbiter, Carrier, Archon, Dark Archon — and every building

## How a hit is resolved

The OpenBW engine processes each hit in this order:

1. Damage of less than 0.5 is raised to 0.5 (hallucinations take double damage).
2. A Defensive Matrix absorbs damage first.
3. Protoss **shields** absorb damage next. Shields take the full amount regardless of damage type; only the Plasma Shields upgrade (shield armor) reduces it.
4. What is left is reduced by the unit's **armor** (a flat 1 point per point of armor).
5. Only then is the **damage-type multiplier** for the target's size applied.
6. If no shields were hit, the result is never lower than 0.5.

So a Vulture shot (20 concussive) against a Dragoon with 1 armor first removes 20 shields; once the shields are gone, each shot does (20 − 1) × 25% = 4.75 damage to hit points. Spell damage such as Psionic Storm or Irradiate ignores armor entirely.

## Armor values and upgrades

Most units start with 0 or 1 armor and gain +1 per armor upgrade level, up to +3. Units with 2 or more base armor are the Sunken Colony, Guardian, Devourer and Valkyrie (2), the Battlecruiser (3) and the Carrier (4). The Ultralisk has its own extra upgrade, Chitinous Plating (+2). Larvae and eggs have 10 armor. Buildings generally have 1 armor, except anti-air structures and some others with 0.

Upgrades are researched at the Engineering Bay (infantry), Armory (vehicles and ships), Forge (Protoss ground armor and shields), Cybernetics Core (Protoss air), Evolution Chamber (Zerg ground) and Spire (Zerg air).

## Why it matters

Because armor is subtracted from **every hit**, it matters most against fast, low-damage attacks. A Marine's 6-damage shot against 3 armor drops to 3, a 50% cut; a sieged tank's 70-damage shot against a large target with 3 armor still deals 67. Multi-hit attacks such as the Zealot's two 8-damage blows pay the armor twice per swing. Fully upgraded Ultralisks (1 base + 2 Chitinous + 3 carapace = 6 armor) reduce un-upgraded Marine shots to the 0.5 minimum.
