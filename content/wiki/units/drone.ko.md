+++
title = "드론"
description = "드론은 애벌레에서 변태하는 저그 일꾼으로, 자원을 채취하며 건물로 변태하면 소모된다."
slug = "drone"
template = "wiki/unit.html"
[taxonomies]
race = ["zerg"]
[extra]
image = "/images/wiki/units/drone.jpg"
name_en = "Drone"
type = "ground"
minerals = 50
gas = 0
supply = 1
hp = 40
shields = 0
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
sight = 7
built_from = "hatchery"
abilities = ["burrow"]
upgrades = ["carapace"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp"]
verified = "2026-10-11"
+++
드론은 다른 종족 일꾼처럼 미네랄과 가스를 캐지만, 저그가 건물을 지을 때는 드론 자체가 건물이 된다. 따라서 모든 저그 건물은 표시된 자원 외에 드론 한 기를 추가로 소모하며, 드론·건물·병력 사이의 균형이 저그 운영의 핵심이다.

## 모든 종족전

저그는 안전한 범위 안에서 최대한 드론을 늘리다가 공격이 올 때 병력 생산으로 전환한다. 드론 손실은 저그에게 특히 치명적이어서 벌처, 리버, 뮤탈리스크, 다크 템플러의 일꾼 견제가 자주 쓰인다.

## 주요 메커니즘

- 일반형 피해 5, 쿨다운 22프레임, 근접
- 체력 40, 방어력 0, 소형
- 미네랄 1회 채취량 8
- 건물로 변태하면 소모되며, 건설을 취소하면 드론과 비용 대부분이 돌아온다
- 익스트랙터 트릭: 인구수가 꽉 찼을 때 익스트랙터를 지으면 인구수가 비어 유닛을 하나 더 뽑을 수 있고, 그 뒤 익스트랙터를 취소한다
