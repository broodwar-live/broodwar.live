+++
title = "Game Speed"
description = "How Brood War's speed settings map frames to real time, and how this wiki converts frames to seconds."
slug = "game-speed"
template = "wiki/mechanic.html"
[extra]
sources = ["https://liquipedia.net/starcraft/Game_Speed", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h"]
verified = "2026-10-11"
+++

## Overview

StarCraft: Brood War advances its simulation in discrete steps called **frames** (logical steps). Every timing in the game — weapon cooldowns, build times, spell durations, movement — is defined in frames. The speed setting only changes how long the game waits between frames. Competitive play uses **Fastest**.

## Speed settings

| Speed | ms per frame | Frames per real second |
|-------|--------------|------------------------|
| Slowest | 167 | ≈ 5.99 |
| Slower | 111 | ≈ 9.01 |
| Slow | 83 | ≈ 12.05 |
| Normal | 67 | ≈ 14.93 |
| Fast | 56 | ≈ 17.86 |
| Faster | 48 | ≈ 20.83 |
| Fastest | 42 | ≈ 23.81 |

## Converting frames

- **Real time on Fastest**: seconds = frames × 0.042 (frames ÷ 23.81). A 10,000-frame game lasts about 420 seconds, or 7 minutes.
- **Game seconds**: build and research times are traditionally quoted in "game seconds" of about 15 frames each (close to Normal speed). This wiki follows that convention for build, research and spell durations: seconds = frames ÷ 15. A Marine's 360 frames is listed as 24 s, which takes about 15 real seconds on Fastest.

Liquipedia lists times in real seconds on Fastest, so its numbers are smaller by a factor of about 1.6 than the game-second values used here.

## Why frames matter

Because the simulation only advances in whole frames, attack cooldowns, unit production and spell timers are exact frame counts. Replay analysis works directly with frame numbers, and tools convert them to real time with the 42 ms figure.
