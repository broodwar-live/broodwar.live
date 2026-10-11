+++
title = "메딕"
description = "메딕은 브루드 워에서 추가된 테란 배럭 지원 유닛으로, 생체 유닛을 치료하고 레스토레이션과 옵티컬 플레어를 사용한다."
slug = "medic"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/medic.jpg"
name_en = "Medic"
type = "ground"
minerals = 50
gas = 25
supply = 1
hp = 60
shields = 0
armor = 1
damage = 0
damage_type = "normal"
build_time = 30
attack_speed = 0
range = 0
speed = 4.0
size = "small"
ground_attack = false
air_attack = false
sight = 9
built_from = "barracks"
abilities = ["restoration", "optical-flare"]
upgrades = ["infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
메딕은 브루드 워에서 추가된 유닛으로, 아카데미 완성 후 배럭에서 생산한다. 공격 능력은 없고 에너지를 써서 주변 생체 유닛을 자동으로 치료하므로, 마린·메딕 조합은 마린만 있을 때보다 훨씬 오래 버틴다.

## 저그전

저그전 바이오닉의 핵심이다. 저글링·뮤탈리스크와의 교전에서 마린을 살려 주고, 레스토레이션으로 인스네어나 패러사이트 같은 효과를 없앨 수 있다.

## 테란전

보병이 주력이 아닌 테란전에서는 거의 쓰이지 않는다.

## 프로토스전

테란이 보통 메카닉을 하기 때문에 프로토스전에서는 일부 바이오닉 빌드에서만 쓰인다.

## 주요 메커니즘

- 치료: 에너지를 소모해 생체 유닛의 체력을 회복
- 레스토레이션 (에너지 50, 아카데미 연구): 인스네어, 패러사이트, 이래디에이트, 플레이그, 락다운 등 대부분의 부정적 효과 제거
- 옵티컬 플레어 (에너지 75, 아카데미 연구): 대상 유닛의 시야를 영구적으로 줄인다
- 체력 60, 기본 방어력 1, 소형
