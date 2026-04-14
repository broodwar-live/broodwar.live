+++
title = "Game Speed"
description = "How game speed settings affect timing, frame rate, and real-time conversion in Brood War."
slug = "game-speed"
template = "wiki/mechanic.html"
+++

## Overview

StarCraft: Brood War operates on a fixed-tick game engine. The simulation advances in discrete **frames**, and the game speed setting determines how many frames are processed per real-time second. All competitive play uses the **Fastest** speed setting, which is the standard for ladder games, tournaments, and professional matches.

## Speed Settings

Brood War offers 7 speed settings:

| Speed    | Frames per second | ms per frame |
|----------|-------------------|-------------|
| Slowest  | ~6.37             | ~157        |
| Slower   | ~8.49             | ~118        |
| Slow     | ~10.62            | ~94         |
| Normal   | ~12.74            | ~79         |
| Fast     | ~14.87            | ~67         |
| Faster   | ~16.99            | ~59         |
| Fastest  | ~23.81            | ~42         |

The "Fastest" setting processes approximately **23.81 logical frames per second**, though the commonly cited figure of **15.17 game-seconds per real-second** accounts for the distinction between "game time" and real time. In practical terms, 1 real second at Fastest speed corresponds to roughly 15.17 game frames when measuring in the engine's internal "game second" unit.

## Frame-to-Real-Time Conversion

For replay analysis and timing discussions, the standard conversion is:

```
real_seconds = frames / 15.17
```

This means a game that lasts 10,000 frames is approximately 659 real-time seconds, or about 11 minutes. Build order timings in competitive play are often expressed in either frame counts or game-time minutes, and knowing the conversion is essential for replay analysis tools.

## Why It Matters

Frame-perfect timing is important in several areas of competitive play:

- **Build orders**: The exact frame at which you issue a command determines whether a build order is economically optimal. A supply depot started 50 frames late can cascade into a delayed expansion.
- **Micro techniques**: Many advanced micro tricks depend on exploiting the gap between frames — for example, attack-move canceling and stutter-stepping work because the game only processes commands on frame boundaries.
- **Cooldown management**: Weapon cooldowns, spell cooldowns, and production times are all measured in frames. Understanding these values lets players optimize engagement timing.

## Remastered Note

StarCraft: Remastered uses the same underlying frame-based engine as the original. The speed settings and frame timings are identical — Remastered only changes the graphics and audio layer, not the simulation. This means all frame-based analysis and timing data from original Brood War applies equally to Remastered.
