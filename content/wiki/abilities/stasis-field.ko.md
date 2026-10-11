+++
title = "스테이시스 필드"
description = "스테이시스 필드는 범위 안의 모든 유닛을 얼려 지속 시간 동안 아무것도 할 수 없고 공격받지도 않게 만드는 아비터 마법이다."
slug = "stasis-field"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_en = "Stasis Field"
caster = "arbiter"
energy = 100
hp_cost = 0
range = 9
aoe = "96×96 px"
duration = 69.9
hotkey = "T"
researched_at = "arbiter-tribunal"
research_minerals = 150
research_gas = 150
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Stasis_Field"]
verified = "2026-10-11"
+++
스테이시스 필드는 목표 지점 주변 96×96픽셀 정사각형에 걸치는 모든 유닛을 131 상태 틱(약 1,048프레임, 게임 시간 약 70초, 가장 빠름 속도에서는 실제로 약 44초) 동안 얼린다. 건물과 버로우한 유닛은 제외되며, 적·아군을 가리지 않는다. 얼어붙은 유닛은 이동·공격·마법 사용을 할 수 없고 무적이 되어 공격도, 마법 대상 지정도 받지 않는다(EMP 쇼크웨이브, 사이오닉 스톰, 피드백 모두 통하지 않는다). 레스토레이션으로도 해제할 수 없어 끝날 때까지 기다려야 한다.

에너지 100이 들고 사거리는 9이며, [아비터 트리뷰널](@/wiki/buildings/arbiter-tribunal.ko.md)에서 미네랄 150, 가스 150(1,500프레임, 100초)에 연구한다.

스테이시스는 상대 병력을 갈라놓는 데 쓴다. 프테전에서 시즈탱크 라인 일부나 테란의 증원 병력을 얼리면 나머지 병력과 유리하게 싸울 수 있다. 얼어붙은 유닛은 길을 막기 때문에, 자기 병력 바로 앞의 적을 얼리면 오히려 공격을 방해할 수도 있다.
