+++
title = "스파이더 마인"
description = "스파이더 마인은 벌처가 설치하는 매설형 폭탄으로, 가까이 온 적 지상 유닛에게 달려들어 폭발한다."
slug = "spider-mines"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_en = "Spider Mines"
caster = "vulture"
energy = 0
hp_cost = 0
damage = 125
aoe = "50 / 75 / 100 px"
hotkey = "I"
researched_at = "machine-shop"
research_minerals = 100
research_gas = 100
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Spider_Mine"]
verified = "2026-10-11"
+++
스파이더 마인을 연구하면 벌처 한 기마다 마인 3개를 땅에 설치할 수 있다. 설치된 마인은 땅속에 숨어 있다가 적의 비호버 지상 유닛이 다가오면 튀어나와 쫓아가 폭발하며, 폭발형 125의 피해와 방사형 스플래시(50픽셀까지 100%, 75픽셀까지 50%, 100픽셀까지 25%)를 준다. 이 스플래시는 마인 주인의 유닛에게도 피해를 준다. 은폐 유닛은 탐지되지 않아도 마인을 작동시키며, 공중 유닛과 호버 유닛에는 반응하지 않는다. 묻혀 있는 마인은 탐지되어야만 공격할 수 있다.

연구는 [머신 샵](@/wiki/buildings/machine-shop.ko.md)에서 미네랄 100, 가스 100(1,200프레임, 80초)에 진행한다. 마인 설치에는 에너지가 들지 않으며, 벌처는 3개를 다 쓰면 더 설치할 수 없다.

마인은 테란 메카닉의 기본 요소다. 탱크 라인을 보호하고, 확장 지역과 진격로를 감시하며, 뭉친 지상 병력을 응징한다. 상대는 탐지와 원거리 공격으로 제거하거나 값싼 유닛으로 일부러 터뜨려 처리한다.
