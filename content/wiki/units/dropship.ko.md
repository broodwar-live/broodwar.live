+++
title = "드랍십"
description = "드랍십은 컨트롤 타워가 필요한 테란 스타포트 수송선으로, 지상 유닛을 최대 8칸까지 태울 수 있다."
slug = "dropship"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/dropship.jpg"
name_en = "Dropship"
type = "air"
minerals = 100
gas = 100
supply = 2
hp = 150
shields = 0
armor = 1
damage = 0
damage_type = "normal"
build_time = 50
attack_speed = 0
range = 0
speed = 5.47
size = "large"
ground_attack = false
air_attack = false
sight = 8
built_from = "starport"
abilities = []
upgrades = ["ship-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
드랍십은 컨트롤 타워가 붙은 스타포트에서 생산한다. 공격 능력은 없고 지상 유닛을 최대 8칸까지 수송한다. 시즈탱크, 벌처, 보병을 언덕 위나 적 병력 뒤, 비어 있는 확장 기지에 내리는 드랍 플레이의 핵심이다.

## 저그전

마린·메딕을 저그 확장 기지와 일꾼 라인에 내리는 드랍은 본대가 자리를 지키는 동안 저그를 압박하는 대표적인 방법이다.

## 테란전

탱크와 벌처 드랍은 테란전에서 탱크 라인을 뚫거나 우회하는 중요한 수단이다.

## 프로토스전

프로토스전에서 예상하지 못한 곳에 탱크와 벌처를 내려 프로토스 병력을 분산시킨다.

## 주요 메커니즘

- 수송량 8칸: 마린·파이어뱃·메딕·고스트·SCV는 1칸, 벌처·골리앗은 2칸, 시즈탱크는 4칸
- 대형, 체력 150, 기본 방어력 1
- 유닛을 태운 채 격추되면 안에 있던 유닛도 모두 죽는다
