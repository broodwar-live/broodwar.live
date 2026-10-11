+++
title = "퀸"
description = "퀸은 퀸즈 네스트 이후 애벌레에서 생산하는 저그 비행 마법 유닛으로, 인스네어·스폰 브루들링·패러사이트를 사용하고 커맨드 센터를 감염시킬 수 있다."
slug = "queen"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/queen.jpg"
name_en = "Queen"
type = "air"
minerals = 100
gas = 100
supply = 2
hp = 120
shields = 0
armor = 0
damage = 0
damage_type = "normal"
build_time = 50
attack_speed = 0
range = 0
speed = 6.67
size = "medium"
ground_attack = false
air_attack = false
sight = 10
built_from = "hatchery"
abilities = ["spawn-broodling", "ensnare", "parasite"]
upgrades = ["flyer-carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
퀸은 퀸즈 네스트가 필요하다. 일반 공격은 없고 마법에 의존한다. 체력이 절반 이하로 떨어진 테란 커맨드 센터를 감염시켜 감염된 커맨드 센터로 만들 수도 있다.

## 경쟁전에서의 역할

퀸은 경쟁전에서 흔치 않다. 인스네어로 뮤탈리스크나 마린 무리를 느리게 하고 드러낼 수 있으며, 스폰 브루들링으로 시즈 탱크나 하이 템플러 같은 지상 유닛 하나를 잡을 수 있지만, 저그는 보통 다른 하이브 테크 유닛을 선택한다.

## 주요 메커니즘

- 패러사이트 (에너지 75): 대상 유닛의 시야를 영구적으로 공유받는다
- 인스네어 (에너지 75, 퀸즈 네스트 연구): 범위 내 유닛을 느리게 하고 지속 시간 동안 클로킹 유닛을 드러낸다
- 스폰 브루들링 (에너지 150, 퀸즈 네스트 연구): 기계가 아닌 대부분의 지상 유닛을 즉사시키고 그 자리에 브루들링 두 마리를 만든다
- 체력 120, 방어력 0, 중형
