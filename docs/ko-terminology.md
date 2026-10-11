# Korean terminology (용어 표기 기준)

Reference for anyone writing or editing `*.ko.md` pages or the `[extra.i18n.ko]`
strings in `config.toml`. The goal is Korean that reads like it was written by a
Korean Brood War fan, not translated from English.

## Principles

1. **Community usage wins.** Use the names Korean players, casters and esports
   press actually use (Namuwiki, OSL/ASL broadcasts, Korean esports news). For
   units, buildings, spells and unit-specific upgrades this is almost always a
   transliteration of the English name (마린, 스톰, 메타볼릭 부스트), not a literal
   translation.
2. **Official name mentioned once.** Where the StarCraft: Remastered Korean
   client name differs from common usage, the page about that unit/upgrade uses
   the common name in its title and prose and mentions the official name once,
   e.g. `아칸(공식 명칭: 아콘)`. Everywhere else, use only the common name.
3. **Never use StarCraft II Korean names** (건설로봇, 해병, 불곰, 전투 자극제 …).
   SC2 Korea translated unit names; BW players never adopted them.
4. **Old names stay searchable.** When a page title changes, put the old title
   (and well-known nicknames such as 발업/사업) in `[extra] aliases`, which the
   search index (`templates/search.json`) reads.
5. **Spacing of compounds** follows the dominant press/caster spelling:
   `시즈탱크`, `드랍십` are written solid; multi-word names otherwise keep the
   English word break (`사이언스 베슬`, `다크 템플러`, `커맨드 센터`).
6. **Style:** encyclopedic plain `-다` style in wiki, build and player prose.
   No `그것/그들`; use the noun again or drop the subject. Use Korean
   punctuation habits (`·` for short lists inside a sentence, no English-style
   serial commas, no `&` in titles — use `와/과`).
7. **Player names:** pro IDs stay in Latin script (Flash, Jaedong, Bisu); real
   names in Hangul (이영호, 이제동, 김택용). Do not transliterate IDs (not 플래시).
8. **Particles:** after changing a term, re-check the following particle
   (이/가, 을/를, 은/는, 와/과, 으로/로). SCV is read 에스시브이 (vowel-final:
   SCV가, SCV를, SCV로); 셸 ends in ㄹ (셸로); 인핸스먼트/오그먼트 end in a vowel.

## Matchups

| EN | KO | Note |
|---|---|---|
| TvZ / ZvT | 테저전 / 저테전 | Named from the perspective of the first race. Page titles add the code: `테저전(TvZ)` |
| TvP / PvT | 테프전 / 프테전 | |
| PvZ / ZvP | 프저전 / 저프전 | |
| TvT, PvP, ZvZ | 테테전, 프프전, 저저전 | |
| early / mid / late game | 초반 / 중반 / 후반 | `테저전 초반`, not `TvZ 초반전` |
| vs Terran (section heading) | 테란전 | Likewise 프로토스전, 저그전 |

## Units and buildings

| EN | KO (use) | Not | Reason |
|---|---|---|---|
| Archon | 아칸 | 아콘 | 아콘 is the Remastered client name; 아칸 is near-universal in broadcasts, Namuwiki prose and community. Archon page mentions `공식 명칭: 아콘`. |
| Dark Archon | 다크 아칸 | 다크 아콘 | Same as Archon. |
| Siege Tank | 시즈탱크 (short: 탱크) | 시즈 탱크 | Solid spelling dominates esports press and casting. |
| SCV | SCV | 건설로봇 | 건설로봇 is the SC2 Korean name; BW players say SCV (에스시브이). |
| Infested Terran | 인페스티드 테란 | 감염된 테란 | Transliteration is the established BW name. |
| Infested Command Center | 인페스티드 커맨드 센터 | 감염된 커맨드 센터 | Same. |
| Dropship | 드랍십 | 드롭십 | Community spelling. |
| Hydralisk | 히드라리스크 (short: 히드라) | | |
| Mutalisk | 뮤탈리스크 (short: 뮤탈) | | |
| Scout | 스카웃 | 스카우트 | Community spelling. |
| Science Vessel | 사이언스 베슬 (short: 베슬) | | |
| Larva | 라바 | 애벌레 | Nobody says 애벌레 in BW context. |
| Supply Depot | 서플라이 디팟 | | |

## Upgrades (unit-specific: transliterate)

