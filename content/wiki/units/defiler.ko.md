+++
title = "디파일러"
description = "디파일러는 디파일러 마운드 이후 라바에서 생산하는 저그 후반 지상 마법 유닛으로, 다크 스웜과 플레이그를 사용하고 컨슘으로 에너지를 회복한다."
slug = "defiler"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/defiler.jpg"
name_en = "Defiler"
type = "ground"
minerals = 50
gas = 150
supply = 2
hp = 80
shields = 0
armor = 1
damage = 0
damage_type = "normal"
build_time = 50
attack_speed = 0
range = 0
speed = 4.0
size = "medium"
ground_attack = false
air_attack = false
sight = 10
built_from = "hatchery"
abilities = ["dark-swarm", "plague", "consume", "burrow"]
upgrades = ["consume", "plague", "carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
디파일러는 하이브 테크인 디파일러 마운드가 필요하다. 공격 능력은 없지만 마법이 후반 교전을 좌우한다. 다크 스웜은 그 아래의 지상 유닛을 대부분의 원거리 공격으로부터 보호하고, 플레이그는 범위 내 모든 유닛에 죽이지는 않는 지속 피해를 주며, 컨슘은 아군 저그 유닛을 희생해 에너지를 회복한다.

## 테란전

후반 저그전 운영의 중심이다. 다크 스웜 아래에서 저글링·울트라리스크·러커가 바이오닉과 시즈탱크를 상대할 수 있고, 플레이그는 마린과 메딕을 약하게 만든다. 테란은 이래디에이트, 범위 공격, 디파일러 저격으로 대응한다.

## 프로토스전

후반에 쓰이며, 플레이그는 실드과 체력에 피해를 주고 다크 스웜은 드라군의 공격을 막는다. 사이오닉 스톰과 리버는 다크 스웜 아래에서도 피해를 줄 수 있다.

## 저그전

저그전은 대개 하이브 이전에 끝나므로 거의 나오지 않는다.

## 주요 메커니즘

- 다크 스웜 (에너지 100): 구름 아래 지상 유닛은 대부분의 원거리 공격을 받지 않는다. 근접 공격, 마법, 일부 범위 공격은 그대로 통한다
- 플레이그 (에너지 150, 디파일러 마운드 연구): 범위 내 모든 유닛에 지속 피해 300, 체력을 1 아래로 떨어뜨리지 않는다
- 컨슘 (디파일러 마운드 연구): 아군 저그 유닛을 희생해 에너지 50 회복
- 체력 80, 기본 방어력 1, 중형. 버로우 연구 후 버로우 가능
