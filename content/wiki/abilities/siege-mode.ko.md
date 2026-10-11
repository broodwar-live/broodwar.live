+++
title = "시즈 모드"
description = "시즈 모드는 시즈탱크를 움직일 수 없는 대신 사거리가 길고 스플래시 피해를 주는 포대로 바꾼다."
slug = "siege-mode"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_en = "Siege Mode"
caster = "siege-tank"
energy = 0
hp_cost = 0
damage = 70
range = 12
aoe = "10 / 25 / 40 px"
hotkey = "O"
researched_at = "machine-shop"
research_minerals = 150
research_gas = 150
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Siege_Tank"]
verified = "2026-10-11"
+++
시즈 모드는 시즈탱크를 고정 포대로 바꾼다. 탱크 모드의 아크라이트 캐논은 사거리 7, 쿨다운 37프레임으로 폭발형 30의 피해를 준다. 시즈 모드의 아크라이트 쇼크 캐논은 사거리 12, 쿨다운 75프레임으로 폭발형 70의 피해를 주며, 착탄점에서 10픽셀까지 100%, 25픽셀까지 50%, 40픽셀까지 25%의 방사형 스플래시가 있다. 이 스플래시는 자기 유닛에게도 피해를 준다. 시즈한 탱크는 움직일 수 없고 최소 사거리가 64픽셀(2타일)이라 바로 옆의 유닛은 공격할 수 없다.

연구(시즈 테크)는 [머신 샵](@/wiki/buildings/machine-shop.ko.md)에서 미네랄 150, 가스 150(1,200프레임, 80초)에 진행한다.

시즈 모드는 테란 진지전의 기반이다. 시즈탱크 덕분에 테란은 TvZ와 TvP에서 지역을 지킬 수 있고, TvT는 대부분 탱크 배치로 승부가 갈린다. 시즈 사거리(12)가 탱크의 시야(10)보다 길어서 최대 사거리를 쓰려면 띄운 건물, 사이언스 베슬, 전방 유닛 같은 시야 확보 수단이 필요하며, 이동을 위해 시즈를 푸는 동안 탱크는 취약하다.
