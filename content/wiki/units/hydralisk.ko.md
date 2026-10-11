+++
title = "히드라리스크"
description = "히드라리스크는 히드라리스크 덴 이후 애벌레에서 생산하는 저그의 주력 원거리 지상 유닛으로, 지상과 공중을 공격하고 러커로 변태할 수 있다."
slug = "hydralisk"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/hydralisk.jpg"
name_en = "Hydralisk"
type = "ground"
minerals = 75
gas = 25
supply = 1
hp = 80
shields = 0
armor = 0
damage = 10
damage_type = "explosive"
build_time = 28
attack_speed = 15
range = 4
range_upgraded = 5
speed = 3.66
speed_upgraded = 5.49
size = "medium"
ground_attack = true
air_attack = true
dps = 10.0
sight = 6
built_from = "hatchery"
abilities = ["burrow"]
upgrades = ["muscular-augments", "grooved-spines", "lurker-aspect", "missile-attacks", "carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
히드라리스크는 75/25의 원거리 유닛으로, 폭발형 가시로 지상과 공중을 공격한다. 히드라리스크 덴에서 근육 강화(이동 속도)와 홈 파인 가시(사거리)를 연구하며, 러커 변태를 연구하면 러커로 변태할 수 있다.

## 테란전

테란전에서는 주로 러커로 변태하기 위한 유닛이다. 대량의 히드라리스크는 바이오닉, 시즈 탱크, 이레디에이트에 약하다.

## 프로토스전

저글링·러커와 함께 저그 병력의 표준 구성이다. 커세어, 셔틀, 스카웃을 상대하는 대공을 맡지만 사이오닉 스톰과 리버에 취약하다.

## 저그전

일부 저그전에서 뮤탈리스크를 상대하는 대공이나 러커 변태용으로 쓰인다.

## 주요 메커니즘

- 폭발형 피해 10, 쿨다운 15프레임, 사거리 4 (홈 파인 가시 연구 시 5)
- 폭발형 피해: 대형 100%, 중형 75%, 소형 50%
- 근육 강화: 이동 속도 증가
- 체력 80, 방어력 0, 중형. 버로우 연구 후 버로우 가능
