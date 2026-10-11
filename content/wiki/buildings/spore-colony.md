+++
title = "Spore Colony"
description = "The Spore Colony is the Zerg anti-air and detection structure, morphed from a Creep Colony."
slug = "spore-colony"
template = "wiki/building.html"
[taxonomies]
race = ["zerg"]
[extra]
name_ko = "스포어 콜로니"
minerals = 50
gas = 0
hp = 400
shields = 0
armor = 0
build_time = 20
hotkey = "S"
size = "large"
produces = []
required_by = ["evolution-chamber"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp"]
verified = "2026-10-11"
+++
The Spore Colony is morphed from a [Creep Colony](@/wiki/buildings/creep-colony.md) and requires an Evolution Chamber. It attacks air units only (15 normal damage, range 7) and is a detector, revealing cloaked units such as Dark Templar, Wraiths and Observers within its sight.

Spores are built against early air harassment — Corsairs in ZvP, Wraiths or Dropships in ZvT, and Mutalisks in ZvZ — and as static detection against Dark Templar. Placing a Spore in the mineral line protects Drones from Mutalisk and Corsair raids.
