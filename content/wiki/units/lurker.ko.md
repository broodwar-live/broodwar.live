+++
title = "러커"
description = "러커는 브루드 워에서 추가된 저그 유닛으로, 히드라리스크에서 변태하며 버로우한 상태에서만 일직선으로 가시 공격을 한다."
slug = "lurker"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/lurker.jpg"
name_en = "Lurker"
type = "ground"
minerals = 125
gas = 125
supply = 2
hp = 125
shields = 0
armor = 1
damage = 20
damage_type = "normal"
build_time = 40
attack_speed = 37
range = 6
speed = 5.82
size = "medium"
ground_attack = true
air_attack = false
dps = 8.11
sight = 8
morphs_from = "hydralisk"
abilities = []
upgrades = ["lurker-aspect", "missile-attacks", "carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
러커는 브루드 워에서 추가되었다. 레어가 필요한 러커 변태를 히드라리스크 덴에서 연구하면 히드라리스크가 러커로 변태할 수 있다. 러커는 버로우해야만 공격할 수 있고, 버로우하면 디텍터 없이는 보이지 않으며, 일직선상의 모든 적 지상 유닛에 가시 피해를 준다.

## 테란전

마린·메딕을 상대하는 핵심 유닛이다. 테란은 컴샛 스테이션 스캔, 사이언스 베슬, 그리고 러커보다 사거리가 긴 시즈탱크로 대응한다.

## 프로토스전

저그 병력의 핵심으로, 질럿과 드라군을 상대로 길목을 지키며 프로토스가 옵저버를 꼭 데리고 다니게 만든다.

## 저그전

일부 저그전에서 저글링을 막는 데 쓰이며, 상대는 오버로드나 스포어 콜로니로 탐지해야 한다.

## 주요 메커니즘

- 일직선 일반형 피해 20, 쿨다운 37프레임, 사거리 6
- 버로우 상태에서만 공격 가능. 버로우한 러커는 탐지해야 공격할 수 있다
- 일직선 범위 피해는 적 유닛에게만 들어간다
- 총 비용 125/125 (히드라리스크 75/25 + 변태 50/100), 인구수 2
- 체력 125, 기본 방어력 1, 중형. 오버로드에서 4칸 차지
