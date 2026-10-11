+++
title = "리콜"
description = "리콜은 목표 지역에 있는 시전자의 유닛을 아비터 곁으로 순간 이동시키는 아비터 마법이다."
slug = "recall"
template = "wiki/ability.html"
[taxonomies]
race = ["protoss"]
[extra]
name_en = "Recall"
caster = "arbiter"
energy = 150
hp_cost = 0
aoe = "128×128 px"
hotkey = "R"
researched_at = "arbiter-tribunal"
research_minerals = 150
research_gas = 150
research_time = 120
sources = ["https://github.com/bwapi/bwapi/blob/develop/Library/BWAPILIB/Source/Types/TechType.cpp", "https://github.com/OpenBW/openbw/blob/master/bwgame.h", "https://liquipedia.net/starcraft/Recall"]
verified = "2026-10-11"
+++
리콜은 맵 어디에나 쓸 수 있으며, 아비터가 그곳까지 갈 필요가 없다. 시전 약 22프레임 뒤, 목표 지점 주변 128×128픽셀 정사각형 안에 있는 시전자의 모든 유닛이 아비터 옆으로 순간 이동한다. 건물, 버로우한 유닛, 환상 유닛, 스테이시스 필드에 걸린 유닛, 동맹 플레이어의 유닛은 옮겨지지 않는다. 에너지는 시전 즉시 소모된다. 지상 유닛은 원래 설 수 없는 지형으로는 리콜되지 않는다.

에너지 150이 들고 [아비터 트리뷰널](@/wiki/buildings/arbiter-tribunal.ko.md)에서 미네랄 150, 가스 150(1,800프레임, 120초)에 연구한다.

리콜은 주로 프테전 후반에 쓰는 무기다. 아비터가 테란의 본진이나 멀티에 몰래 들어가 탱크 라인 뒤로 병력을 불러온다. 아비터 자신은 은폐되지 않으므로(주변 유닛을 은폐시킬 뿐이다) 테란은 사이언스 베슬로 빈틈을 살피다가 다가오는 아비터에 EMP를 걸거나 격추하고, 리콜이 들어올 만한 곳에 스파이더 마인과 터렛을 깔아 둔다.
