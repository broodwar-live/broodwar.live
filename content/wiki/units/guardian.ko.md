+++
title = "가디언"
description = "가디언은 그레이터 스파이어가 있을 때 뮤탈리스크에서 변태하는 느린 저그 비행 유닛으로, 먼 거리에서 지상 대상을 공격한다."
slug = "guardian"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/guardian.jpg"
name_en = "Guardian"
type = "air"
minerals = 150
gas = 200
supply = 2
hp = 150
shields = 0
armor = 2
damage = 20
damage_type = "normal"
build_time = 40
attack_speed = 30
range = 8
speed = 2.5
size = "large"
ground_attack = true
air_attack = false
dps = 10.0
sight = 11
morphs_from = "mutalisk"
abilities = []
upgrades = ["flyer-attacks", "flyer-carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
가디언은 그레이터 스파이어 완성 후 뮤탈리스크에서 변태한다. 지상 대상만 공격할 수 있지만 사거리 8로 미사일 터렛, 포톤 캐논, 성큰 콜로니 같은 방어 건물보다 길며, 매우 느리다.

## 테란전

후반에 방어가 두터운 테란 진지, 특히 메카닉을 상대로 가끔 쓰인다. 차론 부스터를 연구한 골리앗, 발키리, 레이스, 이래디에이트가 주된 대응책이다.

## 프로토스전

포톤 캐논과 느린 지상 유닛을 사거리 밖에서 공격할 수 있지만, 호위가 없으면 커세어, 스카웃, 캐리어에 쉽게 잡힌다.

## 저그전

저그전에서는 거의 쓰이지 않는다.

## 주요 메커니즘

- 일반형 피해 20, 쿨다운 30프레임, 사거리 8, 지상 전용
- 총 비용 150/200 (뮤탈리스크 100/100 + 변태 50/100), 인구수 2
- 체력 150, 기본 방어력 2, 대형
