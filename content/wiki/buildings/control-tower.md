+++
title = "Control Tower"
description = "The Control Tower is the Starport add-on that unlocks Dropships, Science Vessels, Valkyries and Battlecruisers and researches Wraith upgrades."
slug = "control-tower"
template = "wiki/building.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "컨트롤 타워"
minerals = 50
gas = 50
hp = 500
shields = 0
armor = 1
build_time = 40
hotkey = "C"
size = "large"
produces = []
researches = ["cloaking-field"]
addon_of = "starport"
requires = ["starport"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp"]
verified = "2026-10-11"
+++
The Control Tower attaches to a Starport. Without one, a Starport can only build Wraiths; with it, the Starport can also build [Dropships](@/wiki/units/dropship.md), and — with the additional tech buildings — [Science Vessels](@/wiki/units/science-vessel.md) (Science Facility), [Valkyries](@/wiki/units/valkyrie.md) (Armory) and [Battlecruisers](@/wiki/units/battlecruiser.md) (Physics Lab).

The Control Tower researches Cloaking Field and Apollo Reactor for Wraiths. In practice it is built mainly for Science Vessels in TvZ and for Dropships in every matchup.
