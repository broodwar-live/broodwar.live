+++
title = "옵저버터리"
description = "옵저버터리는 프로토스의 이동형 탐지 유닛인 옵저버를 열어 주고 옵저버의 속도와 시야 업그레이드를 연구하는 건물이다."
slug = "observatory"
template = "wiki/building.html"
[taxonomies]
race = ["protoss"]
[extra]
name_en = "Observatory"
minerals = 50
gas = 100
hp = 250
shields = 250
armor = 1
build_time = 30
hotkey = "V→O"
size = "large"
produces = []
requires = ["robotics-facility"]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp"]
verified = "2026-10-11"
+++
옵저버터리는 로보틱스 퍼실리티가 있어야 지을 수 있으며, 항상 클로킹 상태인 탐지 유닛 [옵저버](@/wiki/units/observer.ko.md)를 뽑으려면 반드시 필요하다. 프로토스는 정찰은 물론 러커, 스파이더 마인, 다크 템플러, 레이스 대응을 모두 옵저버에 의존한다. 그래비틱 부스터(옵저버 속도)와 센서 어레이(옵저버 시야)를 여기서 연구한다.

옵저버는 프로토스의 유일한 이동형 탐지 수단이므로 프테전과 프저전에서는 거의 항상 옵저버터리를 짓는다. 러커나 스파이더 마인과 싸울 때 옵저버를 잃으면 교전 결과가 뒤집힐 수 있다.
