+++
title = "일꾼 관리"
description = "브루드워의 미네랄·가스 포화, 일꾼 이동, 미네랄 워킹, 건설로봇 수리."
slug = "worker-management"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Mining", "https://liquipedia.net/starcraft/SCV", "https://liquipedia.net/starcraft/Shortcuts"]
verified = "2026-10-11"
+++

## 개요

일꾼이 곧 경제다. 몇 기를 만들고, 어디에 두고, 어떻게 지키느냐가 수입을 결정한다.

## 포화

수입은 **미네랄 덩이 하나당 일꾼 1기**까지는 일직선으로 늘고, 그 이후로는 더 느리게 늘다가 **덩이당 약 3기**에서 멈춘다. 그 이상은 일꾼을 늘려도 수입이 늘지 않는다. 따라서 덩이당 첫 일꾼 이후의 추가 일꾼은 효율이 떨어진다. 가스는 최근 맵 대부분에서 간헐천당 **일꾼 3기**로 포화된다(일부 오래된 맵은 4기).

새 기지가 완성되면 포화된 본진에서 일꾼 일부를 옮겨 새 기지가 바로 채취를 시작하게 할 수 있다.

## 견제와 방어

일꾼을 잃으면 다시 뽑는 비용과 그동안 캐지 못한 자원을 모두 잃는다. 대표적인 견제는 뮤탈리스크, 벌처, 드롭, 리버, 다크 템플러다. 모든 일꾼은 매우 짧은 사거리로 5의 피해를 주므로, 일꾼 여럿이면 초반 단독 견제 유닛을 막아낼 수 있지만, 리버·탱크·사이오닉 스톰 같은 스플래시 앞에서는 일꾼을 피신시켜야 한다.

## 미네랄 워킹

보이는 미네랄 덩이나 간헐천으로 채취 명령을 받은 일꾼은 가는 길에 다른 유닛을 통과한다. 이를 이용해 길을 막는 유닛을 지나치거나 포위를 빠져나갈 수 있다.

## 건설로봇 수리

건설로봇은 기계 유닛과 테란 건물을 수리할 수 있다. 수리 비용은 대상 생산 비용의 약 3분의 1(미네랄과 가스)이며, 여러 건설로봇이 같은 대상을 함께 수리할 수 있다. 건설로봇은 생체이자 기계 유닛이라 메딕의 치료와 다른 건설로봇의 수리를 모두 받을 수 있고, 이래디에이트와 락다운에도 걸린다.
