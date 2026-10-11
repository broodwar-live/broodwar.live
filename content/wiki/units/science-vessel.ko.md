+++
title = "사이언스 베슬"
description = "사이언스 베슬은 디펜시브 매트릭스, EMP 쇼크웨이브, 이래디에이트를 사용하는 테란 스타포트의 지원 비행선이자 디텍터다."
slug = "science-vessel"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/science-vessel.jpg"
name_en = "Science Vessel"
type = "air"
minerals = 100
gas = 225
supply = 2
hp = 200
shields = 0
armor = 1
damage = 0
damage_type = "normal"
build_time = 80
attack_speed = 0
range = 0
speed = 5.0
size = "large"
ground_attack = false
air_attack = false
sight = 10
built_from = "starport"
abilities = ["defensive-matrix", "emp-shockwave", "irradiate"]
upgrades = ["irradiate", "ship-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
사이언스 베슬은 컨트롤 타워가 붙은 스타포트와 사이언스 퍼실리티가 필요하다. 공격 능력은 없지만 이동형 디텍터이고 세 가지 마법을 갖고 있어 저그전과 프로토스전에서 테란의 가장 중요한 유닛 중 하나다.

## 저그전

저그전에서 필수 유닛이다. 러커를 탐지하고, 이래디에이트로 뮤탈리스크·디파일러·러커 같은 생체 유닛을 잡는다. 스커지로부터 베슬을 지키는 것이 늘 관건이다.

## 테란전

테란전에서는 주로 클로킹 레이스와 고스트를 탐지하는 데 쓰이며, 디펜시브 매트릭스로 중요한 유닛을 보호할 수 있다.

## 프로토스전

EMP 쇼크웨이브는 범위 내의 실드와 에너지를 없애므로 하이 템플러, 아비터, 아칸처럼 실드 의존도가 높은 유닛을 상대하는 핵심 수단이다.

## 주요 메커니즘

- 디텍터
- 디펜시브 매트릭스 (에너지 100): 유닛에 피해를 흡수하는 실드를 씌운다
- EMP 쇼크웨이브 (에너지 100, 사이언스 퍼실리티 연구): 대상 지역의 실드와 에너지를 모두 제거
- 이래디에이트 (에너지 75, 사이언스 퍼실리티 연구): 대상 주변 생체 유닛에 지속 피해
