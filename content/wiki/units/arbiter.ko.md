+++
title = "아비터"
description = "아비터는 아비터 트리뷰널 이후 스타게이트에서 생산하는 프로토스 지원 비행선으로, 주변 아군을 은폐시키고 리콜과 스테이시스 필드를 사용한다."
slug = "arbiter"
template = "wiki/unit.html"
[taxonomies]
race = ["protoss"]
[extra]
image = "/images/wiki/units/arbiter.jpg"
name_en = "Arbiter"
type = "air"
minerals = 100
gas = 350
supply = 4
hp = 200
shields = 150
armor = 1
damage = 10
damage_type = "explosive"
build_time = 160
attack_speed = 45
range = 5
speed = 5.0
size = "large"
ground_attack = true
air_attack = true
dps = 3.33
sight = 9
built_from = "stargate"
abilities = ["recall", "stasis-field"]
upgrades = ["air-weapons", "air-armor", "plasma-shields"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
아비터는 아비터 트리뷰널이 필요하다. 주변 아군 유닛을 은폐시키며(다른 아비터와 건물은 제외), 리콜은 대상 지역의 유닛을 아비터 위치로 순간 이동시키고, 스테이시스 필드는 범위 내 유닛을 얼려 무적 상태이지만 행동할 수 없게 만든다.

## 테란전

후반 프로토스전의 핵심 유닛이다. 은폐된 병력, 테란 기지로의 리콜, 테란 병력 일부에 거는 스테이시스 필드가 자주 쓰인다. 테란은 사이언스 베슬(EMP와 탐지), 컴샛 스테이션 스캔, 고스트의 락다운으로 대응한다.

## 프로토스전

프로토스전에서는 거의 쓰이지 않는다.

## 저그전

저그가 오버로드로 탐지를 충분히 갖추고 있어 저그전에서는 거의 쓰이지 않는다.

## 주요 메커니즘

- 폭발형 피해 10, 쿨다운 45프레임, 사거리 5, 지상·공중 공격
- 리콜 (에너지 150, 아비터 트리뷰널 연구)
- 스테이시스 필드 (에너지 100, 아비터 트리뷰널 연구)
- 체력 200, 실드 150, 기본 방어력 1, 대형, 인구수 4
