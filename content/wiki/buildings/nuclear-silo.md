+++
title = "Nuclear Silo"
description = "The Nuclear Silo is a Command Center add-on that builds one Nuclear Missile at a time for Ghosts to call down."
slug = "nuclear-silo"
template = "wiki/building.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "뉴클리어 사일로"
minerals = 100
gas = 100
hp = 600
shields = 0
armor = 1
build_time = 80
hotkey = "N"
size = "large"
produces = []
addon_of = "command-center"
requires = ["covert-ops"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp"]
verified = "2026-10-11"
+++
The Nuclear Silo is a Command Center add-on that requires Covert Ops. It stores one Nuclear Missile at a time; a [Ghost](@/wiki/units/ghost.md) then targets the strike with [Nuclear Strike](@/wiki/abilities/nuclear-strike.md). Each missile costs 200 minerals and 200 gas and uses 8 supply until it is launched.

Nukes are rare in professional play because of their cost and long warning time, but they appear in long late-game TvP and TvZ games, mostly to break static defenses or to force the opponent to move off a position.
