+++
title = "인페스티드 테란"
description = "인페스티드 테란은 인페스티드 커맨드 센터에서 생산하는 저그 자폭 유닛으로, 폭발하며 범위에 500의 피해를 준다."
slug = "infested-terran"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
aliases = ["감염된 테란"]
image = "/images/wiki/units/infested-terran.jpg"
name_en = "Infested Terran"
type = "ground"
minerals = 100
gas = 50
supply = 1
hp = 60
shields = 0
armor = 0
damage = 500
damage_type = "explosive"
build_time = 40
attack_speed = 0
range = 0
speed = 5.82
size = "small"
ground_attack = true
air_attack = false
sight = 5
built_from = "infested-command-center"
abilities = ["burrow"]
upgrades = ["carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
인페스티드 테란은 인페스티드 커맨드 센터에서만 생산할 수 있다. 인페스티드 커맨드 센터는 퀸이 체력이 절반 이하인 테란 커맨드 센터를 감염시켜 얻는다. 대상에게 달려가 폭발해 강력한 범위 피해를 준다.

## 경쟁전에서의 역할

상대가 테란이어야 하고, 손상된 커맨드 센터가 감염되도록 내버려 두어야 하므로 경쟁전에서는 거의 볼 수 없다. 전략적 선택지라기보다 진기한 유닛이다.

## 주요 메커니즘

- 폭발 시 폭발형 범위 피해 500, 지상 전용. 폭발하면 소멸
- 체력 60, 방어력 0, 소형
- 버로우 연구 후 버로우 가능
