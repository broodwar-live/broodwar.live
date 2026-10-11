+++
title = "컨슘"
description = "컨슘은 디파일러가 자신의 저그 유닛 하나를 희생시켜 에너지 50을 얻는 능력이다."
slug = "consume"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_en = "Consume"
caster = "defiler"
energy = 0
hp_cost = 0
hotkey = "C"
researched_at = "defiler-mound"
research_minerals = 100
research_gas = 100
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Consume"]
verified = "2026-10-11"
+++
컨슘은 아군 유닛 하나를 잡아먹고 디파일러에게 에너지 50을 채워 준다. 최대 에너지(200, 디파일러 에너지 업그레이드 시 250)를 넘을 수는 없다. 잡아먹는 유닛의 가격이나 남은 체력과 관계없이 얻는 에너지는 같다. 라바, 건물, 스테이시스 필드에 걸린 유닛은 컨슘할 수 없고, 환상 유닛을 컨슘하면 에너지를 얻지 못한다.

에너지가 들지 않지만 디파일러가 대상 바로 옆에 있어야 하며, [디파일러 마운드](@/wiki/buildings/defiler-mound.ko.md)에서 미네랄 100, 가스 100(1,500프레임, 100초)에 연구한다.

컨슘 덕분에 디파일러는 마법을 거듭 쓸 수 있다. 저글링 한 쌍(미네랄 50)이면 에너지 100, 즉 다크 스웜 한 번이 나온다. 후반 저테전과 저프전에서 저그는 이 용도로 디파일러 곁에 저글링을 붙여 두며, 교전 중에 먹이가 떨어지면 디파일러는 마법을 쓸 수 없게 된다.
