+++
title = "Zerg Tech Tree"
description = "Complete Zerg technology tree — building dependencies and unit unlocks."
slug = "zerg"
template = "wiki/tech-tree.html"
[taxonomies]
race = ["zerg"]
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UpgradeType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Upgrades"]
verified = "2026-10-11"
+++

Zerg units hatch from Larvae, which each Hatchery, Lair or Hive generates automatically (up to three waiting at a time per hatchery). Structures are made by morphing a Drone, which is consumed, and most must be placed on creep. The main hatchery tiers — Hatchery → Lair → Hive — gate access to higher-tier structures.

Requirements below are taken from the game data (BWAPI); research costs and times are on each upgrade's page.

## Hatchery tiers

- **Hatchery** — produces Larvae; provides 1 supply. Researches Burrow.
  - From Larvae: Drone and Overlord (no requirement), Zergling (Spawning Pool), Hydralisk (Hydralisk Den), Mutalisk and Scourge (Spire), Queen (Queen's Nest), Defiler (Defiler Mound), Ultralisk (Ultralisk Cavern).
- **Lair** (morphed from a Hatchery; requires Spawning Pool) — researches Ventral Sacs (Overlord transport), Antennae (Overlord sight) and Pneumatized Carapace (Overlord speed). Enables the Spire, Queen's Nest and Lurker Aspect, and Zerg attack and armor upgrades beyond level 1.
- **Hive** (morphed from a Lair; requires Queen's Nest) — enables the Defiler Mound, Ultralisk Cavern, Greater Spire, Nydus Canal, Adrenal Glands and level 3 upgrades.

The **Overlord** provides 8 supply and is always a detector; it can carry units only after Ventral Sacs.

## Hatchery-tier structures

- **Spawning Pool** (requires Hatchery) — Zergling; researches Metabolic Boost and Adrenal Glands (requires Hive). Required for the Lair, Hydralisk Den and Sunken Colony.
- **Evolution Chamber** (requires Hatchery) — Melee Attacks, Missile Attacks and Carapace (3 levels each; level 2 requires Lair, level 3 Hive). Required for the Spore Colony.
- **Extractor** — built on a Vespene Geyser to harvest gas.
- **Creep Colony** — morphs into a **Sunken Colony** (requires Spawning Pool; anti-ground) or a **Spore Colony** (requires Evolution Chamber; anti-air and detector).
- **Hydralisk Den** (requires Spawning Pool) — Hydralisk; researches Muscular Augments, Grooved Spines and Lurker Aspect (requires Lair). With Lurker Aspect, Hydralisks morph into **Lurkers**.

## Lair-tier structures

- **Spire** (requires Lair) — Mutalisk and Scourge; Flyer Attacks and Flyer Carapace (3 levels each). Morphs into a **Greater Spire** (requires Hive), which lets Mutalisks morph into **Guardians** and **Devourers** and can continue the flyer upgrades.
- **Queen's Nest** (requires Lair) — Queen; researches Spawn Broodling, Ensnare and Gamete Meiosis (Queen energy). Required for the Hive. Queens can also infest a Terran Command Center that has been damaged below half its hit points, turning it into an Infested Command Center that produces Infested Terrans.

## Hive-tier structures

- **Defiler Mound** (requires Hive) — Defiler; researches Plague, Consume and Metasynaptic Node (Defiler energy). Dark Swarm needs no research.
- **Ultralisk Cavern** (requires Hive) — Ultralisk; researches Anabolic Synthesis and Chitinous Plating.
- **Nydus Canal** (requires Hive) — a pair of linked tunnel entrances that move ground units instantly between them.

## Common tech paths

- **Mutalisk** — Spawning Pool, Lair, Spire. Mutalisk-based openings are common against Terran and are standard in ZvZ.
- **Lurker** — Hydralisk Den and Lair for Lurker Aspect; a common ZvT opening and a part of many ZvP games.
- **Hive** — Queen's Nest into Hive for Defilers (Dark Swarm, Plague), Ultralisks or Guardians in the late game.
