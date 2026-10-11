+++
title = "시즈탱크"
description = "시즈탱크는 시즈 모드로 전환해 장거리 폭발형 범위 공격을 하는 테란 팩토리의 포격 유닛이다."
slug = "siege-tank"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
aliases = ["시즈 탱크", "탱크"]
image = "/images/wiki/units/siege-tank.jpg"
name_en = "Siege Tank"
type = "ground"
minerals = 150
gas = 100
supply = 2
hp = 150
shields = 0
armor = 1
damage = 30
damage_type = "explosive"
build_time = 50
attack_speed = 37
range = 7
speed = 4.0
size = "large"
ground_attack = true
air_attack = false
dps = 12.16
sight = 10
built_from = "factory"
abilities = ["siege-mode"]
upgrades = ["siege-tech", "vehicle-weapons", "vehicle-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
시즈탱크는 팩토리에 머신 샵 애드온이 있어야 생산할 수 있다. 탱크 모드에서는 이동하며 싸우고, 시즈 모드 연구 후에는 고정 포대로 전환해 훨씬 긴 사거리와 높은 공격력을 얻는다. 어느 종족전에서든 테란이 땅을 장악하는 방식은 시즈탱크가 결정한다.

## 저그전

바이오닉과 메카닉 모두에서 러커를 사거리 밖에서 처리하고 확장 기지를 지킨다. 저그가 탱크를 무력화하는 주된 수단은 다크 스웜이다.

## 테란전

테테전은 대부분 탱크 라인끼리 맞서는 진지전이다. 언덕을 두고 다투고, 드랍십으로 상대 라인 뒤에 탱크를 내리며, 스파이더 마인과 골리앗으로 자기 라인을 지킨다.

## 프로토스전

프로토스전 메카닉의 중심으로, 드라군과 질럿을 상대로 진지를 지킨다. 프로토스는 측면 공격, 최소 사거리 안으로 파고드는 질럿, 아비터의 스테이시스 필드와 리콜, 캐리어로 대응한다.

## 주요 메커니즘

- 탱크 모드: 폭발형 피해 30, 쿨다운 37프레임, 사거리 7
- 시즈 모드: 폭발형 범위 피해 70, 쿨다운 75프레임, 사거리 12, 최소 사거리 2
- 시즈 모드의 범위 피해는 아군에게도 들어간다
- 폭발형 피해: 대형 100%, 중형 75%, 소형 50%
- 드랍십에서 4칸 차지
