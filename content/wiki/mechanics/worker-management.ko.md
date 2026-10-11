+++
title = "일꾼 관리"
description = "브루드 워의 미네랄·가스 포화, 일꾼 옮기기, 미네랄 워킹, SCV 수리."
slug = "worker-management"
template = "wiki/mechanic.html"
[extra]
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/UnitType.cpp", "https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/WeaponType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Mining", "https://liquipedia.net/starcraft/SCV", "https://liquipedia.net/starcraft/Shortcuts"]
verified = "2026-10-11"
+++

## 개요

일꾼이 곧 경제다. 몇 기를 뽑아 어디에 붙이고 어떻게 지키느냐에 따라 수입이 정해진다.

## 포화

수입은 **미네랄 덩이 하나에 일꾼 1기**까지는 일꾼 수에 비례해 늘고, 그다음부터는 더디게 늘다가 **덩이당 약 3기**에서 멈춘다. 그 이상은 일꾼을 더 붙여도 수입이 늘지 않는다. 즉 덩이마다 두 번째 일꾼부터는 효율이 떨어진다. 가스는 요즘 맵 대부분에서 간헐천 하나에 **일꾼 3기**면 꽉 찬다(일부 옛날 맵은 4기).

새 기지가 완성되면 꽉 찬 본진에서 일꾼 일부를 옮겨 새 기지에서 바로 채취를 시작할 수 있다.

## 견제와 방어

일꾼을 잃으면 다시 뽑는 비용에 그동안 캐지 못한 자원까지 손해를 본다. 대표적인 견제 수단은 뮤탈리스크, 벌처, 드랍, 리버, 다크 템플러다. 일꾼은 모두 아주 짧은 사거리로 5의 피해를 주므로 여럿이 달려들면 초반에 혼자 들어온 견제 유닛은 막아 낼 수 있지만, 리버·탱크·사이오닉 스톰 같은 스플래시 앞에서는 일꾼을 빼야 한다.

## 미네랄 워킹

눈에 보이는 미네랄 덩이나 간헐천을 찍어 채취 명령을 내리면, 일꾼은 가는 동안 다른 유닛을 그대로 통과한다. 이를 이용해 길을 막은 유닛을 지나가거나 포위를 빠져나갈 수 있다.

## SCV 수리

SCV는 기계 유닛과 테란 건물을 수리할 수 있다. 수리 비용은 대상 생산 비용의 약 3분의 1(미네랄과 가스)이며, SCV 여러 기가 한 대상을 함께 수리할 수도 있다. SCV는 생체이면서 기계 유닛이라 메딕의 치료와 다른 SCV의 수리를 모두 받을 수 있고, 이래디에이트와 락다운에도 걸린다.
