+++
title = "스폰 브루들링"
description = "스폰 브루들링은 로봇이 아닌 지상 유닛 하나를 즉사시키고 브루들링을 생성하는 퀸 마법이다."
slug = "spawn-broodling"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_en = "Spawn Broodling"
caster = "queen"
energy = 150
hp_cost = 0
range = 9
hotkey = "B"
researched_at = "queens-nest"
research_minerals = 100
research_gas = 100
research_time = 80
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Queen_(Unit)"]
verified = "2026-10-11"
+++
스폰 브루들링은 지상 유닛 하나를 체력·실드·방어력과 관계없이 즉시 죽이고, 그 자리에 퀸 주인의 브루들링을 최대 두 마리 생성한다. 브루들링은 약한 근접 유닛으로 1,800프레임(120 게임 초, 가장 빠름 기준 실제 약 76초)이 지나면 사라진다. 공중 유닛, 건물, 로봇 유닛(지상에서는 프로브와 리버), 아콘과 다크 아콘은 대상으로 지정할 수 없고, 환상 유닛에 쓰면 아무것도 생성되지 않고 파괴만 된다.

에너지 150이 들고 사거리는 9이며, [퀸즈 네스트](@/wiki/buildings/queens-nest.ko.md)에서 미네랄 100, 가스 100(1,200프레임, 80초)에 연구한다.

대표적인 대상은 시즈 모드의 시즈 탱크이며, 하이 템플러·다크 템플러·디파일러 같은 비싼 지상 유닛도 노릴 수 있다. 퀸은 약하고 프로 경기에서 거의 생산되지 않으므로 틈새 기술이다.
