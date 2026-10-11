+++
title = "클로킹"
description = "클로킹은 레이스와 고스트를 탐지가 없는 적에게 보이지 않게 하며, 유지하는 동안 에너지를 소모한다."
slug = "cloaking-field"
template = "wiki/ability.html"
[taxonomies]
race = ["terran"]
[extra]
name_en = "Cloaking Field"
caster = "wraith"
energy = 25
hp_cost = 0
hotkey = "C"
researched_at = "control-tower"
research_minerals = 150
research_gas = 150
research_time = 100
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Detection"]
verified = "2026-10-11"
+++
클로킹은 시전 유닛을 탐지 수단이 없는 모든 적에게서 보이지 않게 만든다. 발동에 에너지 25가 들며, 클로킹 상태에서는 에너지가 회복되지 않고 매 프레임 조금씩 줄어든다. 에너지가 바닥나면 클로킹이 풀린다. 엔진상 소모 속도는 고스트보다 레이스가 약간 더 빠르다.

연구는 두 가지로 나뉜다. 레이스의 **클로킹 필드**는 [컨트롤 타워](@/wiki/buildings/control-tower.ko.md)에서 미네랄 150, 가스 150(1,500프레임, 100초)에 연구한다. 고스트용 **퍼스널 클로킹**은 [코버트 옵스](@/wiki/buildings/covert-ops.ko.md)에서 100/100(1,200프레임, 80초)에 연구한다. 두 경우 모두 발동 비용은 에너지 25로 같다.

클로킹한 유닛도 드러날 수 있다. 탐지 유닛·건물(미사일 터렛, 포톤 캐논, 스포어 콜로니, 사이언스 베슬, 옵저버, 오버로드)과 컴샛 스캔이 이를 노출시키며, 엔진상 디펜시브 매트릭스·락다운·메일스트롬·이래디에이트·인스네어·플레이그·스테이시스 필드·애시드 스포어에 걸린 은폐 유닛은 모두에게 보인다. 클로킹 레이스는 주로 견제용이며 TvT에서 가장 자주 보이고, 클로킹 고스트는 락다운이나 핵 공격 위치를 잡을 때 쓰인다. 위협이 없을 때 클로킹을 풀면 에너지를 아낄 수 있다.
