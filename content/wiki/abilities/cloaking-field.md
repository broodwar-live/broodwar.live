+++
title = "Cloaking Field"
description = "Cloaking makes Wraiths and Ghosts invisible to enemies without detection while it drains their energy."
slug = "cloaking-field"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "클로킹"
caster = "wraith"
energy = 25
hp_cost = 0
hotkey = "C"
researched_at = "control-tower"
research_minerals = 150
research_gas = 150
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Detection"]
verified = "2026-10-11"
+++
Cloaking turns the caster invisible to every enemy that lacks detection. Activating it costs 25 energy, and while the unit stays cloaked it stops regenerating energy and instead loses a little every frame; when the energy runs out the cloak drops. In the engine the drain is slightly faster for the Wraith than for the Ghost.

Two separate researches exist. The Wraith's **Cloaking Field** is researched at the [Control Tower](@/wiki/buildings/control-tower.md) for 150 minerals and 150 gas (1,500 frames, 100 s). The Ghost's version, **Personnel Cloaking**, is researched at the [Covert Ops](@/wiki/buildings/covert-ops.md) for 100/100 (1,200 frames, 80 s). Both use the same 25-energy activation cost.

A cloaked unit can still be revealed: detectors (Missile Turret, Photon Cannon, Spore Colony, Science Vessel, Observer, Overlord) and Comsat scans expose it, and in the engine a cloaked unit that is under Defensive Matrix, Lockdown, Maelstrom, Irradiate, Ensnare, Plague, Stasis Field or Acid Spores is visible to everyone. Cloaked Wraiths are mainly a harassment tool, most often seen in TvT; cloaked Ghosts are used to position for Lockdown or a Nuclear Strike. Decloaking when not under threat saves energy.
