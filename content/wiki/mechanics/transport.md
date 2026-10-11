+++
title = "Transport & Drop Play"
description = "Transport units, cargo space and drop play in Brood War."
slug = "transport"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Transport", "https://liquipedia.net/starcraft/Overlord", "https://liquipedia.net/starcraft/Dropship"]
verified = "2026-10-11"
+++

## Overview

Each race has an air transport that can carry ground units over terrain, walls and defensive lines. **Drops** — unloading units in the enemy's base or behind its army — are a core tactic in every matchup.

## Transports

| Race | Transport | Cost | Durability | Notes |
|------|-----------|------|------------|-------|
| Terran | Dropship | 100 minerals, 100 gas | 150 HP, 1 armor | Built at the Starport (needs a Control Tower) |
| Protoss | Shuttle | 200 minerals | 80 HP, 60 shields, 1 armor | Built at the Robotics Facility |
| Zerg | Overlord | 100 minerals | 200 HP | Needs Ventral Sacs (Lair, 200/200) to carry units |

Every transport has **8 cargo slots**, units load quickly but unload one at a time, and if a transport is destroyed every unit inside dies with it.

## Cargo space

Space is set per unit in the game data and does not always follow combat size:

| Slots | Units |
|-------|-------|
| 1 | Marine, Firebat, Medic, Ghost, SCV, Zergling, Drone, Infested Terran, Probe |
| 2 | Vulture, Goliath, Hydralisk, Defiler, Zealot, High Templar, Dark Templar |
| 4 | Siege Tank, Lurker, Ultralisk, Dragoon, Reaver, Archon, Dark Archon |

So one transport holds 8 Marines, 4 Zealots or 4 Hydralisks, or 2 Siege Tanks or 2 Reavers.

## Common drop styles

- **Shuttle–Reaver**: the Shuttle drops a Reaver, it fires a Scarab, and the Shuttle picks it up again before it can be caught.
- **Storm drops**: High Templar dropped next to the enemy army or mineral line.
- **Terran drops**: Marine/Medic drops into mineral lines, or Siege Tanks dropped onto high ground or behind defences.
- **Overlord drops**: Zerglings, Hydralisks or Lurkers carried by Overlords once Ventral Sacs (and usually the Pneumatized Carapace speed upgrade) are researched.

Drops are countered with static anti-air at likely landing spots, by watching the minimap for transports, and by shooting transports down before they unload.
