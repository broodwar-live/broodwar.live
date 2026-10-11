+++
title = "레이스"
description = "레이스는 강력한 대공 미사일과 약한 지상 레이저를 갖춘 테란 스타포트 전투기로, 컨트롤 타워에서 클로킹을 연구할 수 있다."
slug = "wraith"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/wraith.jpg"
name_en = "Wraith"
type = "air"
minerals = 150
gas = 100
supply = 2
hp = 120
shields = 0
armor = 0
damage = 8
damage_type = "normal"
build_time = 60
attack_speed = 30
range = 5
speed = 6.67
size = "large"
ground_attack = true
air_attack = true
dps = 4.0
sight = 7
built_from = "starport"
abilities = []
upgrades = ["cloaking-field", "ship-weapons", "ship-plating"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
레이스는 스타포트의 기본 전투 비행선이다. 제미니 미사일은 공중 대상에게 폭발형 피해 20을, 버스트 레이저는 지상 대상에게 일반형 피해 8을 준다. 컨트롤 타워에서 클로킹을 연구하면 에너지를 소모해 투명해질 수 있다.

## 저그전

저그전에서는 흔치 않다. 오버로드 사냥에 쓸 수 있지만 스커지, 뮤탈리스크, 히드라리스크에 취약하다.

## 테란전

클로킹 레이스를 포함한 레이스 빌드는 테란전에서 알려진 전략으로, 상대에게 미사일 터렛, 컴샛 스테이션 스캔, 골리앗 투자를 강요한다.

## 프로토스전

드라군의 대공 능력이 좋고 옵저버가 클로킹 레이스를 탐지할 수 있어 일반적인 프로토스전에서는 드물다.

## 주요 메커니즘

- 공중: 폭발형 피해 20, 쿨다운 22프레임, 사거리 5
- 지상: 일반형 피해 8, 쿨다운 30프레임, 사거리 5
- 클로킹: 사용 시 에너지 25, 이후 지속 소모
- 대형, 체력 120, 방어력 0
