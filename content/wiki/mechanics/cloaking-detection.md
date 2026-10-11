+++
title = "Cloaking & Detection"
description = "Cloaked and burrowed units, the detectors that reveal them, and the effects that expose hidden units in Brood War."
slug = "cloaking-detection"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Detection", "https://liquipedia.net/starcraft/Comsat_Station", "https://liquipedia.net/starcraft/Overlord"]
verified = "2026-10-11"
+++

## Overview

Cloaked and burrowed units cannot be seen or targeted by an enemy unless a **detector** covers them. A player without detection in the right place can lose a mineral line to a single Dark Templar or a ramp to a single Lurker.

## Hidden units

- **Permanently cloaked**: the Dark Templar (40 normal damage per hit) and the Observer.
- **Cloaked by an Arbiter**: an Arbiter cloaks nearby friendly units, though the Arbiter itself is visible.
- **Cloaking ability**: the Wraith (Cloaking Field) and the Ghost (Personnel Cloaking). Each costs 25 energy to activate and drains energy while active.
- **Burrowed**: Drones, Zerglings, Hydralisks, Defilers and Infested Terrans after the Burrow research; Lurkers burrow without it and can only attack while burrowed. Vulture Spider Mines also sit burrowed.

## Detectors

| Race | Mobile detector | Static detector |
|------|-----------------|-----------------|
| Terran | Science Vessel | Missile Turret |
| Protoss | Observer | Photon Cannon |
| Zerg | Overlord | Spore Colony |

Static detectors detect within 7 tiles. Mobile detectors detect within their sight range, so the Observer (9, or 11 with Sensor Array) and the Overlord (9, or 11 with Antennae) detect further after their sight upgrades. Every Overlord is a detector from the start.

The Terran **Comsat Station** scan costs 50 energy (a Comsat holds up to 200) and gives vision and detection over an area anywhere on the map for a few seconds.

In the engine a detector stops detecting while it is disabled (Lockdown, Stasis Field, Maelstrom) or blinded by Optical Flare.

## Other ways hidden units are exposed or hit

- A cloaked unit under Defensive Matrix, Lockdown, Maelstrom, Irradiate, Ensnare, Plague, Stasis Field or Acid Spores is visible to every player.
- A Parasite on an enemy detector shows the Zerg player what that detector detects.
- Splash damage (Siege Tanks, Reavers, Archons, Psionic Storm and others) hits undetected units in its area, and Spider Mines attack cloaked units even when they are not detected.

## Strategy

Keeping detection with the army and at home — Observers with the Protoss army, turrets or Comsat energy for Terran, Overlords and Spores for Zerg — is a constant requirement. Sniping the opponent's detectors before committing Dark Templar, Lurkers or cloaked Wraiths is a common plan.
