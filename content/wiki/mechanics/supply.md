+++
title = "Supply"
description = "The supply system that limits army size in Brood War: providers, starting values and the 200 cap."
slug = "supply"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Supply", "https://liquipedia.net/starcraft/Hatchery", "https://liquipedia.net/starcraft/Overlord", "https://liquipedia.net/starcraft/Pylon"]
verified = "2026-10-11"
+++

## Overview

Every unit occupies **supply**, and a unit can only be produced if enough supply is available. Supply is raised by supply buildings or units, and each race is capped at **200**.

## Supply providers

| Race | Provider | Cost | Supply |
|------|----------|------|--------|
| Terran | Supply Depot | 100 minerals | 8 |
| Terran | Command Center | 400 minerals | 10 |
| Protoss | Pylon | 100 minerals | 8 |
| Protoss | Nexus | 400 minerals | 9 |
| Zerg | Overlord | 100 minerals | 8 |
| Zerg | Hatchery / Lair / Hive | — | 1 each |

Pylons also project the power field Protoss buildings need, and Overlords are units that can be killed — losing them reduces the Zerg's supply.

## Starting supply

Every player starts with 4 workers and 50 minerals:

- **Terran**: 4/10 (Command Center)
- **Protoss**: 4/9 (Nexus)
- **Zerg**: 4/9 (Hatchery 1 + one Overlord 8); the Hatchery also starts with three larvae

## Unit supply costs

Costs range from 0.5 for a Zergling or Scourge (two per egg, 1 supply per pair) to 6 for a Battlecruiser or Carrier. Workers and Marines cost 1; Zealots, Dragoons, Vultures, Siege Tanks, Lurkers and Mutalisks cost 2; Ultralisks, Reavers and Archons cost 4. A Nuclear Missile occupies 8.

## Supply block and the cap

Reaching your current supply limit stops production until a new provider finishes — a **supply block**. The 200 cap is tracked per race, so units of another race gained through Mind Control (or a Protoss/Terran/Zerg base built with a captured worker) count against that race's own 200.
