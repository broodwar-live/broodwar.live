+++
title = "이래디에이트"
description = "이래디에이트는 대상 주변의 생체 유닛에 지속적으로 총 250의 피해를 주는 사이언스 베슬 마법이다."
slug = "irradiate"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_en = "Irradiate"
caster = "science-vessel"
energy = 75
hp_cost = 0
damage = 250
range = 9
aoe = "32 px around target"
duration = 40.0
hotkey = "I"
researched_at = "science-facility"
research_minerals = 200
research_gas = 200
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Irradiate"]
verified = "2026-10-11"
+++
이래디에이트는 건물이 아닌 모든 유닛에 걸 수 있다. 75 상태 틱(600프레임 — 40 게임 초, 가장 빠름 기준 실제 약 25초) 동안 대상 유닛이 방사능을 내뿜어, 반경 32픽셀 안의 모든 생체 유닛에 방어력을 무시하는 총 250의 피해를 준다. 대상이 생체 유닛이면 대상 자신도 피해를 입는다. 거리에 따른 감쇠가 없어서 이래디에이트에 걸린 유닛 둘이 붙어 있으면 서로 두 배로 피해를 준다. 기계 유닛은 피해를 받지 않으므로, 적 생체 유닛 근처의 자기 탱크나 베슬에 거는 "이레이저" 기술이 가능하다. 버로우한 유닛은 직접 걸린 경우에만 피해를 받고, 라바·알·건물은 면역이다.

에너지 75가 들고 사거리는 9이며, [사이언스 퍼실리티](@/wiki/buildings/science-facility.ko.md)에서 미네랄 200, 가스 200(1,200프레임, 80초)에 연구한다.

이래디에이트는 TvZ의 핵심 마법이다. 뭉친 뮤탈리스크는 한 번에 큰 손실을 입고, 디파일러·러커·울트라리스크는 대표적인 단일 대상이다. 저그 유닛은 모두 생체이므로 프로토스나 테란 상대보다 저그 상대로 훨씬 유용하다.
