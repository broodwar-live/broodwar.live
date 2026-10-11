+++
title = "Fog of War"
description = "Vision, sight ranges and the three visibility states of the Brood War map."
slug = "fog-of-war"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Maps/Terrain_Features", "https://liquipedia.net/starcraft/Overlord", "https://liquipedia.net/starcraft/Lift_off"]
verified = "2026-10-11"
+++

## Overview

Each player sees only what their own units and buildings can see. The rest of the map is hidden by the **fog of war**, so information has to be gathered by scouting.

## Visibility states

- **Unexplored (black)**: areas the player has never seen.
- **Fogged (grey)**: areas seen before but not currently in sight. Terrain is shown, and enemy buildings appear as they were last seen — even if they have since been destroyed — but units and changes are not.
- **Visible**: areas currently inside the sight range of one of the player's units or buildings.

## Sight ranges

Sight is measured in tiles (32 pixels). Some values from the game data:

- Workers: SCV 7, Drone 7, Probe 8
- Zergling 5, Hydralisk 6, Marine 7, Zealot 7, Dragoon 8, Siege Tank 10
- Overlord 9 (11 with Antennae), Observer 9 (11 with Sensor Array), Ghost 9 (11 with Ocular Implants), Science Vessel 10
- A building under construction sees only 4 tiles; a unit blinded by Optical Flare sees 2

Ground units on low ground cannot see onto higher ground, so an attacker needs a spotter — an air unit, a unit already on the high ground or a Comsat scan — to target units uphill. A unit on high ground becomes briefly visible to the low ground when it fires.

## Scouting

Because of the fog, players scout with workers, Overlords, Observers, floating Terran buildings, Comsat scans and fast units to see the opponent's gas timing, production, tech buildings and army position. Hiding information — walling off, denying scouts, building away from where the opponent looks — is the other side of the same contest.
