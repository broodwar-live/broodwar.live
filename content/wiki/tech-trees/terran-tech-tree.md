+++
title = "Terran Tech Tree"
description = "Complete Terran technology tree — building dependencies and unit unlocks."
slug = "terran"
template = "wiki/tech-tree.html"
[taxonomies]
race = ["terran"]
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UpgradeType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Upgrades"]
verified = "2026-10-11"
+++

Terran production and research is spread across buildings that SCVs construct, several of which take an add-on. Add-ons unlock specific units and research: a Starport cannot build anything but Wraiths until it has a Control Tower, and a Factory needs a Machine Shop for Siege Tanks. The Command Center, Barracks, Factory, Starport, Science Facility and Engineering Bay can lift off and relocate.

Requirements below are taken from the game data (BWAPI); research costs and times are on each upgrade's page.

## Command Center and add-ons

- **Command Center** — trains SCVs; provides 10 supply.
  - **Comsat Station** (requires Academy) — Scanner Sweep, which reveals an area and detects cloaked and burrowed units.
  - **Nuclear Silo** (requires Covert Ops) — builds one Nuclear Missile at a time; a Ghost calls the strike down.
- **Supply Depot** — provides 8 supply. No requirement.
- **Refinery** — built on a Vespene Geyser to harvest gas.

## Barracks branch

- **Barracks** (requires Command Center)
  - Marine
  - Firebat, Medic (require Academy)
  - Ghost (requires Academy and Covert Ops)
- **Academy** (requires Barracks) — researches Stim Pack, U-238 Shells, Restoration, Optical Flare and Caduceus Reactor (Medic energy). Enables the Comsat Station.
- **Bunker** (requires Barracks) — holds up to four infantry slots.
- **Engineering Bay** (requires Command Center) — Infantry Weapons and Infantry Armor (3 levels each; levels 2–3 need a Science Facility). Enables the Missile Turret.
- **Missile Turret** (requires Engineering Bay) — anti-air defense and detector.

## Factory branch

- **Factory** (requires Barracks)
  - Vulture
  - Siege Tank (requires Machine Shop)
  - Goliath (requires Armory)
  - **Machine Shop** add-on — Tank Siege Mode, Spider Mines, Ion Thrusters, and Charon Boosters (Goliath anti-air range; requires an Armory).
- **Armory** (requires Factory) — Vehicle Weapons, Vehicle Plating, Ship Weapons and Ship Plating (3 levels each). Enables the Goliath and Valkyrie.

## Starport branch

- **Starport** (requires Factory)
  - Wraith
  - Dropship (requires Control Tower)
  - Valkyrie (requires Control Tower and Armory)
  - Science Vessel (requires Control Tower and Science Facility)
  - Battlecruiser (requires Control Tower and Physics Lab)
  - **Control Tower** add-on — Cloaking Field and Apollo Reactor (Wraith energy).
- **Science Facility** (requires Starport) — Irradiate, EMP Shockwave and Titan Reactor (Science Vessel energy). Takes one of two add-ons:
  - **Physics Lab** — Yamato Gun and Colossus Reactor (Battlecruiser energy). Enables the Battlecruiser.
  - **Covert Ops** — Lockdown, Personnel Cloaking, Ocular Implants (Ghost sight) and Moebius Reactor (Ghost energy). Enables the Ghost and the Nuclear Silo.

Defensive Matrix (Science Vessel), Healing (Medic) and Scanner Sweep (Comsat Station) need no research.

## Common tech paths

- **Bio** — Barracks, Academy and Engineering Bays for Marines and Medics with Stim Pack and U-238 Shells, joined by Science Vessels. The standard Terran style against Zerg.
- **Mech** — Factories with Machine Shops for Vultures and Siege Tanks, Armories for upgrades and Goliaths. The standard style against Protoss and the basis of most TvT play, where Starport units such as Wraiths, Dropships and Science Vessels are mixed in.
