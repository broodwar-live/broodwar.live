+++
title = "Protoss Tech Tree"
description = "Complete Protoss technology tree — building dependencies and unit unlocks."
slug = "protoss"
template = "wiki/tech-tree.html"
[taxonomies]
race = ["protoss"]
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UpgradeType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Upgrades"]
verified = "2026-10-11"
+++

Protoss structures are warped in by Probes and, apart from the Nexus, Pylon and Assimilator, must be placed in a Pylon's power field; a structure whose Pylon is destroyed becomes unpowered and stops working. Almost all Protoss tech flows through the Cybernetics Core, which opens the Gateway, Robotics and Stargate branches.

Requirements below are taken from the game data (BWAPI); research costs and times are on each upgrade's page.

## Base structures

- **Nexus** — trains Probes; provides 9 supply.
- **Pylon** — provides 8 supply and the power field other structures need.
- **Assimilator** — built on a Vespene Geyser to harvest gas.
- **Gateway** (requires Nexus)
  - Zealot
  - Dragoon (requires Cybernetics Core)
  - High Templar, Dark Templar (require Templar Archives)
- **Forge** (requires Nexus) — Ground Weapons, Ground Armor and Plasma Shields (3 levels each). Enables the Photon Cannon.
- **Photon Cannon** (requires Forge) — attacks ground and air; detector.
- **Shield Battery** (requires Gateway) — restores shields of nearby units with its energy.
- **Cybernetics Core** (requires Gateway) — researches Singularity Charge (Dragoon range), Air Weapons and Air Armor (3 levels each). Enables the Dragoon, Citadel of Adun, Robotics Facility and Stargate.

## Gateway tech

- **Citadel of Adun** (requires Cybernetics Core) — researches Leg Enhancements (Zealot speed).
- **Templar Archives** (requires Citadel of Adun) — enables High Templar and Dark Templar; researches Psionic Storm, Hallucination, Khaydarin Amulet (High Templar energy), Maelstrom, Mind Control and Argus Talisman (Dark Archon energy). Required for level 2–3 ground upgrades and for the Arbiter Tribunal.
- Two High Templar merge into an **Archon**; two Dark Templar merge into a **Dark Archon**.

## Robotics tech

- **Robotics Facility** (requires Cybernetics Core)
  - Shuttle
  - Reaver (requires Robotics Support Bay)
  - Observer (requires Observatory)
- **Robotics Support Bay** (requires Robotics Facility) — Scarab Damage, Reaver Capacity, Gravitic Drive (Shuttle speed).
- **Observatory** (requires Robotics Facility) — Sensor Array (Observer sight), Gravitic Boosters (Observer speed).

## Stargate tech

- **Stargate** (requires Cybernetics Core)
  - Scout, Corsair
  - Carrier (requires Fleet Beacon)
  - Arbiter (requires Arbiter Tribunal)
- **Fleet Beacon** (requires Stargate) — Apial Sensors and Gravitic Thrusters (Scout), Carrier Capacity, Disruption Web, Argus Jewel (Corsair energy). Required for level 2–3 air upgrades.
- **Arbiter Tribunal** (requires Templar Archives and Stargate) — Recall, Stasis Field, Khaydarin Core (Arbiter energy).

Feedback (Dark Archon) needs no research.

## Common tech paths

- **Against Terran** — Dragoon-based gateway armies with Observers and Reavers or Shuttles, adding High Templar, Arbiters or Carriers later in the game.
- **Against Zerg** — Forge-first fast expansions are common, followed by Corsairs and Dark Templar, Reavers, or High Templar with Psionic Storm.
- **Against Protoss** — Dragoons, often with Robotics (Reavers, Observers) or Dark Templar.
