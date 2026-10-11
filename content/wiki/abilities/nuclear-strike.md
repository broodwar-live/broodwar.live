+++
title = "Nuclear Strike"
description = "Nuclear Strike lets a Ghost guide a nuclear missile onto a target area after a long, visible countdown."
slug = "nuclear-strike"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "핵 공격"
caster = "ghost"
energy = 0
hp_cost = 0
damage = 500
range = 9
aoe = "128 / 192 / 256 px"
hotkey = "N"
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Nuclear_Strike"]
verified = "2026-10-11"
+++
A Ghost can call down a nuclear missile on any point within its sight range (9, or 11 with Ocular Implants). The Ghost must stay in place while it paints the target with a red dot that the opponent can see; if it is killed or interrupted the missile is lost. When the missile lands it deals the greater of 500 or two-thirds of the target's maximum hit points plus shields, with radial falloff: full damage within 128 pixels of the impact, 50% out to 192 pixels and 25% out to 256 pixels. Armor still applies, and the blast hurts the Terran's own units too.

Each strike consumes a Nuclear Missile built at a [Nuclear Silo](@/wiki/buildings/nuclear-silo.md) — an add-on to the Command Center that needs a Covert Ops — for 200 minerals, 200 gas and 8 supply (1,500 frames, 100 s). The ability itself needs no research or energy.

Nukes are uncommon in competitive play. They appear mostly in stalled late-game TvT to break a tank line, or in combination with EMP to remove a Nexus whose shields have been drained. The countdown gives the defender time to spot the dot and either scatter or hunt down the Ghost.
