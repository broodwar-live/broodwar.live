+++
title = "Machine Shop"
description = "The Machine Shop is the Factory add-on required for Siege Tanks and the research site for Siege Mode, Spider Mines, Ion Thrusters and Charon Boosters."
slug = "machine-shop"
template = "wiki/building.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "머신 샵"
minerals = 50
gas = 50
hp = 750
shields = 0
armor = 1
build_time = 40
hotkey = "C"
size = "large"
produces = []
researches = ["siege-tech", "spider-mines", "ion-thrusters"]
addon_of = "factory"
requires = ["factory"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp"]
verified = "2026-10-11"
+++
The Machine Shop attaches to a Factory. A Factory with a Machine Shop can build [Siege Tanks](@/wiki/units/siege-tank.md), and the Machine Shop researches the core Terran mech upgrades: Siege Mode, Spider Mines and Ion Thrusters for Vultures, and Charon Boosters (+3 air range) for Goliaths, which also requires an Armory.

Almost every Terran game includes at least one Machine Shop, and mech players add one to most of their Factories. Because research and Siege Tank production both depend on it, the order of researches — mines first against Protoss, Siege Mode first against Zerg or in TvT — is a defining part of Terran build orders.
