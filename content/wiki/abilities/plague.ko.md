+++
title = "플레이그"
description = "플레이그는 지속적으로 큰 피해를 주지만 대상을 죽이지는 못하는 디파일러 마법이다."
slug = "plague"
template = "wiki/ability.html"
[taxonomies]
race = ["zerg"]
[extra]
name_en = "Plague"
caster = "defiler"
energy = 150
hp_cost = 0
damage = 300
range = 9
aoe = "128×128 px"
duration = 40.0
hotkey = "G"
researched_at = "defiler-mound"
research_minerals = 200
research_gas = 200
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Plague"]
verified = "2026-10-11"
+++
플레이그는 목표 지점 주변 128×128픽셀 정사각형에 걸치는, 버로우하지 않은 모든 유닛과 건물(아군·적군 모두, 단 시전한 디파일러는 제외)을 감염시킨다. 75 상태 틱(600프레임 — 40 게임 초, 가장 빠름 기준 실제 약 25초) 동안 틱마다 체력이 약 3.95씩 줄어, 명목상 300 중 실제로는 약 296의 피해를 준다. 피해는 체력에 직접 들어가므로 방어력을 무시하고 프로토스의 실드는 건드리지 않는다. 틱 피해로 유닛이 죽게 되는 경우 그 틱은 적용되지 않으므로, 플레이그만으로는 유닛을 죽일 수 없다.

에너지 150이 들고 사거리는 9이며, [디파일러 마운드](@/wiki/buildings/defiler-mound.ko.md)에서 미네랄 200, 가스 200(1,500프레임, 100초)에 연구한다. 플레이그에 걸린 은폐 유닛은 적에게 보이며, 레스토레이션으로 해제된다.

플레이그는 테란 상대로 가장 효과적이다. 마린, 메딕, 사이언스 베슬, 탱크가 체력 몇 남지 않은 상태가 되어 저글링이나 뮤탈리스크에게 쉽게 마무리되고, 불타는 구간까지 체력이 떨어진 테란 건물은 수리하지 않으면 타 버릴 수 있다. 프로토스 유닛은 실드가 남기 때문에 저프전에서는 효과가 약하지만, 캐리어 같은 체력이 높은 유닛에는 여전히 큰 타격을 준다.
