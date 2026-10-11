+++
title = "마린"
description = "마린은 배럭에서 생산하는 테란의 기본 보병으로, 50 미네랄에 지상과 공중을 모두 공격할 수 있다."
slug = "marine"
template = "wiki/unit.html"
[taxonomies]
race = ["terran"]
[extra]
image = "/images/wiki/units/marine.jpg"
name_en = "Marine"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 40
shields = 0
armor = 0
damage = 6
damage_type = "normal"
build_time = 24
attack_speed = 15
range = 4
range_upgraded = 5
speed = 4.0
size = "small"
ground_attack = true
air_attack = true
dps = 6.0
sight = 7
built_from = "barracks"
abilities = ["stim-pack"]
upgrades = ["stim-pack", "u-238-shells", "infantry-weapons", "infantry-armor"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
마린은 테란이 처음으로 생산할 수 있는 전투 유닛이자 가장 중요한 유닛 중 하나다. 50 미네랄밖에 들지 않고 지상과 공중을 모두 공격하며, 스팀팩·U-238 탄·메딕·보병 업그레이드와 함께할 때 위력이 크게 올라간다. 체구가 작고 체력이 낮아 범위 피해에 대한 컨트롤이 성능을 좌우한다.

## 저그전

저그전에서는 마린·메딕에 사이언스 베슬을 더한 바이오닉이 표준 운영이다. 스팀팩을 쓴 마린은 뮤탈리스크와 저글링을 잘 상대하지만, 러커·다크 스웜·플레이그가 주된 위협이다. 러커 가시와 뮤탈리스크의 튕기는 공격을 피하는 마린 산개는 테란의 핵심 기술이다.

## 테란전

테란전은 주로 시즈탱크, 벌처, 골리앗, 공중 유닛으로 승부가 갈린다. 마린은 초반에 소수만 생산되어 대개 벙커에서 방어를 맡는다.

## 프로토스전

프로토스전에서 테란은 보통 메카닉(시즈탱크, 벌처, 골리앗)으로 전환한다. 마린은 주로 초반 방어용으로, 질럿이나 드라군 압박에 대비해 벙커에 넣는 경우가 많다. 사이오닉 스톰과 리버가 뭉친 보병을 크게 위협하기 때문에 대규모 바이오닉은 드물다.

## 주요 메커니즘

- 일반형 피해 6, 쿨다운 15프레임, 사거리 4 (U-238 탄 연구 시 5)
- 스팀팩(아카데미 연구)은 체력 10을 소모해 일정 시간 공격 속도와 이동 속도를 높인다
- 일반형 피해는 유닛 크기와 관계없이 100% 들어간다 (방어력 제외)
- 벙커와 수송선에서 1칸을 차지한다
