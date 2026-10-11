+++
title = "건설로봇"
description = "SCV는 커맨드 센터에서 생산하는 테란 일꾼으로, 자원을 채취하고 건물을 지으며 기계 유닛과 건물을 수리한다."
slug = "scv"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/scv.jpg"
name_en = "SCV"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 60
shields = 0
armor = 0
damage = 5
damage_type = "normal"
build_time = 20
attack_speed = 15
range = 1
speed = 4.92
size = "small"
ground_attack = true
air_attack = false
dps = 5.0
sight = 7
built_from = "command-center"
abilities = []
upgrades = ["infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
SCV는 테란의 일꾼이다. 미네랄과 가스를 캐고, 모든 테란 건물을 지으며, 기계 유닛과 건물을 자원을 들여 수리할 수 있다. 드론과 달리 건물을 지어도 사라지지 않고, 건물이 완성될 때까지 건설에 묶인다.

## 모든 종족전

SCV는 테란 경제의 기반이다. 채취 외에도 벙커·시즈 탱크·배틀크루저 수리, 저그전 입구 막기에 쓰이며, 세 종족 일꾼 중 가장 높은 체력(60) 덕분에 초반 위기 상황에서 직접 싸우기도 한다.

## 주요 메커니즘

- 일반형 피해 5, 쿨다운 15프레임, 근접
- 체력 60, 방어력 0, 소형
- 미네랄 1회 채취량 8
- 수리는 자원을 소모해 기계 유닛과 테란 건물의 체력을 회복한다
