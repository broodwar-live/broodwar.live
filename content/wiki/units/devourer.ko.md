+++
title = "디바우러"
description = "디바우러는 브루드 워에서 추가된 저그 대공 유닛으로, 그레이터 스파이어가 있을 때 뮤탈리스크에서 변태하며 공격 대상에 산성 포자를 누적시킨다."
slug = "devourer"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/devourer.jpg"
name_en = "Devourer"
type = "air"
minerals = 250
gas = 150
supply = 2
hp = 250
shields = 0
armor = 2
damage = 25
damage_type = "explosive"
build_time = 40
attack_speed = 100
range = 6
speed = 5.0
size = "large"
ground_attack = false
air_attack = true
dps = 3.75
sight = 10
morphs_from = "mutalisk"
abilities = []
upgrades = ["flyer-attacks", "flyer-carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
디바우러는 브루드 워에서 추가되었다. 그레이터 스파이어 완성 후 뮤탈리스크에서 변태하며 공중 유닛만 공격한다. 공격할 때마다 대상에 산성 포자를 남겨 방어력을 낮추고 공격 속도를 늦추며, 이 효과는 최대 9번까지 누적된다.

## 경쟁전에서의 역할

디바우러는 흔치 않다. 주로 커세어, 캐리어, 레이스 같은 대규모 공중 병력을 상대해야 하는 장기전에서 뮤탈리스크나 스커지와 함께 등장한다.

## 주요 메커니즘

- 폭발형 피해 25, 쿨다운 100프레임, 사거리 6, 공중 전용
- 산성 포자: 중첩당 대상 방어력 -1, 공격 쿨다운 증가, 최대 9중첩
- 총 비용 250/150 (뮤탈리스크 100/100 + 변태 150/50), 인구수 2
- 체력 250, 기본 방어력 2, 대형
