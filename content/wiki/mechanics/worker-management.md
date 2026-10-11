+++
title = "Worker Management"
description = "Mineral and gas saturation, worker transfers, mineral walking and SCV repair in Brood War."
slug = "worker-management"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Mining", "https://liquipedia.net/starcraft/SCV", "https://liquipedia.net/starcraft/Shortcuts"]
verified = "2026-10-11"
+++

## Overview

Workers are the economy. How many you build, where you put them and how you protect them determines income.

## Saturation

Income rises in a straight line up to about **one worker per mineral patch**, keeps rising more slowly beyond that, and levels off at roughly **three workers per patch**; past that point additional workers add nothing. Each extra worker beyond the first per patch is therefore less efficient than the first. Gas is saturated by **three workers** per geyser on most modern maps (four on some older ones).

When a new base finishes, moving some workers from a saturated main lets the new base start mining at once.

## Harassment and defence

Killing workers costs the opponent both the replacement and the mining time lost while it is rebuilt. Common harassment includes Mutalisks, Vultures, drops, Reavers and Dark Templar. Every worker has a 5-damage, very short-range attack, so a group of workers can fight off a single early raider, but against splash (Reavers, tanks, Psionic Storm) workers should move away.

## Mineral walking

A worker ordered to gather from a mineral patch or geyser it can see passes through other units on the way, which lets workers slip past blockers or out of a surround.

## SCV repair

SCVs can repair mechanical units and Terran buildings. Repair costs roughly a third of the target's build cost in minerals and gas, and several SCVs can repair the same target. SCVs count as both biological and mechanical, so they can be healed by Medics, repaired by other SCVs, hit by Irradiate and locked down.
