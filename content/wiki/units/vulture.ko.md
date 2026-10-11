+++
title = "벌처"
description = "벌처는 진동형 공격과 스파이더 마인을 갖춘 테란 팩토리의 빠른 호버 바이크다."
slug = "vulture"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/vulture.jpg"
name_en = "Vulture"
type = "ground"
minerals = 75
gas = 0
supply = 2
hp = 80
shields = 0
armor = 0
damage = 20
damage_type = "concussive"
build_time = 30
attack_speed = 30
range = 5
speed = 6.4
speed_upgraded = 9.6
size = "medium"
ground_attack = true
air_attack = false
dps = 10.0
sight = 8
built_from = "factory"
abilities = ["spider-mines"]
upgrades = ["spider-mines", "ion-thrusters", "vehicle-weapons", "vehicle-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
벌처는 미네랄만 드는 저렴한 팩토리 유닛이다. 빠르고, 이온 스러스터 연구 후에는 더 빨라지며, 스파이더 마인 연구 후 기당 마인 3개를 매설할 수 있다. 진동형 공격은 소형 유닛에 강하고 중형·대형 유닛에는 약하다.

## 저그전

저글링과 드론을 잡는 견제에 쓰이고, 스파이더 마인으로 시야를 확보하며 러커·저글링의 이동을 견제한다. 메카닉 저그전의 핵심 유닛이다.

## 테란전

테란전의 중심 유닛이다. 스파이더 마인으로 맵을 장악하고 시즈탱크 라인을 보호하며, 빠른 벌처 부대로 맵 주도권을 다투고 일꾼을 견제한다.

## 프로토스전

프로토스전 메카닉의 기본 구성이다. 진동형 피해는 질럿에 매우 효과적이고, 마인 지대는 드라군과 질럿의 진격을 늦춘다. 정면 교전에서는 드라군에 약하다.

## 주요 메커니즘

- 진동형 피해 20, 쿨다운 30프레임, 사거리 5
- 스파이더 마인 (머신 샵 연구): 벌처마다 마인 3개. 마인은 땅속에 묻혀 근처 적 지상 유닛을 공격하며 공중 유닛은 공격할 수 없다
- 이온 스러스터 (머신 샵): 이동 속도 증가
- 중형, 체력 80, 방어력 0
