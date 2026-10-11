+++
title = "다크 아콘"
description = "다크 아콘은 브루드 워에서 추가된 프로토스 마법 유닛으로, 다크 템플러 두 기를 합체해 만들며 피드백·마인드 컨트롤·멜스트롬을 사용한다."
slug = "dark-archon"
template = "wiki/unit.html"
[taxonomies]
race = ["protoss"]
[extra]
image = "/images/wiki/units/dark-archon.jpg"
name_en = "Dark Archon"
type = "ground"
minerals = 250
gas = 200
supply = 4
hp = 25
shields = 200
armor = 1
damage = 0
damage_type = "normal"
build_time = 20
attack_speed = 0
range = 0
speed = 4.92
size = "large"
ground_attack = false
air_attack = false
sight = 10
merges_from = "dark-templar"
abilities = ["mind-control", "maelstrom", "feedback"]
upgrades = ["mind-control", "maelstrom", "ground-armor", "plasma-shields"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
다크 아콘은 다크 템플러 두 기를 합체해 만든다. 공격 능력은 없고 피드백, 멜스트롬, 마인드 컨트롤 세 가지 마법에 의존한다.

## 경쟁전에서의 역할

다크 아콘은 흔치 않다. 마인드 컨트롤로 적 유닛을 빼앗을 수 있으며, 일꾼을 빼앗으면 다른 종족의 건물과 유닛까지 쓸 수 있다. 멜스트롬은 생체 유닛을 잠시 멈추게 해 저그 상대로 쓰인 적이 있다. 피드백은 대상의 에너지를 없애고 그만큼 피해를 준다.

## 주요 메커니즘

- 피드백 (에너지 50): 대상의 에너지를 모두 없애고 없앤 에너지만큼 피해
- 마인드 컨트롤 (에너지 150, 템플러 아카이브 연구): 대상을 영구히 빼앗지만 다크 아콘의 보호막이 모두 사라진다
- 멜스트롬 (에너지 100, 템플러 아카이브 연구): 범위 내 생체 유닛을 잠시 이동·공격 불가 상태로 만든다
- 체력 25, 보호막 200, 기본 방어력 1, 대형. 비용은 다크 템플러 두 기분 (250/200)
