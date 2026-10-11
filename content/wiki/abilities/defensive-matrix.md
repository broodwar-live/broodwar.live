+++
title = "Defensive Matrix"
description = "Defensive Matrix is a Science Vessel spell that shields a single unit with a 250-point damage-absorbing barrier."
slug = "defensive-matrix"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_ko = "디펜시브 매트릭스"
caster = "science-vessel"
energy = 100
hp_cost = 0
range = 10
duration = 89.6
hotkey = "D"
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Defensive_Matrix"]
verified = "2026-10-11"
+++
Defensive Matrix surrounds one friendly or enemy non-building unit with a barrier that absorbs up to 250 damage. The barrier has no armor and soaks every damage type at full value before shields or hit points are touched. It ends when the 250 points are used up or after 168 status ticks (about 1,344 frames — roughly 90 game seconds, or about 56 seconds of real time on Fastest). Casting it again on the same unit simply resets the barrier to 250 and restarts the timer; matrices do not stack.

It costs 100 energy, has a cast range of 10 (the Science Vessel's sight range) and needs no research. Because BW enforces a minimum of 0.5 damage per hit, a matrixed unit still loses a sliver of HP from each attack.

Matrix is a situational spell — Vessel energy usually goes to Irradiate or EMP Shockwave — but it is used to keep a key unit alive: the lead Siege Tank or Dropship of a push, or a Marine sent ahead to draw Lurker spines. A matrixed cloaked unit becomes visible to the enemy.
