+++
title = "디펜시브 매트릭스"
description = "디펜시브 매트릭스는 단일 유닛에 250의 피해를 흡수하는 실드를 씌우는 사이언스 베슬 마법이다."
slug = "defensive-matrix"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_en = "Defensive Matrix"
caster = "science-vessel"
energy = 100
hp_cost = 0
range = 10
duration = 89.6
hotkey = "D"
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Defensive_Matrix"]
verified = "2026-10-11"
+++
디펜시브 매트릭스는 건물을 제외한 유닛 하나(아군·적군 무관)에 최대 250의 피해를 흡수하는 실드를 씌운다. 이 실드는 방어력이 없고, 실드나 체력보다 먼저 공격 유형과 관계없이 피해를 100% 그대로 흡수한다. 250을 다 흡수하거나 168 상태 틱(약 1,344프레임, 게임 시간 약 90초, 가장 빠름 속도에서는 실제로 약 56초)이 지나면 사라진다. 같은 유닛에 다시 걸면 실드가 250으로 다시 채워지고 지속 시간이 초기화될 뿐, 중첩되지는 않는다.

에너지 100이 들고 사거리는 10(사이언스 베슬의 시야)이며 연구가 필요 없다. 브루드워는 타격당 최소 0.5의 피해를 보장하므로 매트릭스가 걸린 유닛도 공격마다 아주 조금씩 체력이 깎인다.

사이언스 베슬의 에너지는 보통 이래디에이트나 EMP 쇼크웨이브에 쓰기 때문에 매트릭스는 상황에 따라 쓰는 마법이다. 진격하는 선두의 시즈탱크나 드랍십, 러커의 가시를 끌어내려고 먼저 들여보내는 마린을 살리는 데 쓴다. 매트릭스가 걸린 은폐 유닛은 적에게 보인다.
