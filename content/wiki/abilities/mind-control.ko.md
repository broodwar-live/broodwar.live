+++
title = "마인드 컨트롤"
description = "마인드 컨트롤은 적 유닛 하나의 소유권을 영구히 빼앗는 다크 아칸 마법이다."
slug = "mind-control"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_en = "Mind Control"
caster = "dark-archon"
energy = 150
hp_cost = 0
range = 8
hotkey = "C"
researched_at = "templar-archives"
research_minerals = 200
research_gas = 200
research_time = 120
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Mind_Control"]
verified = "2026-10-11"
+++
마인드 컨트롤은 건물을 제외한 적 유닛 하나를 영구히 빼앗는다. 라바, 알, 스파이더 마인, 인터셉터, 스캐럽, 스테이시스 필드에 걸린 유닛은 빼앗을 수 없다. 시전하면 다크 아칸의 실드가 0이 된다. 빼앗은 유닛은 그 유닛 고유의 연구(예: 하이 템플러가 익힌 마법)는 그대로 가져오지만, 원래 주인의 공격력·방어력·실드 업그레이드 단계는 가져오지 않는다. 수송 유닛을 빼앗으면 안에 탄 유닛도 함께 넘어온다.

에너지 150이 들고 사거리는 8이며, [템플러 아카이브](@/wiki/buildings/templar-archives.ko.md)에서 미네랄 200, 가스 200(1,800프레임, 120초)에 연구한다.

마인드 컨트롤은 프로 경기에서 보기 드물다. 가장 잘 알려진 사용법은 SCV나 드론 같은 일꾼을 빼앗아 다른 종족의 테크를 타는 것이고, 캐리어·시즈탱크·디파일러 같은 비싼 유닛을 빼앗기도 한다. 빼앗은 유닛은 해당 종족의 인구수 한도에 따로 잡힌다. 시전 후 다크 아칸은 실드가 없으므로 잘 지켜야 한다.
