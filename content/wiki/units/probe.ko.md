+++
title = "프로브"
description = "프로브는 넥서스에서 생산하는 프로토스 일꾼으로, 자원을 채취하고 건물을 소환하며 건설 중 자리를 지킬 필요가 없다."
slug = "probe"
template = "wiki/unit.html"
[taxonomies]
race = ["protoss"]
[extra]
image = "/images/wiki/units/probe.jpg"
name_en = "Probe"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 20
shields = 20
armor = 0
damage = 5
damage_type = "normal"
build_time = 20
attack_speed = 22
range = 1
speed = 4.92
size = "small"
ground_attack = true
air_attack = false
dps = 3.41
sight = 8
built_from = "nexus"
abilities = []
upgrades = ["ground-armor", "plasma-shields"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
프로브는 미네랄과 가스를 캐고 프로토스 건물을 소환한다. SCV나 드론과 달리 소환만 시작하면 건물이 스스로 완성되므로, 프로브 한 기로 여러 건물을 연달아 지을 수 있다.

## 모든 종족전

프로브는 프로토스 경제의 기반이다. 초반 정찰과 상대 정찰 일꾼 견제에 쓰이고, 일부 빌드에서는 상대 기지 근처에 전진 게이트웨이나 파일런을 짓는다.

## 주요 메커니즘

- 일반형 피해 5, 쿨다운 22프레임, 근접
- 체력 20, 실드 20, 방어력 0, 소형
- 미네랄 1회 채취량 8
