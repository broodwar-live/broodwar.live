+++
title = "Building Placement"
description = "Race-specific building rules, Terran lift-off and add-ons, walls and sim-city in Brood War."
slug = "building-placement"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Lift_off", "https://liquipedia.net/starcraft/Psionic_Matrix", "https://liquipedia.net/starcraft/Pylon", "https://liquipedia.net/starcraft/Walling_as_Terran", "https://liquipedia.net/starcraft/Sim-City", "https://liquipedia.net/starcraft/Proxy"]
verified = "2026-10-11"
+++

## Overview

Each race in StarCraft: Brood War places buildings under different rules, and where buildings go affects defence, unit movement and how much damage a raid can do. Arranging buildings for defence is often called **sim-city**.

## Terran

- Buildings can go on any buildable ground.
- Six buildings can **lift off** and fly: the Command Center, Barracks, Engineering Bay, Factory, Starport and Science Facility. Airborne buildings cannot produce or research, and can land on any buildable ground.
- **Add-ons** (Comsat Station, Nuclear Silo, Machine Shop, Control Tower, Covert Ops, Physics Lab) attach to the side of their parent building and need room there. A building that lifts off leaves its add-on behind, and another building of the right type can land next to it and use it.

## Protoss

- Every building except the **Nexus, Assimilator and Pylon** must be warped in inside a Pylon's **psionic matrix**, and the matrix reaches across elevation changes.
- If the powering Pylons die, the buildings become unpowered and stop producing and researching until a new Pylon powers them. Unpowered tech buildings still count as requirements for other units.
- A Probe only starts the warp-in and can return to work immediately.

## Zerg

- Every building except the **Hatchery and Extractor** must be placed on **creep**, which spreads from Hatcheries, Lairs, Hives and Creep Colonies.
- The Drone that builds a structure is consumed by it.

## Walls and sim-city

- **Terran walls** usually use the first Supply Depot and the Barracks at the main ramp, sometimes with a second depot or a Factory in TvZ. The Barracks can lift to let units out.
- **Protoss** walls are typically Forge, Gateway and Pylons at the natural in a Forge fast expansion against Zerg; a Pylon can also narrow a choke so that Zealots hold it more easily.
- **Zerg** uses sim-city less, but Hatcheries, Evolution Chambers and Sunken Colonies are sometimes arranged to protect the natural against Vulture run-bys.

## Proxies

A **proxy** is a production building placed away from the main base, usually close to the opponent, to shorten the travel time of an early attack. Terran can also build in safety and fly the building forward.
