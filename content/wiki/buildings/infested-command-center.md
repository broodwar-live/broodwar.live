+++
title = "Infested Command Center"
description = "An Infested Command Center is a Terran Command Center taken over by a Zerg Queen; it trains Infested Terrans."
slug = "infested-command-center"
template = "wiki/building.html"
[taxonomies]
race = ["zerg"]
[extra]
name_ko = "감염된 커맨드 센터"
minerals = 0
gas = 0
hp = 1500
shields = 0
armor = 1
size = "large"
produces = ["infested-terran"]
required_by = []
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp"]
verified = "2026-10-11"
+++
A [Queen](@/wiki/units/queen.md) can infest an enemy Command Center whose hit points are below half, turning it into an Infested Command Center under Zerg control. It cannot be built directly. The infested building trains [Infested Terrans](@/wiki/units/infested-terran.md), suicide units that explode for heavy damage.

In competitive games infesting a Command Center is uncommon and usually happens only when a Terran expansion is nearly destroyed and a Queen is already on the field.
