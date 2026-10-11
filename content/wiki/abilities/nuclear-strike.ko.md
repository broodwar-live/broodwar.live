+++
title = "핵 공격"
description = "핵 공격은 고스트가 상대에게도 보이는 긴 유도 시간을 거쳐 목표 지역에 핵미사일을 떨어뜨리는 능력이다."
slug = "nuclear-strike"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_en = "Nuclear Strike"
caster = "ghost"
energy = 0
hp_cost = 0
damage = 500
range = 9
aoe = "128 / 192 / 256 px"
hotkey = "N"
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Nuclear_Strike"]
verified = "2026-10-11"
+++
고스트는 자신의 시야(9, 오큘러 임플란트 연구 시 11) 안의 어느 지점에나 핵미사일을 유도할 수 있다. 유도하는 동안 고스트는 제자리에 있어야 하고, 목표 지점에는 상대도 볼 수 있는 붉은 점이 표시된다. 그 사이 고스트가 죽거나 방해를 받으면 미사일은 사라진다. 핵이 떨어지면 500과 대상의 최대 체력+실드의 3분의 2 가운데 큰 값만큼 피해를 주며, 거리에 따라 피해가 줄어든다. 착탄점에서 128픽셀까지 100%, 192픽셀까지 50%, 256픽셀까지 25%. 방어력은 그대로 적용되고, 테란 자신의 유닛도 피해를 입는다.

핵 공격 한 번마다 [뉴클리어 사일로](@/wiki/buildings/nuclear-silo.ko.md)(코버트 옵스가 필요한 커맨드 센터 애드온)에서 미네랄 200, 가스 200, 인구수 8(1,500프레임, 100초)을 들여 만든 핵미사일이 하나 소모된다. 능력 자체에는 연구나 에너지가 필요 없다.

핵은 프로 경기에서 보기 드물다. 주로 팽팽하게 대치하는 후반 테테전에서 탱크 라인을 뚫거나, EMP로 실드를 벗긴 넥서스를 날릴 때 쓴다. 유도 시간 동안 수비하는 쪽은 붉은 점을 보고 병력을 빼거나 고스트를 찾아 잡을 수 있다.
