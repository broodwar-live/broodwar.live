+++
title = "다크 스웜"
description = "다크 스웜은 아래에 있는 지상 유닛을 원거리 공격으로부터 보호하는 구름을 만드는 디파일러 마법이다."
slug = "dark-swarm"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_en = "Dark Swarm"
caster = "defiler"
energy = 100
hp_cost = 0
range = 9
aoe = "160×160 px"
duration = 60.0
hotkey = "W"
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Dark_Swarm", "https://liquipedia.net/starcraft/Splash_Damage"]
verified = "2026-10-11"
+++
다크 스웜은 목표 지점에 160×160픽셀 크기의 구름을 900프레임(60 게임 초, 가장 빠름 기준 실제 약 38초) 동안 만든다. 구름 아래의 지상 유닛은 아군이든 적이든 원거리 공격에 맞지 않는다. 엔진상 이런 공격에 대한 회피 확률이 100%가 된다. 건물과 공중 유닛은 보호받지 않는다.

근접 공격은 스웜 아래에서도 통하며, 투사체가 없는 공격(파이어뱃, 리버의 스캐럽, 스파이더 마인, 감염된 테란)과 사이오닉 스톰·플레이그·이래디에이트·인스네어·야마토 캐논 같은 마법도 통한다. 구름 아래의 유닛은 밖으로 정상적으로 공격할 수 있다.

에너지 100이 들고 사거리는 9이며 연구가 필요 없다. 다크 스웜은 후반 저테전의 핵심이다. 스웜 아래에서는 저글링·울트라리스크·러커가 평소라면 녹아버릴 마린과 시즈 탱크를 상대할 수 있다. 테란은 파이어뱃, 이래디에이트, 구름 밖으로 물러나기로 대응한다. 디파일러는 컨슘으로 에너지를 채워 연속으로 시전한다.