| EN | KO (use) | Not (old) | Common nickname |
|---|---|---|---|
| Adrenal Glands | 아드레날 글랜드 | 부신 분비선 | 아드레날린 |
| Anabolic Synthesis | 아나볼릭 신서시스 | 동화 합성 | 울트라 발업 |
| Chitinous Plating | 키티너스 플레이팅 | 키틴질 갑옷 | 울트라 방업 |
| Grooved Spines | 그루브드 스파인 | 홈 있는 가시 | 히드라 사업 |
| Muscular Augments | 머스큘러 오그먼트 | 근육 강화 | 히드라 발업 |
| Metabolic Boost | 메타볼릭 부스트 | 대사 촉진 | 저글링 발업 |
| Leg Enhancements | 레그 인핸스먼트 | 다리 강화 | 질럿 발업 |
| Ion Thrusters | 이온 스러스터 | 이온 추진기 | 벌처 속업 |
| U-238 Shells | U-238 셸 | U-238 탄환 | 마린 사업 |
| Singularity Charge | 싱귤래리티 차지 | | 드라군 사업 |
| Yamato Gun / Cannon | 야마토 캐논 | 야마토 포 | 야마토 |
| *X* Reactor (Caduceus, Apollo, Titan, Colossus, Moebius) | 카두세우스 리액터 … | … 반응로 | |
| Lurker Aspect | 러커 변태 | | 러커 업 — see open questions |

## Upgrades (weapon/armor families: descriptive Korean)

These are referred to generically as 공업/방업 (+1 공업, 3/3 업 …). The titles
keep descriptive Korean names, which Korean fans also know from SC2.

| EN | KO |
|---|---|
| Infantry Weapons / Armor | 보병 무기 / 보병 방어력 |
| Vehicle Weapons / Plating | 차량 무기 / 차량 장갑 |
| Ship Weapons / Plating | 함선 무기 / 함선 장갑 |
| Ground Weapons / Armor (Protoss) | 지상 무기 / 지상 방어력 |
| Air Weapons / Armor (Protoss) | 공중 무기 / 공중 방어력 |
| Plasma Shields | 플라즈마 실드 |
| Melee / Missile Attacks | 근접 공격력 / 원거리 공격력 |
| Carapace | 지상 갑피 |
| Flyer Attacks / Carapace | 비행 유닛 공격력 / 비행 유닛 갑피 |

## Abilities

| EN | KO (use) | Not |
|---|---|---|
| EMP Shockwave | EMP 쇼크웨이브 (short: EMP) | EMP 충격파 |
| Psionic Storm | 사이오닉 스톰 (short: 스톰) | |
| Dark Swarm | 다크 스웜 (short: 스웜) | |
| Nuclear Strike | 핵 공격 (short: 핵) | |
| Siege Mode | 시즈 모드 | |
| Burrow | 버로우 | |
| Stasis Field | 스테이시스 필드 | |

## General vocabulary

| EN | KO (use) | Not / note |
|---|---|---|
| supply (count) | 인구수 | 서플라이 (only inside 서플라이 디팟) |
| supply block | 인구수 막힘 | 서플라이 블록 |
| "9 supply pool" | 인구수 9에 스포닝 풀 / 9풀 | 9 서플라이에 |
| drop (play) | 드랍 | 드롭 |
| high ground | 언덕 | 고지대 (acceptable once as a gloss) |
| natural expansion | 앞마당 | |
| expansion (generic) | 멀티, 확장 기지 | |
| main base | 본진 | |
| detection / detector | 탐지 / 디텍터 | |
| harass | 견제 | |
| mech (Terran style) | 메카닉 | Do not confuse with game mechanics = 메커니즘 |
| game mechanics | 게임 메커니즘 | 게임 메카닉 |
| shields | 실드 | 보호막 |
| control group | 부대 지정 | |
| build order | 빌드 오더 | |
| bio (marine/medic play) | 바이오닉 (마린+메딕: 마메) | 보병 |
| cheese / all-in build | 날빌 (all-in: 올인) | 치즈 |
| hard counter | 천적 | 하드 카운터 |
| contain | 조이기 | |
| creep | 크립 | 점막 |
| detector | 디텍터 | 탐지기 |
| FFE (Forge Fast Expand) | 포지 더블 | |
| 1 Gate FE / 12 Hatch / 14 CC | 1게이트 더블넥 / 12앞마당 / 노배럭 더블 | Build titles use Korean community names; the English name stays searchable via the EN twin page. |
| Pneumatized Carapace | 뉴머타이즈드 카라페이스 (오버로드 속업) | |
| Charon Boosters | 카론 부스터 (골리앗 사업) | 차론 |
| Maelstrom | 메일스트롬 | 멜스트롬 |
| Irradiate | 이래디에이트 | 이레디에이트 |
| Stasis Field | 스테이시스 필드 | 스태시스 |
| Liquipedia | 리퀴피디아 | |
| individual league (OSL/MSL/ASL) | 개인리그 | |
| final | 결승 | |
| champion / runner-up | 우승 / 준우승 | |

## Open questions (need a native-speaker decision)

- **Lurker Aspect:** kept as `러커 변태`. Community speech is mostly `러커 업`; a
  transliteration (`러커 어스펙트`) is rare.
- **Remastered official upgrade names** were not verified against a Korean
  client; only Archon's official name is cited on its page.
- **바이오닉 vs 바이오**, **날빌** for cheese, **포지 더블** vs 포지 더블넥 for FFE,
  and the new Korean build titles (메카닉 FD, 팩더블, SK테란) should be checked.
- **시즈탱크 vs 시즈 탱크:** Namuwiki titles the article with a space; press and
  casters write it solid. We chose solid.
