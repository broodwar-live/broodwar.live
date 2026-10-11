+++
title = "EMP 쇼크웨이브"
description = "EMP 쇼크웨이브는 범위 안 유닛의 실드와 에너지를 모두 없애는 사이언스 베슬 마법이다."
slug = "emp-shockwave"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
aliases = ["EMP 충격파", "EMP"]
name_en = "EMP Shockwave"
caster = "science-vessel"
energy = 100
hp_cost = 0
range = 8
aoe = "128×128 px"
hotkey = "E"
researched_at = "science-facility"
research_minerals = 200
research_gas = 200
research_time = 120
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/EMP_Shockwave"]
verified = "2026-10-11"
+++
EMP 쇼크웨이브는 목표 지점으로 미사일을 쏜다. 착탄 시 그 지점을 중심으로 한 128×128픽셀 정사각형(사방 64픽셀, 대략 4×4타일)에 걸치는 모든 유닛과 건물의 플라즈마 실드와 에너지가 0이 된다. 스테이시스 필드 안의 유닛은 영향을 받지 않고, 시전한 베슬 자신도 제외되며, 범위 안의 환상 유닛은 파괴된다. 아군과 자기 유닛도 적과 똑같이 맞는다.

에너지 100이 들고 사거리는 8이며, [사이언스 퍼실리티](@/wiki/buildings/science-facility.ko.md)에서 미네랄 200, 가스 200(1,800프레임, 120초)에 연구한다.

EMP는 주로 TvP에서 쓰인다. 아비터와 하이 템플러의 에너지를 없애 리콜·스테이시스 필드·사이오닉 스톰을 막고, 아칸(체력 10, 실드 350)이나 캐리어처럼 실드 비중이 큰 유닛에 특히 효과적이다. 드라군(실드 80, 체력 100)은 한 번에 전체 내구도의 44%를 잃는다. TvT에서는 배틀크루저의 에너지를 빼 야마토 캐논을 막는 데 쓸 수 있다.
