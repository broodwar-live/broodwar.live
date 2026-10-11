+++
title = "인스네어"
description = "인스네어는 범위 안 유닛의 이동 속도와 공격 속도를 늦추는 퀸 마법이다."
slug = "ensnare"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_en = "Ensnare"
caster = "queen"
energy = 75
hp_cost = 0
range = 9
aoe = "128×128 px"
duration = 40.0
hotkey = "E"
researched_at = "queens-nest"
research_minerals = 100
research_gas = 100
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Ensnare"]
verified = "2026-10-11"
+++
인스네어는 목표 지점 주변 128×128픽셀 정사각형에 걸치는, 건물이 아니고 버로우하지 않은 모든 유닛(공중·지상, 아군·적군 모두, 단 시전한 퀸은 제외)에 걸린다. 75 상태 틱(600프레임 — 40 게임 초, 가장 빠름 기준 실제 약 25초) 동안 대상 유닛은 이동 속도가 절반이 되고, 가속과 선회가 25% 느려지며, 무기 쿨다운이 25% 늘어난다. 스팀팩이 켜져 있거나 이동·공격 속도 업그레이드가 있는 유닛은 대신 그 보너스가 상쇄된다. 인스네어에 걸린 은폐 유닛은 적에게 보인다.

에너지 75가 들고 사거리는 9이며, [퀸즈 네스트](@/wiki/buildings/queens-nest.ko.md)에서 미네랄 100, 가스 100(1,200프레임, 80초)에 연구한다. 레스토레이션으로 해제된다.

퀸 자체가 드물기 때문에 인스네어는 틈새 마법이다. 뮤탈리스크, 커세어, 스팀팩 바이오처럼 속도에 의존하는 병력에 가장 효과적이며, 레이스나 아비터로 은폐된 병력을 드러내는 데도 쓰인다.
