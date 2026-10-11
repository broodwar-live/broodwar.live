+++
title = "레어"
description = "레어는 해처리를 업그레이드한 건물로, 스파이어·퀸즈 네스트·러커 같은 저그 중반 테크를 열어 줍니다."
slug = "lair"
template = "wiki/building.html"
[taxonomies]
race = ["zerg"]
[extra]
name_en = "Lair"
minerals = 150
gas = 100
hp = 1800
shields = 0
armor = 1
build_time = 100
hotkey = "L"
size = "large"
produces = ["drone", "zergling", "hydralisk", "mutalisk", "scourge", "queen", "overlord"]
unlocks = ["spire", "queens-nest"]
morphs_from = "hatchery"
requires = ["spawning-pool"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp"]
verified = "2026-10-11"
+++
레어는 [해처리](@/wiki/buildings/hatchery.ko.md)에서 변태하며 스포닝 풀이 필요합니다. 변태 중에도 라바를 계속 생산하며, [스파이어](@/wiki/buildings/spire.ko.md), [퀸즈 네스트](@/wiki/buildings/queens-nest.ko.md), 히드라리스크 덴의 [러커 변태](@/wiki/upgrades/lurker-aspect.ko.md) 연구를 열어 줍니다. 오버로드 업그레이드(벤트럴 색, 안테나, 뉴매티좀 카라페이스)는 레어나 하이브에서 연구합니다.

레어 타이밍은 저그 빌드에서 가장 분명한 신호 중 하나입니다. ZvT와 ZvP에서 빠른 레어는 보통 뮤탈리스크나 러커로 이어지고, ZvZ에서는 레어 타이밍이 누가 먼저 뮤탈을 뽑느냐를 좌우하는 경우가 많습니다.
