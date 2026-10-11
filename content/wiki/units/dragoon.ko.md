+++
title = "드라군"
description = "드라군은 사이버네틱스 코어가 필요한 프로토스 게이트웨이의 원거리 보행 유닛으로, 폭발형 공격으로 지상과 공중을 공격한다."
slug = "dragoon"
template = "wiki/unit.html"
[taxonomies]
race = ["protoss"]
[extra]
image = "/images/wiki/units/dragoon.jpg"
name_en = "Dragoon"
type = "ground"
minerals = 125
gas = 50
supply = 2
hp = 100
shields = 80
armor = 1
damage = 20
damage_type = "explosive"
build_time = 50
attack_speed = 30
range = 4
range_upgraded = 6
speed = 5.0
size = "large"
ground_attack = true
air_attack = true
dps = 10.0
sight = 8
built_from = "gateway"
abilities = []
upgrades = ["ground-weapons", "ground-armor", "plasma-shields"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
드라군은 사이버네틱스 코어 완성 후 게이트웨이에서 생산한다. 지상과 공중을 모두 공격하는 튼튼한 원거리 유닛이다. 사이버네틱스 코어에서 싱귤래리티 차지(사업)를 연구하면 사거리가 4에서 6으로 늘어나며, 표준 업그레이드로 취급된다.

## 테란전

프로토스전 병력의 중심으로 벌처, 시즈탱크, 골리앗과 싸운다. 폭발형 피해는 대형 기계 유닛에 효과적이지만 마린 같은 소형 유닛에는 약하다.

## 프로토스전

프로토스전은 초반 드라군 싸움으로 승부가 나는 경우가 많고, 컨트롤과 점사가 매우 중요하다. 리버는 뭉친 드라군에 강하다.

## 저그전

폭발형 피해가 저글링에 약해 저그전에서는 덜 중요하지만, 뮤탈리스크와 러커를 상대할 때 유용하다.

## 주요 메커니즘

- 폭발형 피해 20, 쿨다운 30프레임, 사거리 4 (싱귤래리티 차지 연구 시 6), 지상·공중 공격
- 폭발형 피해: 대형 100%, 중형 75%, 소형 50%
- 체력 100, 실드 80, 기본 방어력 1, 대형
- 셔틀에서 4칸 차지
