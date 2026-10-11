+++
title = "파이어뱃"
description = "파이어뱃은 아카데미가 필요한 테란 배럭 보병으로, 짧은 사거리의 진동형 범위 피해를 입혀 소형 근접 유닛에 강하다."
slug = "firebat"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/firebat.jpg"
name_en = "Firebat"
type = "ground"
minerals = 50
gas = 25
supply = 1
hp = 50
shields = 0
armor = 1
damage = 8
damage_type = "concussive"
build_time = 24
attack_speed = 22
range = 1
speed = 4.0
size = "small"
ground_attack = true
air_attack = false
sight = 7
built_from = "barracks"
abilities = []
upgrades = ["stim-pack", "infantry-weapons", "infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://liquipedia.net/starcraft/Firebat"]
verified = "2026-10-11"
+++
파이어뱃은 아카데미 완성 후 배럭에서 생산하는 화염방사 보병이다. 한 번 공격할 때 파이어뱃 앞쪽 직선상에 진동형 피해 8짜리 작은 범위 타격이 최대 세 번 발생하며, 보통 대상은 그중 두 번에 맞기 때문에 게임에서는 공격력을 16으로 표시한다. 저글링이나 질럿 같은 소형 유닛에는 매우 강하지만 중형·대형 유닛에는 약하다.

## 저그전

저그전에서는 주로 초반에 벙커에 넣거나 마린과 함께 운용해 저글링 공격을 막는 데 쓰인다. 바이오닉의 주력이라기보다 소수만 섞는 보조 유닛이다.

## 테란전

테란전에서는 팩토리와 스타포트 유닛이 중심이 되므로 거의 쓰이지 않는다.

## 프로토스전

초반 질럿 공격을 막는 데 도움이 되지만, 프로토스전에서는 대부분 메카닉으로 전환하기 때문에 많이 생산되지 않는다.

## 주요 메커니즘

- 타격당 진동형 피해 8, 공격 1회에 최대 3회 범위 타격 (보통 대상에는 2회, 게임 내 표시 16), 쿨다운 22프레임, 매우 짧은 사거리
- 진동형 피해: 소형 100%, 중형 50%, 대형 25%
- 마린처럼 스팀팩 사용 가능 (체력 10 소모)
- 체력 50, 기본 방어력 1로 마린보다 단단하다
