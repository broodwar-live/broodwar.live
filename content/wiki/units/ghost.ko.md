+++
title = "고스트"
description = "고스트는 클로킹, 기계 유닛을 무력화하는 락다운, 핵 공격을 사용하는 테란 보병 마법 유닛이다."
slug = "ghost"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/ghost.jpg"
name_en = "Ghost"
type = "ground"
minerals = 25
gas = 75
supply = 1
hp = 45
shields = 0
armor = 0
damage = 10
damage_type = "concussive"
build_time = 50
attack_speed = 22
range = 7
speed = 4.0
size = "small"
ground_attack = true
air_attack = true
dps = 6.82
sight = 9
built_from = "barracks"
abilities = ["lockdown", "nuclear-strike", "cloaking-field"]
upgrades = ["infantry-weapons", "infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
고스트는 아카데미와 사이언스 퍼실리티의 애드온 코버트 옵스가 필요한 배럭 보병이다. 진동형 공격은 평범하고, 진짜 가치는 클로킹·락다운·핵 공격에 있다.

## 저그전

저그전에서는 드물다. 락다운은 기계 유닛에만 통하므로 저그 병력에는 대상이 없고, 진동형 공격은 큰 저그 유닛에 약하다.

## 테란전

락다운으로 시즈탱크, 골리앗, 드랍십, 배틀크루저 등 기계 유닛을 묶을 수 있어 장기전 테란전에서 가끔 등장한다.

## 프로토스전

락다운은 드라군, 리버, 셔틀, 캐리어, 아비터 같은 프로토스 기계 유닛에 통하므로, 후반 캐리어·아비터를 상대하는 특수 카드로 쓰인다.

## 주요 메커니즘

- 진동형 피해 10, 쿨다운 22프레임, 사거리 7, 지상·공중 공격 가능
- 락다운 (에너지 100, 코버트 옵스 연구): 기계 유닛을 일정 시간 무력화
- 클로킹 (사용 시 에너지 25, 이후 지속 소모): 디텍터가 없으면 보이지 않는다
- 핵 공격은 커맨드 센터의 애드온 뉴클리어 사일로가 필요하며, 미사일이 떨어질 때까지 고스트가 살아서 자리를 지켜야 한다
