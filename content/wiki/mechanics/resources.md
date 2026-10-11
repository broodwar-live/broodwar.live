+++
title = "Resources"
description = "Minerals and vespene gas: how they are mined, trip sizes and mining rates in Brood War."
slug = "resources"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Mining"]
verified = "2026-10-11"
+++

## Overview

Every unit, building, upgrade and research in StarCraft: Brood War costs **minerals**, **vespene gas** or both. Each player starts with 50 minerals and 4 workers (SCV, Probe or Drone; each costs 50 minerals).

## Minerals

Workers mine a mineral patch and carry the load back to the nearest Command Center, Nexus or Hatchery/Lair/Hive. Each trip returns **8 minerals**. When a patch has fewer than 8 left, the last trip takes whatever remains and the patch disappears. How much a patch holds is set by the map.

Measured rates for a single worker on a patch are about 65 minerals per real minute for an SCV, 67 for a Drone and 68 for a Probe; the difference comes from the shape of each race's town hall, since all workers move at the same speed. Ignoring travel, mining a patch takes roughly 80 frames.

## Vespene gas

Gas requires an extraction building on the geyser: Refinery (Terran), Assimilator (Protoss) or Extractor (Zerg). Each trip returns **8 gas**, and a worker spends 37 frames inside the building. Once a geyser is depleted it still yields **2 gas** per trip. On most modern maps three workers saturate a geyser (about 300 gas per real minute); some older maps need four.

## Resource balance

Mineral-heavy units (Zerglings, Marines, Zealots) and gas-heavy ones (Mutalisks, High Templar, Science Vessels) make the mineral-to-gas ratio a constant consideration, and extra geysers are one reason to take more bases.
