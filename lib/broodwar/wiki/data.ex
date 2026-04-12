defmodule Broodwar.Wiki.Data do
  @moduledoc """
  Static reference data for StarCraft: Brood War races, units, and buildings.

  All data is hardcoded — BW's game data has been stable since patch 1.16 (2008).
  """

  # ---------------------------------------------------------------------------
  # Races
  # ---------------------------------------------------------------------------

  @races [
    %{
      slug: "terran",
      name: "Terran",
      name_ko: "테란",
      letter: "T",
      tagline: "Adaptable human forces with strong defensive capabilities",
      tagline_ko: "강력한 방어력을 갖춘 적응력 높은 인류 세력",
      description:
        "The Terran are human exiles from Earth, scraping by on the fringes of the galaxy. " <>
          "Their military combines conventional ballistic weaponry, powered armor, and nuclear technology. " <>
          "Terran buildings can lift off and relocate, and many units can be repaired by SCVs. " <>
          "The faction excels at positional play, turtling behind bunkers and siege tanks, then " <>
          "transitioning into powerful late-game armies with Battlecruisers or mech compositions.",
      description_ko:
        "테란은 지구에서 추방된 인류로, 은하계 변방에서 생존하고 있다. " <>
          "재래식 탄도 무기, 강화 전투복, 핵 기술을 결합한 군사력을 보유하고 있으며, " <>
          "건물을 띄워 다른 위치로 이동시킬 수 있고, 기계 유닛은 건설로봇으로 수리할 수 있다. " <>
          "벙커와 시즈 탱크 뒤에서 거북이 플레이를 하며 진지전에 강점을 보이고, " <>
          "후반에는 배틀크루저나 메카닉 조합의 강력한 군대로 전환할 수 있다.",
      playstyle:
        "Terran is the most mechanically flexible race. Players can wall off with supply depots, " <>
          "siege up behind tanks, harass with vulture speed, or go for bio pushes with marine/medic. " <>
          "Strong macro play and multi-pronged attacks are hallmarks of top Terran players.",
      playstyle_ko:
        "테란은 가장 전술적으로 유연한 종족이다. 서플라이 디팟으로 입구를 막거나, " <>
          "시즈 탱크 뒤에서 진지를 구축하거나, 벌처의 속도를 이용해 견제하거나, " <>
          "마린/메딕 바이오 푸시를 할 수 있다. 뛰어난 매크로 운영과 다방면 동시 공격이 " <>
          "정상급 테란 선수들의 특징이다.",
      strengths: [
        "Buildings can lift off and fly to new locations",
        "Siege tanks provide devastating area control",
        "Mechanical units can be repaired to full health",
        "ComSat Station provides instant map vision anywhere",
        "Strong defensive options with bunkers and turrets"
      ],
      strengths_ko: [
        "건물을 띄워 새로운 위치로 이동할 수 있다",
        "시즈 탱크가 강력한 지역 제압력을 제공한다",
        "기계 유닛을 체력 전부 수리할 수 있다",
        "컴샛 스테이션으로 맵 어디든 즉시 시야를 확보할 수 있다",
        "벙커와 미사일 터렛으로 강력한 방어가 가능하다"
      ],
      weaknesses: [
        "Slow early-game expansion compared to Zerg",
        "Supply depots are vulnerable and require space",
        "Most units are relatively slow without upgrades",
        "Late-game transitions can be difficult to execute"
      ],
      weaknesses_ko: [
        "저그에 비해 초반 확장이 느리다",
        "서플라이 디팟이 취약하고 공간을 차지한다",
        "대부분의 유닛이 업그레이드 없이는 비교적 느리다",
        "후반 전환이 실행하기 어려울 수 있다"
      ]
    },
    %{
      slug: "protoss",
      name: "Protoss",
      name_ko: "프로토스",
      letter: "P",
      tagline: "Ancient psionic warriors with powerful but costly technology",
      tagline_ko: "강력하지만 비용이 높은 기술을 지닌 고대 사이오닉 전사들",
      description:
        "The Protoss are an ancient alien race with immense psionic abilities and advanced technology. " <>
          "Their units are individually powerful but expensive, protected by regenerating plasma shields " <>
          "on top of their base hit points. Protoss buildings must be placed within power fields generated " <>
          "by Pylons, making power management a critical aspect of play. Their warp-in mechanic means " <>
          "buildings construct themselves once warped in, freeing Probes to keep mining.",
      description_ko:
        "프로토스는 강력한 사이오닉 능력과 첨단 기술을 가진 고대 외계 종족이다. " <>
          "유닛 하나하나가 강력하지만 비용이 높으며, 기본 체력 위에 재생되는 플라즈마 보호막으로 보호받는다. " <>
          "프로토스 건물은 파일런이 생성하는 에너지장 안에만 건설할 수 있어, " <>
          "전력 관리가 운영의 핵심이다. 워프인 방식으로 건물이 소환되면 스스로 건설되므로, " <>
          "프로브는 바로 자원 채취로 복귀할 수 있다.",
      playstyle:
        "Protoss units are expensive but powerful — quality over quantity. Gateway units like Zealots " <>
          "and Dragoons form the backbone, while tech units like High Templar (Psionic Storm) and Reavers " <>
          "(Scarab drops) provide game-ending splash damage. Protoss excels at timing attacks and " <>
          "decisive engagements where superior unit quality overwhelms opponents.",
      playstyle_ko:
        "프로토스 유닛은 비싸지만 강력하다 — 양보다 질의 종족이다. " <>
          "질럿과 드라군 같은 게이트웨이 유닛이 주력을 이루고, 하이 템플러(사이오닉 스톰)와 " <>
          "리버(스캐럽 드랍) 같은 테크 유닛이 판을 뒤집는 범위 피해를 제공한다. " <>
          "프로토스는 타이밍 공격과 유닛 질의 우위로 상대를 압도하는 결정적 교전에 뛰어나다.",
      strengths: [
        "Plasma shields regenerate over time on all units and buildings",
        "Probes can warp in buildings and immediately return to mining",
        "Powerful splash damage options (Psionic Storm, Scarabs, Archons)",
        "Observers provide permanent cloaked detection",
        "Recall and Stasis Field offer unique tactical options"
      ],
      strengths_ko: [
        "모든 유닛과 건물의 플라즈마 보호막이 시간이 지나면 재생된다",
        "프로브가 건물을 소환한 후 즉시 자원 채취로 복귀할 수 있다",
        "강력한 범위 피해 옵션이 있다 (사이오닉 스톰, 스캐럽, 아콘)",
        "옵저버가 영구적인 은폐 상태의 탐지기를 제공한다",
        "리콜과 스테이시스 필드로 독보적인 전술적 선택지를 가진다"
      ],
      weaknesses: [
        "Most expensive units in the game",
        "Dependent on Pylon power fields for building placement",
        "Losing Pylons can disable groups of buildings",
        "Limited early-game harassment options",
        "Poor at fighting in small chokes with large unit models"
      ],
      weaknesses_ko: [
        "게임 내 가장 비싼 유닛들을 보유하고 있다",
        "건물 배치가 파일런 에너지장에 의존적이다",
        "파일런을 잃으면 주변 건물들이 비활성화될 수 있다",
        "초반 견제 옵션이 제한적이다",
        "유닛 모델이 커서 좁은 길목에서의 전투에 불리하다"
      ]
    },
    %{
      slug: "zerg",
      name: "Zerg",
      name_ko: "저그",
      letter: "Z",
      tagline: "Relentless swarm that overwhelms through numbers and adaptation",
      tagline_ko: "물량과 적응력으로 압도하는 끊임없는 군단",
      description:
        "The Zerg are a ravenous insectoid swarm driven by the Overmind to achieve genetic perfection " <>
          "by assimilating other species. All Zerg units are biological, produced from larvae at Hatcheries. " <>
          "The Zerg economy revolves around Hatcheries — each one produces larvae, so expanding gives both " <>
          "resources and production capacity. Creep spreads from Hatcheries and Creep Colonies, and most " <>
          "Zerg buildings must be placed on creep.",
      description_ko:
        "저그는 초월체의 인도 아래 다른 종을 동화시켜 유전적 완벽함을 추구하는 탐욕스러운 곤충형 군단이다. " <>
          "모든 저그 유닛은 생체 유닛이며, 해처리의 라바에서 생산된다. " <>
          "저그 경제는 해처리를 중심으로 돌아간다 — 각 해처리가 라바를 생산하므로, " <>
          "확장을 하면 자원과 생산력을 동시에 얻는다. 점막은 해처리와 크립 콜로니에서 퍼져나가며, " <>
          "대부분의 저그 건물은 점막 위에만 건설할 수 있다.",
      playstyle:
        "Zerg is the macro race — fast expansion, high larva production, and swarming the opponent " <>
          "with waves of units. Zerg players must constantly scout to react appropriately: morphing the " <>
          "right units at the right time is key, since larvae are a shared resource between workers and " <>
          "army. The best Zerg players combine relentless aggression with greedy economic play.",
      playstyle_ko:
        "저그는 매크로 종족이다 — 빠른 확장, 높은 라바 생산량, 그리고 물량으로 상대를 밀어붙인다. " <>
          "저그 선수는 끊임없이 정찰하여 적절하게 대응해야 한다. 라바는 일꾼과 병력이 공유하는 자원이므로, " <>
          "적절한 시점에 적절한 유닛을 변태시키는 것이 핵심이다. " <>
          "최고의 저그 선수들은 끊임없는 공격과 욕심 많은 경제 운영을 동시에 해낸다.",
      strengths: [
        "Fastest expansion rate — each Hatchery provides both economy and production",
        "All units produced from larvae, allowing rapid tech switches",
        "Burrowing allows ambushes and hidden unit positioning",
        "Cheapest units enable cost-efficient trades",
        "Overlords provide supply and mobile detection (with upgrade)"
      ],
      strengths_ko: [
        "가장 빠른 확장 속도 — 해처리마다 경제력과 생산력을 동시에 제공한다",
        "모든 유닛이 라바에서 생산되어 빠른 테크 전환이 가능하다",
        "버로우로 매복과 유닛 은닉이 가능하다",
        "가장 저렴한 유닛들로 비용 효율적인 교환이 가능하다",
        "오버로드가 보급과 이동식 탐지를 제공한다 (업그레이드 필요)"
      ],
      weaknesses: [
        "Units are individually weak compared to other races",
        "Must sacrifice a Drone to build each structure",
        "Dependent on creep for building placement",
        "Limited anti-air options in the early game",
        "Overlords are slow and vulnerable, losing them costs supply"
      ],
      weaknesses_ko: [
        "유닛 하나하나가 다른 종족에 비해 약하다",
        "건물을 지을 때마다 드론 하나를 희생해야 한다",
        "건물 배치가 점막에 의존적이다",
        "초반 대공 옵션이 제한적이다",
        "오버로드가 느리고 취약하며, 잃으면 보급을 잃는다"
      ]
    }
  ]

  def races, do: @races
  def race(slug), do: Enum.find(@races, &(&1.slug == slug))

  # ---------------------------------------------------------------------------
  # Units
  # ---------------------------------------------------------------------------

  @units [
    # -- Terran --
    %{
      slug: "scv",
      name: "SCV",
      name_ko: "건설로봇",
      race: "terran",
      type: :ground,
      minerals: 50,
      gas: 0,
      supply: 1,
      hp: 60,
      armor: 0,
      damage: 5,
      built_from: "command-center",
      description:
        "The Space Construction Vehicle is the Terran worker unit. SCVs harvest minerals and vespene gas, " <>
          "construct buildings, and can repair mechanical units and structures. Unlike Probes, SCVs must " <>
          "remain present for the entire duration of construction.",
      description_ko:
        "우주 건설 차량(SCV)은 테란의 일꾼 유닛이다. 미네랄과 베스핀 가스를 채취하고, " <>
          "건물을 건설하며, 기계 유닛과 건물을 수리할 수 있다. 프로브와 달리 건설로봇은 " <>
          "건설이 완료될 때까지 현장에 머물러야 한다."
    },
    %{
      slug: "marine",
      name: "Marine",
      name_ko: "마린",
      race: "terran",
      type: :ground,
      minerals: 50,
      gas: 0,
      supply: 1,
      hp: 40,
      armor: 0,
      damage: 6,
      built_from: "barracks",
      description:
        "The backbone of the Terran infantry. Marines are cheap, versatile, and can attack both ground " <>
          "and air units. With Stim Pack researched, they gain a burst of attack and movement speed at the " <>
          "cost of 10 HP. Marines are effective in large numbers, especially when paired with Medics.",
      description_ko:
        "테란 보병의 핵심 유닛이다. 마린은 저렴하고 다재다능하며, 지상과 공중 유닛 모두 공격할 수 있다. " <>
          "스팀팩을 연구하면 체력 10을 소모하는 대신 공격 속도와 이동 속도가 크게 향상된다. " <>
          "마린은 대규모로 운용할 때, 특히 메딕과 함께할 때 매우 효과적이다."
    },
    %{
      slug: "firebat",
      name: "Firebat",
      name_ko: "파이어뱃",
      race: "terran",
      type: :ground,
      minerals: 50,
      gas: 25,
      supply: 1,
      hp: 50,
      armor: 1,
      damage: 8,
      built_from: "barracks",
      description:
        "Heavy infantry equipped with flame throwers. Firebats deal concussive splash damage, making " <>
          "them effective against small units like Zerglings. They can use Stim Pack and benefit from " <>
          "bunker placement. Requires an Academy.",
      description_ko:
        "화염방사기를 장착한 중보병이다. 파이어뱃은 진동 범위 피해를 입히므로 " <>
          "저글링 같은 소형 유닛에 효과적이다. 스팀팩을 사용할 수 있으며 벙커에 배치하면 " <>
          "큰 효과를 발휘한다. 아카데미가 필요하다."
    },
    %{
      slug: "medic",
      name: "Medic",
      name_ko: "메딕",
      race: "terran",
      type: :ground,
      minerals: 50,
      gas: 25,
      supply: 1,
      hp: 60,
      armor: 1,
      damage: 0,
      built_from: "barracks",
      description:
        "Support infantry that heals nearby biological units. Medics are essential in marine-based " <>
          "compositions, dramatically increasing the staying power of bio armies. They can also use " <>
          "Restoration to remove negative effects and Optical Flare to blind detector units.",
      description_ko:
        "주변 생체 유닛을 치료하는 지원 보병이다. 메딕은 마린 기반 조합에서 필수적으로, " <>
          "바이오 군대의 지속력을 크게 향상시킨다. 레스토레이션으로 부정적 효과를 제거하거나 " <>
          "옵티컬 플레어로 탐지 유닛의 시야를 줄일 수도 있다."
    },
    %{
      slug: "ghost",
      name: "Ghost",
      name_ko: "고스트",
      race: "terran",
      type: :ground,
      minerals: 25,
      gas: 75,
      supply: 1,
      hp: 45,
      armor: 0,
      damage: 10,
      built_from: "barracks",
      description:
        "Elite covert operative with personal cloaking and powerful abilities. Ghosts can call down " <>
          "Nuclear Strikes for massive area damage, use Lockdown to disable mechanical units, and cloak " <>
          "to move invisibly. Requires a Covert Ops attached to a Science Facility.",
      description_ko:
        "개인 클로킹과 강력한 능력을 갖춘 엘리트 특수 요원이다. 고스트는 핵 공격으로 대규모 범위 피해를 주거나, " <>
          "락다운으로 기계 유닛을 무력화하거나, 클로킹으로 투명 상태에서 이동할 수 있다. " <>
          "사이언스 퍼실리티에 부착된 커버트 옵스가 필요하다."
    },
    %{
      slug: "vulture",
      name: "Vulture",
      name_ko: "벌처",
      race: "terran",
      type: :ground,
      minerals: 75,
      gas: 0,
      supply: 2,
      hp: 80,
      armor: 0,
      damage: 20,
      built_from: "factory",
      description:
        "Fast hover bike that excels at harassment and map control. Vultures deal concussive damage " <>
          "(less effective against large units) and can plant Spider Mines — burrowed explosives that " <>
          "detonate when enemies approach. Their speed makes them ideal for worker harassment.",
      description_ko:
        "견제와 맵 컨트롤에 뛰어난 고속 호버 바이크이다. 벌처는 진동 피해를 입히며 " <>
          "(대형 유닛에게는 덜 효과적) 스파이더 마인을 매설할 수 있다 — 적이 접근하면 " <>
          "폭발하는 매설형 폭탄이다. 빠른 속도 덕분에 일꾼 견제에 이상적이다."
    },
    %{
      slug: "siege-tank",
      name: "Siege Tank",
      name_ko: "시즈 탱크",
      race: "terran",
      type: :ground,
      minerals: 150,
      gas: 100,
      supply: 2,
      hp: 150,
      armor: 1,
      damage: 30,
      built_from: "factory",
      description:
        "Heavy assault vehicle that can switch between mobile tank mode (30 damage) and stationary " <>
          "siege mode (70 explosive splash damage with 12 range). Siege tanks are the cornerstone of " <>
          "Terran positional play, creating kill zones that are extremely difficult to push into.",
      description_ko:
        "이동 가능한 탱크 모드(30 피해)와 고정 시즈 모드(사거리 12의 70 폭발형 범위 피해)를 " <>
          "전환할 수 있는 중화기 차량이다. 시즈 탱크는 테란 진지전의 핵심으로, " <>
          "돌파하기 극도로 어려운 킬존을 형성한다."
    },
    %{
      slug: "goliath",
      name: "Goliath",
      name_ko: "골리앗",
      race: "terran",
      type: :ground,
      minerals: 100,
      gas: 50,
      supply: 2,
      hp: 125,
      armor: 1,
      damage: 12,
      built_from: "factory",
      description:
        "Bipedal mech walker with twin autocannons and anti-air missile launchers. Goliaths provide " <>
          "strong anti-air support for mech armies, with 20 explosive damage against air targets (22 " <>
          "range with Charon Boosters). Requires an Armory.",
      description_ko:
        "쌍열 기관포와 대공 미사일 발사기를 장착한 이족 보행 메카닉 워커이다. " <>
          "골리앗은 메카닉 군대에 강력한 대공 지원을 제공하며, 공중 대상에 20 폭발형 피해를 입힌다 " <>
          "(카론 부스터로 사거리 22). 아머리가 필요하다."
    },
    %{
      slug: "wraith",
      name: "Wraith",
      name_ko: "레이스",
      race: "terran",
      type: :air,
      minerals: 150,
      gas: 100,
      supply: 2,
      hp: 120,
      armor: 0,
      damage: 8,
      built_from: "starport",
      description:
        "Light air superiority fighter with ground attack capability. Wraiths can cloak with the " <>
          "Apollo Reactor upgrade, making them effective for harassment. Their air-to-air attack deals " <>
          "20 explosive damage, making them decent dogfighters.",
      description_ko:
        "지상 공격 능력도 갖춘 경량 제공 전투기이다. 레이스는 아폴로 리액터 업그레이드로 " <>
          "클로킹이 가능해 견제에 효과적이다. 공대공 공격이 20 폭발형 피해를 입혀 " <>
          "공중전에서도 활약할 수 있다."
    },
    %{
      slug: "dropship",
      name: "Dropship",
      name_ko: "드랍십",
      race: "terran",
      type: :air,
      minerals: 100,
      gas: 100,
      supply: 2,
      hp: 150,
      armor: 1,
      damage: 0,
      built_from: "starport",
      description:
        "Armored transport that can carry up to 8 supply worth of ground units. Dropships enable " <>
          "multi-pronged attacks, cliff drops, and harassment strategies. Essential for tank drops " <>
          "and marine/medic drops in the mid and late game.",
      description_ko:
        "최대 8 서플라이 분의 지상 유닛을 수송할 수 있는 장갑 수송선이다. " <>
          "드랍십은 다방면 공격, 절벽 드랍, 견제 전략을 가능하게 한다. " <>
          "중반과 후반의 탱크 드랍과 마린/메딕 드랍에 필수적이다."
    },
    %{
      slug: "valkyrie",
      name: "Valkyrie",
      name_ko: "발키리",
      race: "terran",
      type: :air,
      minerals: 250,
      gas: 125,
      supply: 3,
      hp: 200,
      armor: 2,
      damage: 6,
      built_from: "starport",
      description:
        "Heavy anti-air frigate that fires volleys of Halo Rockets. Each attack launches 8 missiles " <>
          "that deal splash damage, making Valkyries devastating against groups of air units like " <>
          "Mutalisks or Scourge. Requires a Control Tower and an Armory.",
      description_ko:
        "헤일로 로켓을 일제 사격하는 중대공 호위함이다. 공격 한 번에 8발의 미사일을 발사하며 " <>
          "범위 피해를 입히므로, 뮤탈리스크나 스커지 같은 공중 유닛 무리에 치명적이다. " <>
          "컨트롤 타워와 아머리가 필요하다."
    },
    %{
      slug: "science-vessel",
      name: "Science Vessel",
      name_ko: "사이언스 베슬",
      race: "terran",
      type: :air,
      minerals: 100,
      gas: 225,
      supply: 2,
      hp: 200,
      armor: 1,
      damage: 0,
      built_from: "starport",
      description:
        "Flying detector and support caster. Science Vessels can use Defensive Matrix (absorbs 250 " <>
          "damage on a target unit), EMP Shockwave (drains shields and energy in an area), and " <>
          "Irradiate (deals damage over time to biological units). Essential for detection and countering " <>
          "Protoss shields.",
      description_ko:
        "비행형 탐지기 겸 지원 시전 유닛이다. 사이언스 베슬은 디펜시브 매트릭스(대상 유닛에 250 피해 흡수), " <>
          "EMP 충격파(범위 내 보호막과 에너지 소진), 이래디에이트(생체 유닛에 지속 피해)를 사용할 수 있다. " <>
          "탐지와 프로토스 보호막 대응에 필수적이다."
    },
    %{
      slug: "battlecruiser",
      name: "Battlecruiser",
      name_ko: "배틀크루저",
      race: "terran",
      type: :air,
      minerals: 400,
      gas: 300,
      supply: 6,
      hp: 500,
      armor: 3,
      damage: 25,
      built_from: "starport",
      description:
        "The Terran capital ship. Battlecruisers have massive HP, strong attacks against both ground " <>
          "and air, and can be equipped with the Yamato Cannon — a devastating 260-damage single-target " <>
          "ability. Expensive and slow to build, but extremely powerful in numbers.",
      description_ko:
        "테란의 주력함이다. 배틀크루저는 막대한 체력과 지상/공중 모두에 대한 강력한 공격력을 갖추며, " <>
          "야마토 캐논 — 260 피해의 치명적인 단일 대상 능력을 장착할 수 있다. " <>
          "비싸고 생산이 느리지만, 다수가 모이면 극도로 강력하다."
    },

    # -- Protoss --
    %{
      slug: "probe",
      name: "Probe",
      name_ko: "프로브",
      race: "protoss",
      type: :ground,
      minerals: 50,
      gas: 0,
      supply: 1,
      hp: 20,
      shields: 20,
      armor: 0,
      damage: 5,
      built_from: "nexus",
      description:
        "The Protoss worker unit. Probes harvest resources and warp in buildings by initiating a " <>
          "dimensional recall — once started, the Probe is free to return to work while the building " <>
          "constructs itself. This gives Protoss an economic advantage during construction.",
      description_ko:
        "프로토스의 일꾼 유닛이다. 프로브는 자원을 채취하고 차원 소환을 통해 건물을 워프인한다 — " <>
          "소환이 시작되면 프로브는 자유롭게 작업에 복귀할 수 있고, 건물은 스스로 건설된다. " <>
          "이 덕분에 프로토스는 건설 중에도 경제적 이점을 유지한다."
    },
    %{
      slug: "zealot",
      name: "Zealot",
      name_ko: "질럿",
      race: "protoss",
      type: :ground,
      minerals: 100,
      gas: 0,
      supply: 2,
      hp: 100,
      shields: 60,
      armor: 1,
      damage: 8,
      built_from: "gateway",
      description:
        "Psionic warrior that attacks twice per swing for 16 total damage. Zealots are the frontline " <>
          "of Protoss armies, absorbing damage with their high HP and shields. With the Leg Enhancements " <>
          "upgrade from the Citadel of Adun, they gain a significant speed boost.",
      description_ko:
        "한 번의 공격에 두 번 타격하여 총 16의 피해를 주는 사이오닉 전사이다. " <>
          "질럿은 높은 체력과 보호막으로 피해를 흡수하는 프로토스 군대의 전방 유닛이다. " <>
          "시타델 오브 아둔에서 다리 강화 업그레이드를 하면 상당한 이동 속도 향상을 얻는다."
    },
    %{
      slug: "dragoon",
      name: "Dragoon",
      name_ko: "드라군",
      race: "protoss",
      type: :ground,
      minerals: 125,
      gas: 50,
      supply: 2,
      hp: 100,
      shields: 80,
      armor: 1,
      damage: 20,
      built_from: "gateway",
      description:
        "Ranged assault walker piloted by a mortally wounded Protoss warrior. Dragoons deal 20 " <>
          "explosive damage and can attack both ground and air. Their Singularity Charge upgrade " <>
          "extends their range to 6. They are the workhorse of Protoss armies but have notoriously " <>
          "poor pathfinding.",
      description_ko:
        "치명상을 입은 프로토스 전사가 조종하는 원거리 공격 워커이다. 드라군은 20 폭발형 피해를 입히며 " <>
          "지상과 공중 모두 공격할 수 있다. 싱귤래리티 차지 업그레이드로 사거리가 6으로 늘어난다. " <>
          "프로토스 군대의 주력이지만 길찾기가 나쁘기로 악명 높다."
    },
    %{
      slug: "high-templar",
      name: "High Templar",
      name_ko: "하이 템플러",
      race: "protoss",
      type: :ground,
      minerals: 50,
      gas: 150,
      supply: 2,
      hp: 40,
      shields: 40,
      armor: 0,
      damage: 0,
      built_from: "gateway",
      description:
        "Powerful psionic caster. High Templar are fragile but carry one of the most devastating " <>
          "abilities in the game: Psionic Storm, which deals 112 damage over 3 seconds in an area. " <>
          "They can also cast Hallucination to create decoy units. Two High Templar can merge into an Archon.",
      description_ko:
        "강력한 사이오닉 시전 유닛이다. 하이 템플러는 약하지만 게임 내 가장 파괴적인 능력 중 하나인 " <>
          "사이오닉 스톰을 보유한다 — 범위 내에서 3초간 112의 피해를 입힌다. " <>
          "할루시네이션으로 미끼 유닛을 생성할 수도 있다. 두 하이 템플러가 합체하여 아콘이 된다."
    },
    %{
      slug: "dark-templar",
      name: "Dark Templar",
      name_ko: "다크 템플러",
      race: "protoss",
      type: :ground,
      minerals: 125,
      gas: 100,
      supply: 2,
      hp: 80,
      shields: 40,
      armor: 1,
      damage: 40,
      built_from: "gateway",
      description:
        "Permanently cloaked melee assassin with extremely high damage. Dark Templar deal 40 damage " <>
          "per hit and can only be seen by detectors. They are devastating in the early-mid game before " <>
          "opponents have reliable detection. Two Dark Templar can merge into a Dark Archon.",
      description_ko:
        "영구 은폐 상태의 근접 암살 유닛으로 극도로 높은 피해량을 자랑한다. " <>
          "다크 템플러는 타격당 40의 피해를 입히며 탐지기로만 볼 수 있다. " <>
          "상대가 안정적인 탐지 수단을 갖추기 전인 초중반에 치명적이다. " <>
          "두 다크 템플러가 합체하여 다크 아콘이 된다."
    },
    %{
      slug: "archon",
      name: "Archon",
      name_ko: "아콘",
      race: "protoss",
      type: :ground,
      minerals: 100,
      gas: 300,
      supply: 4,
      hp: 10,
      shields: 350,
      armor: 0,
      damage: 30,
      built_from: "merge",
      description:
        "A being of pure psionic energy formed by merging two High Templar. Archons have massive " <>
          "shields (350) but only 10 HP, and deal 30 splash damage. They are excellent against " <>
          "biological units and mutalisk flocks. Their shields regenerate, making them very durable.",
      description_ko:
        "두 하이 템플러가 합체하여 형성된 순수 사이오닉 에너지 존재이다. " <>
          "아콘은 거대한 보호막(350)을 가지지만 체력은 10밖에 없으며, 30의 범위 피해를 입힌다. " <>
          "생체 유닛과 뮤탈리스크 무리에 매우 효과적이다. 보호막이 재생되어 매우 높은 내구력을 자랑한다."
    },
    %{
      slug: "dark-archon",
      name: "Dark Archon",
      name_ko: "다크 아콘",
      race: "protoss",
      type: :ground,
      minerals: 250,
      gas: 200,
      supply: 4,
      hp: 25,
      shields: 200,
      armor: 1,
      damage: 0,
      built_from: "merge",
      description:
        "Formed by merging two Dark Templar. Dark Archons are spellcasters with unique abilities: " <>
          "Mind Control permanently converts an enemy unit, Maelstrom freezes biological units in an area, " <>
          "and Feedback deals damage equal to a target's remaining energy. Rarely seen but powerful.",
      description_ko:
        "두 다크 템플러가 합체하여 형성된다. 다크 아콘은 독특한 능력을 가진 시전 유닛이다. " <>
          "마인드 컨트롤은 적 유닛을 영구적으로 빼앗고, 메일스트롬은 범위 내 생체 유닛을 얼리며, " <>
          "피드백은 대상의 남은 에너지만큼 피해를 입힌다. 드물게 등장하지만 매우 강력하다."
    },
    %{
      slug: "reaver",
      name: "Reaver",
      name_ko: "리버",
      race: "protoss",
      type: :ground,
      minerals: 200,
      gas: 100,
      supply: 4,
      hp: 100,
      shields: 80,
      armor: 0,
      damage: 100,
      built_from: "robotics-facility",
      description:
        "Slow-moving siege unit that launches Scarabs — autonomous drones that deal 100 splash damage. " <>
          "Reavers are devastating when dropped from Shuttles into mineral lines or army flanks. " <>
          "Scarabs must be built individually (15 minerals each) and can sometimes miss or be destroyed.",
      description_ko:
        "스캐럽을 발사하는 느린 공성 유닛이다 — 스캐럽은 100의 범위 피해를 입히는 자율 드론이다. " <>
          "리버는 셔틀로 미네랄 라인이나 군대 측면에 드랍할 때 치명적이다. " <>
          "스캐럽은 개별로 생산해야 하며(각 15 미네랄), 가끔 빗나가거나 파괴될 수 있다."
    },
    %{
      slug: "shuttle",
      name: "Shuttle",
      name_ko: "셔틀",
      race: "protoss",
      type: :air,
      minerals: 200,
      gas: 0,
      supply: 2,
      hp: 60,
      shields: 60,
      armor: 1,
      damage: 0,
      built_from: "robotics-facility",
      description:
        "Protoss transport ship. Shuttles carry up to 8 supply of ground units and are essential " <>
          "for Reaver drops, one of Protoss's most powerful harassment strategies. Speed upgrade " <>
          "from the Robotics Support Bay makes them significantly faster.",
      description_ko:
        "프로토스의 수송선이다. 셔틀은 최대 8 서플라이의 지상 유닛을 수송할 수 있으며, " <>
          "프로토스의 가장 강력한 견제 전략 중 하나인 리버 드랍에 필수적이다. " <>
          "로보틱스 서포트 베이의 속도 업그레이드로 상당히 빨라진다."
    },
    %{
      slug: "observer",
      name: "Observer",
      name_ko: "옵저버",
      race: "protoss",
      type: :air,
      minerals: 25,
      gas: 75,
      supply: 1,
      hp: 40,
      shields: 20,
      armor: 0,
      damage: 0,
      built_from: "robotics-facility",
      description:
        "Permanently cloaked flying detector. Observers are essential for scouting and detecting " <>
          "cloaked/burrowed units. They are fragile but invisible, making them perfect for keeping " <>
          "tabs on opponent expansions and army movements.",
      description_ko:
        "영구 은폐 상태의 비행형 탐지기이다. 옵저버는 정찰과 은폐/버로우 유닛 탐지에 필수적이다. " <>
          "약하지만 보이지 않아, 상대의 확장과 군대 이동을 감시하는 데 안성맞춤이다."
    },
    %{
      slug: "corsair",
      name: "Corsair",
      name_ko: "커세어",
      race: "protoss",
      type: :air,
      minerals: 150,
      gas: 100,
      supply: 2,
      hp: 100,
      shields: 80,
      armor: 1,
      damage: 5,
      built_from: "stargate",
      description:
        "Fast air-to-air interceptor with splash damage. Corsairs excel at destroying groups of " <>
          "Mutalisks and Overlords. They can also cast Disruption Web, which prevents ground units " <>
          "and buildings beneath it from attacking — powerful for neutering static defenses.",
      description_ko:
        "범위 피해를 가진 고속 공대공 요격기이다. 커세어는 뮤탈리스크와 오버로드 무리를 " <>
          "격파하는 데 탁월하다. 디스럽션 웹을 시전하여 범위 내 지상 유닛과 건물의 공격을 " <>
          "차단할 수도 있어, 고정 방어 시설을 무력화하는 데 강력하다."
    },
    %{
      slug: "scout",
      name: "Scout",
      name_ko: "스카웃",
      race: "protoss",
      type: :air,
      minerals: 275,
      gas: 125,
      supply: 3,
      hp: 150,
      shields: 100,
      armor: 0,
      damage: 8,
      built_from: "stargate",
      description:
        "Heavy air unit with strong anti-air capabilities. Scouts have 28 explosive damage against air " <>
          "targets but weak ground attack. Despite their stats on paper, Scouts are rarely used in " <>
          "competitive play because other options (Corsairs, Carriers) are more cost-efficient.",
      description_ko:
        "강력한 대공 능력을 가진 중공중 유닛이다. 스카웃은 공중 대상에 28 폭발형 피해를 입히지만 " <>
          "지상 공격은 약하다. 스펙상으로는 좋지만, 다른 선택지(커세어, 캐리어)가 " <>
          "더 비용 효율적이기 때문에 대회에서는 거의 사용되지 않는다."
    },
    %{
      slug: "carrier",
      name: "Carrier",
      name_ko: "캐리어",
      race: "protoss",
      type: :air,
      minerals: 350,
      gas: 250,
      supply: 6,
      hp: 300,
      shields: 150,
      armor: 4,
      damage: 6,
      built_from: "stargate",
      description:
        "Protoss capital ship that launches up to 8 Interceptors (25 minerals each). Each Interceptor " <>
          "deals 6 damage, for a potential 48 damage per volley. Carriers are powerful in numbers and " <>
          "can kite effectively, but require significant investment to reach critical mass.",
      description_ko:
        "최대 8대의 인터셉터(각 25 미네랄)를 발진시키는 프로토스의 주력함이다. " <>
          "각 인터셉터가 6의 피해를 입혀, 한 번의 일제 사격으로 최대 48의 피해가 가능하다. " <>
          "캐리어는 다수가 모이면 강력하고 카이팅도 효과적이지만, 임계 수량에 도달하기까지 " <>
          "상당한 투자가 필요하다."
    },
    %{
      slug: "arbiter",
      name: "Arbiter",
      name_ko: "아비터",
      race: "protoss",
      type: :air,
      minerals: 100,
      gas: 350,
      supply: 4,
      hp: 200,
      shields: 150,
      armor: 1,
      damage: 10,
      built_from: "stargate",
      description:
        "Support capital ship with a passive cloaking field that hides all friendly units beneath it. " <>
          "Arbiters can cast Recall (teleports units to the Arbiter's location) and Stasis Field " <>
          "(freezes all units in an area, making them invulnerable and unable to act). Game-changing " <>
          "in late-game engagements.",
      description_ko:
        "아래에 있는 모든 아군 유닛을 숨기는 패시브 클로킹 필드를 가진 지원형 주력함이다. " <>
          "아비터는 리콜(유닛을 아비터 위치로 순간이동)과 스테이시스 필드(범위 내 모든 유닛을 " <>
          "무적 상태로 동결, 행동 불가)를 시전할 수 있다. 후반 교전에서 판도를 뒤집는 유닛이다."
    },

    # -- Zerg --
    %{
      slug: "drone",
      name: "Drone",
      name_ko: "드론",
      race: "zerg",
      type: :ground,
      minerals: 50,
      gas: 0,
      supply: 1,
      hp: 40,
      armor: 0,
      damage: 5,
      built_from: "hatchery",
      description:
        "The Zerg worker unit. Drones harvest resources and morph into buildings — the Drone is " <>
          "consumed in the process, unlike other races' workers. This means each building costs an " <>
          "additional worker, making Zerg building decisions more impactful.",
      description_ko:
        "저그의 일꾼 유닛이다. 드론은 자원을 채취하고 건물로 변태한다 — 다른 종족의 일꾼과 달리 " <>
          "드론은 건물이 되면서 소멸한다. 이는 각 건물이 일꾼 하나를 추가로 소모한다는 뜻으로, " <>
          "저그의 건물 건설 결정이 더 큰 영향을 미치게 된다."
    },
    %{
      slug: "zergling",
      name: "Zergling",
      name_ko: "저글링",
      race: "zerg",
      type: :ground,
      minerals: 50,
      gas: 0,
      supply: 1,
      hp: 35,
      armor: 0,
      damage: 5,
      built_from: "hatchery",
      description:
        "Fast, cheap melee attacker produced two at a time from a single larva. Zerglings are the " <>
          "backbone of early aggression and remain useful throughout the game for run-bys and surrounds. " <>
          "Adrenal Glands (from Hive) makes them attack nearly twice as fast, turning them deadly.",
      description_ko:
        "하나의 라바에서 두 마리씩 생산되는 빠르고 저렴한 근접 공격 유닛이다. " <>
          "저글링은 초반 공격의 핵심이며, 런바이와 서라운드로 게임 내내 유용하다. " <>
          "아드레날 글랜드(하이브 필요)를 연구하면 공격 속도가 거의 두 배가 되어 치명적으로 변한다."
    },
    %{
      slug: "hydralisk",
      name: "Hydralisk",
      name_ko: "히드라리스크",
      race: "zerg",
      type: :ground,
      minerals: 75,
      gas: 25,
      supply: 1,
      hp: 80,
      armor: 0,
      damage: 10,
      built_from: "hatchery",
      description:
        "Ranged attacker that fires needle spines at ground and air targets. Hydralisks are versatile " <>
          "and efficient, forming the core of many Zerg compositions. They can morph into Lurkers " <>
          "with the Lurker Aspect upgrade. Speed and range upgrades are essential.",
      description_ko:
        "지상과 공중 대상에게 바늘 가시를 발사하는 원거리 공격 유닛이다. " <>
          "히드라리스크는 다재다능하고 효율적이며, 많은 저그 조합의 핵심을 이룬다. " <>
          "러커 애스펙트 업그레이드로 러커로 변태할 수 있다. 속도와 사거리 업그레이드가 필수적이다."
    },
    %{
      slug: "lurker",
      name: "Lurker",
      name_ko: "러커",
      race: "zerg",
      type: :ground,
      minerals: 125,
      gas: 125,
      supply: 2,
      hp: 125,
      armor: 1,
      damage: 20,
      built_from: "hydralisk",
      description:
        "Morphed from Hydralisks, Lurkers burrow into the ground and attack with subterranean spines " <>
          "that deal 20 splash damage in a line. They can only attack while burrowed, making detection " <>
          "essential for opponents. Lurkers are the Zerg's primary area-denial unit.",
      description_ko:
        "히드라리스크에서 변태하며, 땅속에 파고들어 직선으로 20의 범위 피해를 입히는 " <>
          "지하 가시로 공격한다. 버로우 상태에서만 공격할 수 있어, 상대에게 탐지가 필수적이다. " <>
          "러커는 저그의 주요 지역 거부 유닛이다."
    },
    %{
      slug: "mutalisk",
      name: "Mutalisk",
      name_ko: "뮤탈리스크",
      race: "zerg",
      type: :air,
      minerals: 100,
      gas: 100,
      supply: 2,
      hp: 120,
      armor: 0,
      damage: 9,
      built_from: "hatchery",
      description:
        "Agile flying attacker whose Glave Wurm bounces to hit up to 3 targets (9, 3, 1 damage). " <>
          "Mutalisks are the premier Zerg harassment unit, fast enough to pick off workers and retreat " <>
          "before the opponent can respond. They can morph into Guardians or Devourers at a Greater Spire.",
      description_ko:
        "글레이브 웜이 튕겨 최대 3개의 대상을 타격하는(9, 3, 1 피해) 민첩한 비행 공격 유닛이다. " <>
          "뮤탈리스크는 저그 최고의 견제 유닛으로, 일꾼을 처리하고 상대가 대응하기 전에 " <>
          "퇴각할 수 있을 만큼 빠르다. 그레이터 스파이어에서 가디언이나 디바우러로 변태할 수 있다."
    },
    %{
      slug: "scourge",
      name: "Scourge",
      name_ko: "스커지",
      race: "zerg",
      type: :air,
      minerals: 25,
      gas: 75,
      supply: 1,
      hp: 25,
      armor: 0,
      damage: 110,
      built_from: "hatchery",
      description:
        "Kamikaze flying unit produced two per larva. Scourge fly into enemy air units and detonate " <>
          "for 110 damage. They are cheap and devastating against capital ships and transports, but " <>
          "fragile and easily killed before reaching their target.",
      description_ko:
        "라바 하나에서 두 마리씩 생산되는 자폭 비행 유닛이다. 스커지는 적 공중 유닛에 돌진하여 " <>
          "110의 피해를 입히며 폭발한다. 저렴하고 주력함과 수송선에 치명적이지만, " <>
          "약해서 대상에 도달하기 전에 쉽게 격추당할 수 있다."
    },
    %{
      slug: "queen",
      name: "Queen",
      name_ko: "퀸",
      race: "zerg",
      type: :air,
      minerals: 100,
      gas: 100,
      supply: 2,
      hp: 120,
      armor: 0,
      damage: 0,
      built_from: "hatchery",
      description:
        "Support caster with unique abilities. Spawn Broodling instantly kills a non-robotic ground " <>
          "unit and spawns two Broodlings. Ensnare slows all units in an area and reveals cloaked units. " <>
          "Parasite attaches to a unit, sharing its vision with the Zerg player permanently.",
      description_ko:
        "독특한 능력을 가진 지원 시전 유닛이다. 스폰 브루들링은 비로봇 지상 유닛을 즉사시키고 " <>
          "두 마리의 브루들링을 생성한다. 인스네어는 범위 내 모든 유닛을 감속시키고 은폐 유닛을 드러낸다. " <>
          "패러사이트는 유닛에 부착되어 저그 선수에게 영구적으로 해당 유닛의 시야를 공유한다."
    },
    %{
      slug: "ultralisk",
      name: "Ultralisk",
      name_ko: "울트라리스크",
      race: "zerg",
      type: :ground,
      minerals: 200,
      gas: 200,
      supply: 4,
      hp: 400,
      armor: 1,
      damage: 20,
      built_from: "hatchery",
      description:
        "Massive armored beast — the Zerg's heavy ground unit. Ultralisks have 400 HP and can be " <>
          "upgraded with Chitinous Plating for +2 base armor, making them extremely durable. They deal " <>
          "splash damage in melee. Effective as damage sponges that protect fragile Zerg units behind them.",
      description_ko:
        "거대한 장갑 생물체 — 저그의 중지상 유닛이다. 울트라리스크는 400의 체력을 가지며, " <>
          "키틴질 도금으로 기본 방어력 +2를 업그레이드하면 극도로 튼튼해진다. " <>
          "근접 범위 피해를 입히며, 뒤에 있는 약한 저그 유닛을 보호하는 탱커 역할을 효과적으로 수행한다."
    },
    %{
      slug: "defiler",
      name: "Defiler",
      name_ko: "디파일러",
      race: "zerg",
      type: :ground,
      minerals: 50,
      gas: 150,
      supply: 2,
      hp: 80,
      armor: 1,
      damage: 0,
      built_from: "hatchery",
      description:
        "Late-game spellcaster with two of the most powerful abilities in the game. Dark Swarm creates " <>
          "a cloud that blocks all ranged attacks against ground units underneath — devastating against " <>
          "marines and dragoons. Plague deals 295 damage to all units in an area (cannot kill, leaves 1 HP). " <>
          "Consume sacrifices a friendly Zerg unit to restore energy.",
      description_ko:
        "게임 내 가장 강력한 능력 두 가지를 가진 후반 시전 유닛이다. " <>
          "다크 스웜은 아래의 지상 유닛에 대한 모든 원거리 공격을 차단하는 구름을 생성하여 " <>
          "마린과 드라군에 치명적이다. 플레이그는 범위 내 모든 유닛에 295 피해를 입힌다 " <>
          "(죽이지는 못하고 체력 1을 남긴다). 컨슘은 아군 저그 유닛을 희생하여 에너지를 회복한다."
    },
    %{
      slug: "guardian",
      name: "Guardian",
      name_ko: "가디언",
      race: "zerg",
      type: :air,
      minerals: 150,
      gas: 200,
      supply: 2,
      hp: 150,
      armor: 2,
      damage: 20,
      built_from: "mutalisk",
      description:
        "Evolved from Mutalisks at a Greater Spire. Guardians are slow-moving air units with " <>
          "devastating long-range ground attacks (range 8). They cannot attack air units, so they " <>
          "require escort. Used for breaking entrenched positions from safe distance.",
      description_ko:
        "그레이터 스파이어에서 뮤탈리스크로부터 진화한다. 가디언은 느리지만 " <>
          "파괴적인 장거리 지상 공격(사거리 8)을 가진 공중 유닛이다. " <>
          "공중 유닛을 공격할 수 없어 호위가 필요하다. 안전한 거리에서 진지를 돌파하는 데 사용된다."
    },
    %{
      slug: "devourer",
      name: "Devourer",
      name_ko: "디바우러",
      race: "zerg",
      type: :air,
      minerals: 250,
      gas: 150,
      supply: 2,
      hp: 250,
      armor: 2,
      damage: 25,
      built_from: "mutalisk",
      description:
        "Evolved from Mutalisks at a Greater Spire. Devourers are heavy air-to-air attackers that " <>
          "apply Acid Spores to targets, reducing their armor and making them vulnerable. Each hit " <>
          "stacks the debuff. Rarely seen in competitive play due to cost and limited utility.",
      description_ko:
        "그레이터 스파이어에서 뮤탈리스크로부터 진화한다. 디바우러는 대상에 산성 포자를 적용하여 " <>
          "방어력을 감소시키고 취약하게 만드는 중공대공 공격 유닛이다. " <>
          "타격할 때마다 디버프가 중첩된다. 비용과 제한적인 활용도 때문에 대회에서 거의 등장하지 않는다."
    },
    %{
      slug: "overlord",
      name: "Overlord",
      name_ko: "오버로드",
      race: "zerg",
      type: :air,
      minerals: 100,
      gas: 0,
      supply: 0,
      hp: 200,
      armor: 0,
      damage: 0,
      built_from: "hatchery",
      description:
        "Flying unit that provides 8 supply and serves as the Zerg's detector (with the Antennae " <>
          "upgrade). Overlords can also transport units with the Ventral Sacs upgrade. They are slow " <>
          "and vulnerable but essential — losing Overlords means losing supply capacity.",
      description_ko:
        "8 보급을 제공하며 안테나 업그레이드로 저그의 탐지기 역할을 하는 비행 유닛이다. " <>
          "벤트럴 삭 업그레이드로 유닛 수송도 가능하다. 느리고 취약하지만 필수적인 유닛으로, " <>
          "오버로드를 잃으면 보급 용량을 잃게 된다."
    },
    %{
      slug: "infested-terran",
      name: "Infested Terran",
      name_ko: "감염된 테란",
      race: "zerg",
      type: :ground,
      minerals: 100,
      gas: 50,
      supply: 1,
      hp: 60,
      armor: 0,
      damage: 500,
      built_from: "infested-command-center",
      description:
        "Suicide unit produced from an Infested Command Center. Infested Terrans deal 500 explosive " <>
          "splash damage on detonation. They are rarely seen because obtaining an Infested Command Center " <>
          "requires a Queen to infest a heavily damaged Terran Command Center.",
      description_ko:
        "감염된 커맨드 센터에서 생산되는 자폭 유닛이다. 감염된 테란은 폭발 시 500의 폭발형 " <>
          "범위 피해를 입힌다. 감염된 커맨드 센터를 얻으려면 퀸이 크게 손상된 테란 커맨드 센터를 " <>
          "감염시켜야 하므로, 대회에서 거의 등장하지 않는다."
    }
  ]

  def units, do: @units
  def unit(slug), do: Enum.find(@units, &(&1.slug == slug))
  def units_for_race(race_slug), do: Enum.filter(@units, &(&1.race == race_slug))

  # ---------------------------------------------------------------------------
  # Buildings
  # ---------------------------------------------------------------------------

  @buildings [
    # -- Terran --
    %{
      slug: "command-center",
      name: "Command Center",
      name_ko: "커맨드 센터",
      race: "terran",
      minerals: 400,
      gas: 0,
      hp: 1500,
      description:
        "The primary Terran structure. Produces SCVs and serves as the center of a Terran base. " <>
          "Can lift off and relocate. Add-ons: ComSat Station (scanner sweep for map vision) or " <>
          "Nuclear Silo (produces nuclear missiles for Ghosts).",
      description_ko:
        "테란의 주요 건물이다. 건설로봇을 생산하며 테란 기지의 중심 역할을 한다. " <>
          "띄워서 재배치할 수 있다. 애드온: 컴샛 스테이션(맵 시야 확보를 위한 스캐너 스윕) 또는 " <>
          "뉴클리어 사일로(고스트용 핵 미사일 생산).",
      produces: ["scv"]
    },
    %{
      slug: "barracks",
      name: "Barracks",
      name_ko: "배럭",
      race: "terran",
      minerals: 150,
      gas: 0,
      hp: 1000,
      description:
        "Produces Terran infantry: Marines, Firebats, Medics, and Ghosts. The Barracks is the " <>
          "first military production building and can lift off. Required for Factory construction.",
      description_ko:
        "테란 보병을 생산한다: 마린, 파이어뱃, 메딕, 고스트. 배럭은 첫 번째 군사 생산 건물이며 " <>
          "띄울 수 있다. 팩토리 건설에 필요하다.",
      produces: ["marine", "firebat", "medic", "ghost"]
    },
    %{
      slug: "factory",
      name: "Factory",
      name_ko: "팩토리",
      race: "terran",
      minerals: 200,
      gas: 100,
      hp: 1250,
      description:
        "Produces Terran mechanical ground units: Vultures, Siege Tanks, and Goliaths. " <>
          "Can be upgraded with a Machine Shop add-on for Siege Mode, Spider Mines, and " <>
          "Ion Thrusters research. Can lift off.",
      description_ko:
        "테란의 기계 지상 유닛을 생산한다: 벌처, 시즈 탱크, 골리앗. " <>
          "머신 샵 애드온으로 시즈 모드, 스파이더 마인, 이온 스러스터를 연구할 수 있다. " <>
          "띄울 수 있다.",
      produces: ["vulture", "siege-tank", "goliath"]
    },
    %{
      slug: "starport",
      name: "Starport",
      name_ko: "스타포트",
      race: "terran",
      minerals: 150,
      gas: 100,
      hp: 1300,
      description:
        "Produces Terran air units: Wraiths, Dropships, Valkyries, Science Vessels, and " <>
          "Battlecruisers. Requires a Control Tower add-on for advanced units. Can lift off.",
      description_ko:
        "테란 공중 유닛을 생산한다: 레이스, 드랍십, 발키리, 사이언스 베슬, 배틀크루저. " <>
          "고급 유닛을 위해 컨트롤 타워 애드온이 필요하다. 띄울 수 있다.",
      produces: ["wraith", "dropship", "valkyrie", "science-vessel", "battlecruiser"]
    },
    %{
      slug: "academy",
      name: "Academy",
      name_ko: "아카데미",
      race: "terran",
      minerals: 150,
      gas: 0,
      hp: 600,
      description:
        "Enables Firebat and Medic production at the Barracks. Researches Stim Pack, " <>
          "U-238 Shells (marine range), and Medic abilities (Restoration, Optical Flare).",
      description_ko:
        "배럭에서 파이어뱃과 메딕 생산을 활성화한다. 스팀팩, U-238 탄환(마린 사거리), " <>
          "메딕 능력(레스토레이션, 옵티컬 플레어)을 연구한다.",
      produces: []
    },
    %{
      slug: "engineering-bay",
      name: "Engineering Bay",
      name_ko: "엔지니어링 베이",
      race: "terran",
      minerals: 125,
      gas: 0,
      hp: 850,
      description:
        "Researches infantry weapon and armor upgrades. Also required to build Missile Turrets " <>
          "for anti-air defense and detection. Can lift off.",
      description_ko:
        "보병 무기 및 방어구 업그레이드를 연구한다. 대공 방어와 탐지를 위한 미사일 터렛 건설에도 " <>
          "필요하다. 띄울 수 있다.",
      produces: []
    },
    %{
      slug: "armory",
      name: "Armory",
      name_ko: "아머리",
      race: "terran",
      minerals: 100,
      gas: 50,
      hp: 750,
      description:
        "Researches vehicle and ship weapon and armor upgrades. Required for Goliath and Valkyrie " <>
          "production. Enables level 2-3 infantry upgrades at the Engineering Bay.",
      description_ko:
        "차량 및 함선 무기/방어구 업그레이드를 연구한다. 골리앗과 발키리 생산에 필요하다. " <>
          "엔지니어링 베이에서 2-3단계 보병 업그레이드를 활성화한다.",
      produces: []
    },
    %{
      slug: "science-facility",
      name: "Science Facility",
      name_ko: "사이언스 퍼실리티",
      race: "terran",
      minerals: 100,
      gas: 150,
      hp: 850,
      description:
        "Advanced tech building required for Science Vessels and Battlecruisers. Add-ons: " <>
          "Physics Lab (Battlecruiser tech, Yamato Cannon) or Covert Ops (Ghost tech, " <>
          "Cloaking Field, Lockdown, Nuclear Strike).",
      description_ko:
        "사이언스 베슬과 배틀크루저에 필요한 고급 테크 건물이다. 애드온: " <>
          "피직스 랩(배틀크루저 테크, 야마토 캐논) 또는 커버트 옵스(고스트 테크, " <>
          "클로킹, 락다운, 핵 공격).",
      produces: []
    },
    %{
      slug: "bunker",
      name: "Bunker",
      name_ko: "벙커",
      race: "terran",
      minerals: 100,
      gas: 0,
      hp: 350,
      description:
        "Defensive structure that garrisons up to 4 infantry units, increasing their range " <>
          "and providing protection. Garrisoned marines gain +1 range. Bunkers can be salvaged " <>
          "for a 75% mineral refund.",
      description_ko:
        "최대 4명의 보병을 수용하여 사거리를 늘리고 보호하는 방어 건물이다. " <>
          "수용된 마린은 사거리 +1을 얻는다. 벙커는 해체하면 미네랄의 75%를 돌려받을 수 있다.",
      produces: []
    },
    %{
      slug: "missile-turret",
      name: "Missile Turret",
      name_ko: "미사일 터렛",
      race: "terran",
      minerals: 75,
      gas: 0,
      hp: 200,
      description:
        "Anti-air defense structure and detector. Missile Turrets attack air units with " <>
          "20 explosive damage and reveal cloaked/burrowed units in their radius. " <>
          "Requires an Engineering Bay.",
      description_ko:
        "대공 방어 건물이자 탐지기이다. 미사일 터렛은 공중 유닛에 20 폭발형 피해를 입히며 " <>
          "반경 내 은폐/버로우 유닛을 드러낸다. 엔지니어링 베이가 필요하다.",
      produces: []
    },

    # -- Protoss --
    %{
      slug: "nexus",
      name: "Nexus",
      name_ko: "넥서스",
      race: "protoss",
      minerals: 400,
      gas: 0,
      hp: 750,
      shields: 750,
      description:
        "The primary Protoss structure. Produces Probes and serves as the center of a Protoss " <>
          "base. Provides psionic matrix power in a small radius. The Nexus is where resource " <>
          "gathering begins and expansions are established.",
      description_ko:
        "프로토스의 주요 건물이다. 프로브를 생산하며 프로토스 기지의 중심 역할을 한다. " <>
          "작은 반경에 사이오닉 매트릭스 에너지를 제공한다. 넥서스는 자원 채취가 시작되고 " <>
          "확장이 이루어지는 곳이다.",
      produces: ["probe"]
    },
    %{
      slug: "pylon",
      name: "Pylon",
      name_ko: "파일런",
      race: "protoss",
      minerals: 100,
      gas: 0,
      hp: 300,
      shields: 300,
      description:
        "Power structure that provides 8 supply and generates a psionic matrix. Most Protoss " <>
          "buildings must be placed within a Pylon's power field. Losing a Pylon can disable " <>
          "nearby buildings, making Pylon placement a critical strategic consideration.",
      description_ko:
        "8 보급을 제공하고 사이오닉 매트릭스를 생성하는 전력 건물이다. " <>
          "대부분의 프로토스 건물은 파일런의 에너지장 안에 배치해야 한다. " <>
          "파일런을 잃으면 주변 건물이 비활성화될 수 있어, 파일런 배치가 중요한 전략적 고려 사항이다.",
      produces: []
    },
    %{
      slug: "gateway",
      name: "Gateway",
      name_ko: "게이트웨이",
      race: "protoss",
      minerals: 150,
      gas: 0,
      hp: 500,
      shields: 500,
      description:
        "Produces Protoss ground combat units: Zealots, Dragoons, High Templar, and Dark Templar. " <>
          "The Gateway is the primary production building and the first military structure. " <>
          "Multiple Gateways are needed for sustained unit production.",
      description_ko:
        "프로토스 지상 전투 유닛을 생산한다: 질럿, 드라군, 하이 템플러, 다크 템플러. " <>
          "게이트웨이는 주요 생산 건물이자 첫 번째 군사 건물이다. " <>
          "지속적인 유닛 생산을 위해 여러 개의 게이트웨이가 필요하다.",
      produces: ["zealot", "dragoon", "high-templar", "dark-templar"]
    },
    %{
      slug: "forge",
      name: "Forge",
      name_ko: "포지",
      race: "protoss",
      minerals: 150,
      gas: 0,
      hp: 550,
      shields: 550,
      description:
        "Researches ground weapon and armor upgrades for Protoss units. Also required to build " <>
          "Photon Cannons. The Forge is sometimes built before the Gateway in a 'Forge Fast Expand' " <>
          "opening to enable cannon-based defense.",
      description_ko:
        "프로토스 유닛의 지상 무기 및 방어구 업그레이드를 연구한다. 포톤 캐논 건설에도 필요하다. " <>
          "포지는 캐논 기반 방어를 위해 게이트웨이보다 먼저 짓는 '포지 패스트 익스팬드' " <>
          "오프닝에서 사용되기도 한다.",
      produces: []
    },
    %{
      slug: "cybernetics-core",
      name: "Cybernetics Core",
      name_ko: "사이버네틱스 코어",
      race: "protoss",
      minerals: 200,
      gas: 0,
      hp: 500,
      shields: 500,
      description:
        "Enables Dragoon production at the Gateway and researches Singularity Charge (Dragoon range). " <>
          "Also researches air weapon and armor upgrades. Required for Stargate, Citadel of Adun, " <>
          "and Robotics Facility.",
      description_ko:
        "게이트웨이에서 드라군 생산을 활성화하고 싱귤래리티 차지(드라군 사거리)를 연구한다. " <>
          "공중 무기 및 방어구 업그레이드도 연구한다. 스타게이트, 시타델 오브 아둔, " <>
          "로보틱스 퍼실리티 건설에 필요하다.",
      produces: []
    },
    %{
      slug: "robotics-facility",
      name: "Robotics Facility",
      name_ko: "로보틱스 퍼실리티",
      race: "protoss",
      minerals: 200,
      gas: 200,
      hp: 500,
      shields: 500,
      description:
        "Produces Shuttles, Reavers, and Observers. The Robotics Facility enables the Reaver " <>
          "drop strategy and provides access to detection via Observers. Can be upgraded with " <>
          "a Robotics Support Bay for Reaver capacity and Shuttle speed.",
      description_ko:
        "셔틀, 리버, 옵저버를 생산한다. 로보틱스 퍼실리티는 리버 드랍 전략을 가능하게 하며, " <>
          "옵저버를 통해 탐지 수단을 제공한다. 로보틱스 서포트 베이를 추가하면 " <>
          "리버 수용량과 셔틀 속도를 업그레이드할 수 있다.",
      produces: ["shuttle", "reaver", "observer"]
    },
    %{
      slug: "stargate",
      name: "Stargate",
      name_ko: "스타게이트",
      race: "protoss",
      minerals: 150,
      gas: 150,
      hp: 600,
      shields: 600,
      description:
        "Produces Protoss air units: Corsairs, Scouts, Carriers, and Arbiters. Requires a " <>
          "Cybernetics Core. Fleet Beacon add-on enables Carriers and advanced air upgrades. " <>
          "Arbiter Tribunal enables Arbiter production.",
      description_ko:
        "프로토스 공중 유닛을 생산한다: 커세어, 스카웃, 캐리어, 아비터. " <>
          "사이버네틱스 코어가 필요하다. 플릿 비콘으로 캐리어와 고급 공중 업그레이드를 활성화하고, " <>
          "아비터 트리뷰널로 아비터 생산을 활성화한다.",
      produces: ["corsair", "scout", "carrier", "arbiter"]
    },
    %{
      slug: "citadel-of-adun",
      name: "Citadel of Adun",
      name_ko: "시타델 오브 아둔",
      race: "protoss",
      minerals: 150,
      gas: 100,
      hp: 450,
      shields: 450,
      description:
        "Researches Leg Enhancements for Zealots, giving them a significant speed boost. " <>
          "Required to build the Templar Archives. A key timing building for Zealot-based strategies.",
      description_ko:
        "질럿의 다리 강화를 연구하여 상당한 이동 속도 향상을 준다. " <>
          "템플러 아카이브 건설에 필요하다. 질럿 기반 전략의 핵심 타이밍 건물이다.",
      produces: []
    },
    %{
      slug: "templar-archives",
      name: "Templar Archives",
      name_ko: "템플러 아카이브",
      race: "protoss",
      minerals: 150,
      gas: 200,
      hp: 500,
      shields: 500,
      description:
        "Enables High Templar and Dark Templar production at the Gateway. Researches Psionic Storm, " <>
          "Hallucination, Mind Control, Maelstrom, and other Templar abilities.",
      description_ko:
        "게이트웨이에서 하이 템플러와 다크 템플러 생산을 활성화한다. " <>
          "사이오닉 스톰, 할루시네이션, 마인드 컨트롤, 메일스트롬 및 기타 템플러 능력을 연구한다.",
      produces: []
    },
    %{
      slug: "photon-cannon",
      name: "Photon Cannon",
      name_ko: "포톤 캐논",
      race: "protoss",
      minerals: 150,
      gas: 0,
      hp: 100,
      shields: 100,
      description:
        "Defensive structure that attacks ground and air units with 20 damage. Also serves as a " <>
          "detector, revealing cloaked and burrowed units. Requires a Forge and Pylon power. " <>
          "Often used for base defense and cannon rush strategies.",
      description_ko:
        "지상과 공중 유닛에 20의 피해를 입히는 방어 건물이다. 탐지기 역할도 하여 " <>
          "은폐 및 버로우 유닛을 드러낸다. 포지와 파일런 에너지가 필요하다. " <>
          "기지 방어와 캐논 러시 전략에 자주 사용된다.",
      produces: []
    },

    # -- Zerg --
    %{
      slug: "hatchery",
      name: "Hatchery",
      name_ko: "해처리",
      race: "zerg",
      minerals: 300,
      gas: 0,
      hp: 1250,
      description:
        "The primary Zerg structure. Produces larvae (up to 3 at a time), which morph into all " <>
          "Zerg units. Each Hatchery provides both production capacity and 1 supply (2 as Lair, " <>
          "2 as Hive). Upgrades to Lair, then Hive for tech access.",
      description_ko:
        "저그의 주요 건물이다. 모든 저그 유닛으로 변태하는 라바를 생산한다(한 번에 최대 3개). " <>
          "각 해처리는 생산력과 1 보급을 동시에 제공한다(레어로 2, 하이브로 2). " <>
          "레어, 그리고 하이브로 업그레이드하여 테크에 접근한다.",
      produces: ["drone", "zergling", "hydralisk", "mutalisk", "scourge", "queen", "ultralisk", "defiler", "overlord"]
    },
    %{
      slug: "spawning-pool",
      name: "Spawning Pool",
      name_ko: "스포닝 풀",
      race: "zerg",
      minerals: 200,
      gas: 0,
      hp: 750,
      description:
        "Enables Zergling production from the Hatchery. Researches Metabolic Boost (Zergling speed) " <>
          "and Adrenal Glands (Zergling attack speed, requires Hive). The timing of the Spawning Pool " <>
          "defines many Zerg openings — pool first, hatch first, or overpool.",
      description_ko:
        "해처리에서 저글링 생산을 활성화한다. 대사 촉진(저글링 속도)과 " <>
          "아드레날 글랜드(저글링 공격 속도, 하이브 필요)를 연구한다. " <>
          "스포닝 풀의 타이밍이 많은 저그 오프닝을 정의한다 — 풀 퍼스트, 해처리 퍼스트, 오버풀.",
      produces: []
    },
    %{
      slug: "hydralisk-den",
      name: "Hydralisk Den",
      name_ko: "히드라리스크 덴",
      race: "zerg",
      minerals: 100,
      gas: 50,
      hp: 850,
      description:
        "Enables Hydralisk production from the Hatchery. Researches Muscular Augments (Hydralisk speed) " <>
          "and Grooved Spines (Hydralisk range). Also researches Lurker Aspect, allowing Hydralisks " <>
          "to morph into Lurkers.",
      description_ko:
        "해처리에서 히드라리스크 생산을 활성화한다. 근육 강화(히드라리스크 속도)와 " <>
          "홈이 파인 가시(히드라리스크 사거리)를 연구한다. 러커 애스펙트도 연구하여 " <>
          "히드라리스크가 러커로 변태할 수 있게 한다.",
      produces: []
    },
    %{
      slug: "spire",
      name: "Spire",
      name_ko: "스파이어",
      race: "zerg",
      minerals: 200,
      gas: 150,
      hp: 600,
      description:
        "Enables Mutalisk and Scourge production from the Hatchery. Researches Zerg air attack " <>
          "and armor upgrades. Upgrades to Greater Spire (requires Hive) to enable Guardian and " <>
          "Devourer morphing.",
      description_ko:
        "해처리에서 뮤탈리스크와 스커지 생산을 활성화한다. 저그 공중 공격 및 방어구 업그레이드를 연구한다. " <>
          "그레이터 스파이어(하이브 필요)로 업그레이드하면 가디언과 디바우러 변태가 가능해진다.",
      produces: []
    },
    %{
      slug: "queens-nest",
      name: "Queen's Nest",
      name_ko: "퀸즈 네스트",
      race: "zerg",
      minerals: 150,
      gas: 100,
      hp: 850,
      description:
        "Enables Queen production from the Hatchery. Required to upgrade a Lair to a Hive. " <>
          "Researches Spawn Broodling, Ensnare, and Parasite abilities for Queens.",
      description_ko:
        "해처리에서 퀸 생산을 활성화한다. 레어를 하이브로 업그레이드하는 데 필요하다. " <>
          "퀸의 스폰 브루들링, 인스네어, 패러사이트 능력을 연구한다.",
      produces: []
    },
    %{
      slug: "ultralisk-cavern",
      name: "Ultralisk Cavern",
      name_ko: "울트라리스크 캐번",
      race: "zerg",
      minerals: 150,
      gas: 200,
      hp: 600,
      description:
        "Enables Ultralisk production from the Hatchery. Researches Chitinous Plating (+2 Ultralisk " <>
          "armor) and Anabolic Synthesis (Ultralisk speed). Requires a Hive.",
      description_ko:
        "해처리에서 울트라리스크 생산을 활성화한다. 키틴질 도금(울트라리스크 방어력 +2)과 " <>
          "아나볼릭 신테시스(울트라리스크 속도)를 연구한다. 하이브가 필요하다.",
      produces: []
    },
    %{
      slug: "defiler-mound",
      name: "Defiler Mound",
      name_ko: "디파일러 마운드",
      race: "zerg",
      minerals: 100,
      gas: 100,
      hp: 850,
      description:
        "Enables Defiler production from the Hatchery. Researches Consume (sacrifice a Zerg unit " <>
          "to restore Defiler energy), Plague, and Dark Swarm abilities. Requires a Hive.",
      description_ko:
        "해처리에서 디파일러 생산을 활성화한다. 컨슘(저그 유닛을 희생하여 디파일러 에너지 회복), " <>
          "플레이그, 다크 스웜 능력을 연구한다. 하이브가 필요하다.",
      produces: []
    },
    %{
      slug: "evolution-chamber",
      name: "Evolution Chamber",
      name_ko: "에볼루션 챔버",
      race: "zerg",
      minerals: 75,
      gas: 0,
      hp: 750,
      description:
        "Researches Zerg ground melee attack, ranged attack, and carapace upgrades. Required to " <>
          "build Spore Colonies. Equivalent to the Terran Engineering Bay or Protoss Forge.",
      description_ko:
        "저그 지상 근접 공격, 원거리 공격, 갑피 업그레이드를 연구한다. " <>
          "스포어 콜로니 건설에 필요하다. 테란의 엔지니어링 베이나 프로토스의 포지에 해당한다.",
      produces: []
    },
    %{
      slug: "creep-colony",
      name: "Creep Colony",
      name_ko: "크립 콜로니",
      race: "zerg",
      minerals: 75,
      gas: 0,
      hp: 400,
      description:
        "Base defensive structure that morphs into either a Sunken Colony (ground defense, 40 damage) " <>
          "or Spore Colony (anti-air defense and detection, 15 damage). Must be built on creep. " <>
          "Sunken Colonies require a Spawning Pool; Spore Colonies require an Evolution Chamber.",
      description_ko:
        "선큰 콜로니(지상 방어, 40 피해) 또는 스포어 콜로니(대공 방어 및 탐지, 15 피해)로 " <>
          "변태하는 기본 방어 건물이다. 점막 위에 건설해야 한다. " <>
          "선큰 콜로니는 스포닝 풀이, 스포어 콜로니는 에볼루션 챔버가 필요하다.",
      produces: []
    },
    %{
      slug: "extractor",
      name: "Extractor",
      name_ko: "익스트랙터",
      race: "zerg",
      minerals: 50,
      gas: 0,
      hp: 750,
      description:
        "Built on a vespene geyser to enable gas harvesting. Like all Zerg buildings, building an " <>
          "Extractor consumes the Drone. The 'Extractor trick' is a well-known technique where a " <>
          "player builds then cancels an Extractor to temporarily exceed the supply cap.",
      description_ko:
        "베스핀 간헐천 위에 건설하여 가스 채취를 가능하게 한다. 모든 저그 건물과 마찬가지로 " <>
          "익스트랙터를 건설하면 드론이 소멸한다. '익스트랙터 트릭'은 익스트랙터를 짓다가 " <>
          "취소하여 일시적으로 보급 상한을 초과하는 잘 알려진 기술이다.",
      produces: []
    }
  ]

  def buildings, do: @buildings
  def building(slug), do: Enum.find(@buildings, &(&1.slug == slug))
  def buildings_for_race(race_slug), do: Enum.filter(@buildings, &(&1.race == race_slug))

  # ---------------------------------------------------------------------------
  # Abilities
  # ---------------------------------------------------------------------------

  @abilities [
    # -- Terran --
    %{
      slug: "stim-pack",
      name: "Stim Pack",
      name_ko: "스팀팩",
      race: "terran",
      caster: "marine",
      energy: 0,
      hp_cost: 10,
      description:
        "Increases the attack speed and movement speed of Marines and Firebats for a short " <>
          "duration, at the cost of 10 HP. Stim Pack is one of the most important Terran upgrades — " <>
          "stimmed marines have dramatically higher DPS and can kite effectively. Researched at the Academy.",
      description_ko:
        "체력 10을 소모하는 대신 마린과 파이어뱃의 공격 속도와 이동 속도를 짧은 시간 동안 " <>
          "증가시킨다. 스팀팩은 테란의 가장 중요한 업그레이드 중 하나로, " <>
          "스팀 마린은 DPS가 극적으로 높아지고 효과적인 카이팅이 가능하다. 아카데미에서 연구한다."
    },
    %{
      slug: "siege-mode",
      name: "Siege Mode",
      name_ko: "시즈 모드",
      race: "terran",
      caster: "siege-tank",
      energy: 0,
      description:
        "Transforms the Siege Tank into a stationary artillery platform. In Siege Mode, the tank's " <>
          "damage increases from 30 to 70 explosive splash damage with 12 range, but it cannot move or " <>
          "attack units adjacent to it. The cornerstone of Terran positional play. Researched at the Machine Shop.",
      description_ko:
        "시즈 탱크를 고정 포병 플랫폼으로 변환한다. 시즈 모드에서 피해가 30에서 70 폭발형 범위 피해로 " <>
          "증가하며 사거리 12가 되지만, 이동하거나 인접한 유닛을 공격할 수 없다. " <>
          "테란 진지전의 초석이다. 머신 샵에서 연구한다."
    },
    %{
      slug: "spider-mines",
      name: "Spider Mines",
      name_ko: "스파이더 마인",
      race: "terran",
      caster: "vulture",
      energy: 0,
      description:
        "Vultures can plant up to 3 Spider Mines (burrowed explosive drones) that detonate when " <>
          "enemy ground units approach, dealing 125 splash damage. Spider Mines are excellent for map " <>
          "control, denying expansions, and protecting flanks. Researched at the Machine Shop.",
      description_ko:
        "벌처가 최대 3개의 스파이더 마인(매설형 폭발 드론)을 설치할 수 있으며, " <>
          "적 지상 유닛이 접근하면 폭발하여 125의 범위 피해를 입힌다. " <>
          "맵 컨트롤, 확장 저지, 측면 방어에 탁월하다. 머신 샵에서 연구한다."
    },
    %{
      slug: "lockdown",
      name: "Lockdown",
      name_ko: "락다운",
      race: "terran",
      caster: "ghost",
      energy: 100,
      description:
        "Disables a target mechanical unit for 130 frames (~8.5 seconds), preventing it from " <>
          "moving, attacking, or using abilities. Extremely effective against expensive units like " <>
          "Battlecruisers, Carriers, and Siege Tanks. Researched at the Covert Ops.",
      description_ko:
        "대상 기계 유닛을 130프레임(약 8.5초) 동안 무력화하여 이동, 공격, 능력 사용을 차단한다. " <>
          "배틀크루저, 캐리어, 시즈 탱크 같은 고가 유닛에 극도로 효과적이다. " <>
          "커버트 옵스에서 연구한다."
    },
    %{
      slug: "nuclear-strike",
      name: "Nuclear Strike",
      name_ko: "핵 공격",
      race: "terran",
      caster: "ghost",
      energy: 0,
      description:
        "The Ghost designates a target location for a nuclear missile, dealing 500 damage (or 2/3 " <>
          "of a unit's max HP, whichever is greater) in a large area. The Ghost must remain stationary " <>
          "and alive during the targeting sequence. Requires a Nuclear Silo with an armed nuke.",
      description_ko:
        "고스트가 핵 미사일의 목표 지점을 지정하여, 넓은 범위에 500 피해(또는 유닛 최대 체력의 2/3 중 " <>
          "더 큰 값)를 입힌다. 고스트는 조준 시퀀스 동안 정지 상태를 유지하며 살아있어야 한다. " <>
          "핵탄두가 장전된 뉴클리어 사일로가 필요하다."
    },
    %{
      slug: "cloaking-field",
      name: "Cloaking Field",
      name_ko: "클로킹",
      race: "terran",
      caster: "ghost",
      energy: 25,
      description:
        "Renders the Ghost invisible to units without detection. Cloaking drains energy over time — " <>
          "0.9 energy per frame. Cloaked Ghosts are used for scouting and setting up Nuclear Strikes " <>
          "or Lockdowns. Available to Wraiths as well. Researched at the Covert Ops.",
      description_ko:
        "고스트를 탐지기 없는 유닛에게 보이지 않게 한다. 클로킹은 시간이 지나며 에너지를 소모한다 — " <>
          "프레임당 0.9 에너지. 클로킹된 고스트는 정찰과 핵 공격 또는 락다운 준비에 사용된다. " <>
          "레이스에서도 사용 가능하다. 커버트 옵스에서 연구한다."
    },
    %{
      slug: "defensive-matrix",
      name: "Defensive Matrix",
      name_ko: "디펜시브 매트릭스",
      race: "terran",
      caster: "science-vessel",
      energy: 100,
      description:
        "Creates a protective shield on a target unit that absorbs up to 250 damage. The matrix " <>
          "lasts until the damage is absorbed or the duration expires. Useful for protecting key " <>
          "units during engagements or keeping a damaged unit alive during a retreat.",
      description_ko:
        "대상 유닛에 최대 250 피해를 흡수하는 보호 방벽을 생성한다. 매트릭스는 피해가 흡수되거나 " <>
          "지속 시간이 만료되면 사라진다. 교전 중 핵심 유닛을 보호하거나 " <>
          "후퇴 중 손상된 유닛을 살리는 데 유용하다."
    },
    %{
      slug: "emp-shockwave",
      name: "EMP Shockwave",
      name_ko: "EMP 충격파",
      race: "terran",
      caster: "science-vessel",
      energy: 100,
      description:
        "Releases an electromagnetic pulse that drains all energy and shields from units in the " <>
          "target area. Devastating against Protoss (removes shields) and spellcasters (removes energy). " <>
          "One of the most impactful abilities in TvP. Researched at the Science Facility.",
      description_ko:
        "전자기 펄스를 방출하여 대상 범위 내 유닛의 에너지와 보호막을 모두 소진시킨다. " <>
          "프로토스(보호막 제거)와 시전 유닛(에너지 제거)에 치명적이다. " <>
          "TvP에서 가장 영향력 있는 능력 중 하나이다. 사이언스 퍼실리티에서 연구한다."
    },
    %{
      slug: "irradiate",
      name: "Irradiate",
      name_ko: "이래디에이트",
      race: "terran",
      caster: "science-vessel",
      energy: 75,
      description:
        "Exposes a target unit to radiation, dealing 250 damage over time to it and nearby " <>
          "biological units. Does not affect mechanical units. Extremely effective against Overlords, " <>
          "Mutalisks, and groups of biological units. Researched at the Science Facility.",
      description_ko:
        "대상 유닛을 방사능에 노출시켜, 해당 유닛과 주변 생체 유닛에 시간에 걸쳐 250 피해를 입힌다. " <>
          "기계 유닛에는 영향을 미치지 않는다. 오버로드, 뮤탈리스크, 생체 유닛 무리에 " <>
          "극도로 효과적이다. 사이언스 퍼실리티에서 연구한다."
    },
    %{
      slug: "yamato-cannon",
      name: "Yamato Cannon",
      name_ko: "야마토 캐논",
      race: "terran",
      caster: "battlecruiser",
      energy: 150,
      description:
        "Fires a concentrated plasma blast dealing 260 damage to a single target. The Yamato Cannon " <>
          "has 10 range and can destroy most units and structures in one or two shots. Essential for " <>
          "Battlecruiser-based strategies. Researched at the Physics Lab.",
      description_ko:
        "집중 플라즈마 폭발을 발사하여 단일 대상에 260 피해를 입힌다. 야마토 캐논은 사거리 10으로 " <>
          "대부분의 유닛과 건물을 한두 발로 파괴할 수 있다. 배틀크루저 기반 전략에 필수적이다. " <>
          "피직스 랩에서 연구한다."
    },
    %{
      slug: "restoration",
      name: "Restoration",
      name_ko: "레스토레이션",
      race: "terran",
      caster: "medic",
      energy: 50,
      description:
        "Removes all negative status effects from a target unit, including Plague, Ensnare, " <>
          "Irradiate, Lockdown, Optical Flare, Parasite, and Acid Spores. A versatile counter to " <>
          "many opponent abilities. Researched at the Academy.",
      description_ko:
        "대상 유닛의 모든 부정적 상태 효과를 제거한다: 플레이그, 인스네어, 이래디에이트, " <>
          "락다운, 옵티컬 플레어, 패러사이트, 산성 포자 등. 다양한 상대 능력에 대한 " <>
          "범용적인 대응 수단이다. 아카데미에서 연구한다."
    },
    %{
      slug: "optical-flare",
      name: "Optical Flare",
      name_ko: "옵티컬 플레어",
      race: "terran",
      caster: "medic",
      energy: 75,
      description:
        "Permanently reduces a target unit's sight range to 1. Most effective against detector " <>
          "units like Overlords and Observers, effectively blinding them. Researched at the Academy.",
      description_ko:
        "대상 유닛의 시야 범위를 영구적으로 1로 줄인다. 오버로드나 옵저버 같은 탐지 유닛에 " <>
          "가장 효과적으로, 사실상 시야를 빼앗는다. 아카데미에서 연구한다."
    },

    # -- Protoss --
    %{
      slug: "psionic-storm",
      name: "Psionic Storm",
      name_ko: "사이오닉 스톰",
      race: "protoss",
      caster: "high-templar",
      energy: 75,
      description:
        "Unleashes a devastating psionic energy storm in the target area, dealing 112 damage over " <>
          "about 3 seconds to all units caught within it. Storms do not stack — multiple storms on the " <>
          "same area do not increase damage. One of the most powerful and iconic abilities in the game. " <>
          "Researched at the Templar Archives.",
      description_ko:
        "대상 지역에 파괴적인 사이오닉 에너지 폭풍을 일으켜, 범위 내 모든 유닛에 약 3초간 " <>
          "112의 피해를 입힌다. 스톰은 중첩되지 않는다 — 같은 지역에 여러 스톰을 겹쳐도 피해가 증가하지 않는다. " <>
          "게임 내 가장 강력하고 상징적인 능력 중 하나이다. 템플러 아카이브에서 연구한다."
    },
    %{
      slug: "hallucination",
      name: "Hallucination",
      name_ko: "할루시네이션",
      race: "protoss",
      caster: "high-templar",
      energy: 100,
      description:
        "Creates two illusory copies of a target friendly unit. Hallucinations look identical to real " <>
          "units but deal no damage and take double damage. Used for scouting, confusing opponents about " <>
          "army composition, and absorbing fire. Researched at the Templar Archives.",
      description_ko:
        "대상 아군 유닛의 환상 복제본 두 개를 생성한다. 환상은 실제 유닛과 동일하게 보이지만 " <>
          "피해를 입히지 못하고 두 배의 피해를 받는다. 정찰, 군대 조합에 대한 혼란 유도, " <>
          "적의 공격 흡수에 사용된다. 템플러 아카이브에서 연구한다."
    },
    %{
      slug: "mind-control",
      name: "Mind Control",
      name_ko: "마인드 컨트롤",
      race: "protoss",
      caster: "dark-archon",
      energy: 150,
      description:
        "Permanently takes control of a target enemy unit. The Dark Archon's shields are reduced to " <>
          "0 upon casting. Mind Control can steal workers (enabling multi-race production), detectors, " <>
          "or expensive units. One of the rarest but most dramatic abilities in competitive play. " <>
          "Researched at the Templar Archives.",
      description_ko:
        "대상 적 유닛을 영구적으로 빼앗는다. 시전 시 다크 아콘의 보호막이 0으로 감소한다. " <>
          "마인드 컨트롤로 일꾼(다중 종족 생산 가능), 탐지기, 또는 고가 유닛을 빼앗을 수 있다. " <>
          "대회에서 가장 드물지만 가장 극적인 능력 중 하나이다. 템플러 아카이브에서 연구한다."
    },
    %{
      slug: "maelstrom",
      name: "Maelstrom",
      name_ko: "메일스트롬",
      race: "protoss",
      caster: "dark-archon",
      energy: 100,
      description:
        "Freezes all biological units in the target area for about 3 seconds, preventing movement, " <>
          "attacking, and ability use. Does not affect mechanical or robotic units. Extremely powerful " <>
          "against Zerg armies. Researched at the Templar Archives.",
      description_ko:
        "대상 범위 내 모든 생체 유닛을 약 3초간 동결시켜 이동, 공격, 능력 사용을 차단한다. " <>
          "기계 또는 로봇 유닛에는 영향을 미치지 않는다. 저그 군대에 극도로 강력하다. " <>
          "템플러 아카이브에서 연구한다."
    },
    %{
      slug: "feedback",
      name: "Feedback",
      name_ko: "피드백",
      race: "protoss",
      caster: "dark-archon",
      energy: 50,
      description:
        "Drains all remaining energy from a target unit and deals damage equal to the energy " <>
          "drained. Can instantly kill spellcasters with full energy. No research required — " <>
          "available as soon as the Dark Archon is created.",
      description_ko:
        "대상 유닛의 남은 에너지를 모두 소진시키고 소진된 에너지만큼 피해를 입힌다. " <>
          "에너지가 가득 찬 시전 유닛을 즉사시킬 수 있다. 연구 불필요 — " <>
          "다크 아콘이 생성되면 바로 사용 가능하다."
    },
    %{
      slug: "disruption-web",
      name: "Disruption Web",
      name_ko: "디스럽션 웹",
      race: "protoss",
      caster: "corsair",
      energy: 125,
      description:
        "Projects an energy web onto the ground that prevents any ground unit or building beneath " <>
          "it from attacking. Affected units can still move out of the area. Devastating for disabling " <>
          "static defenses like Sunken Colonies or Missile Turrets. Researched at the Fleet Beacon.",
      description_ko:
        "지면에 에너지 그물을 투사하여 그 아래의 모든 지상 유닛과 건물의 공격을 차단한다. " <>
          "영향받은 유닛은 범위 밖으로 이동할 수는 있다. 선큰 콜로니나 미사일 터렛 같은 " <>
          "고정 방어 시설을 무력화하는 데 치명적이다. 플릿 비콘에서 연구한다."
    },
    %{
      slug: "recall",
      name: "Recall",
      name_ko: "리콜",
      race: "protoss",
      caster: "arbiter",
      energy: 150,
      description:
        "Instantly teleports all friendly units in a target area to the Arbiter's location. " <>
          "Enables surprise attacks by warping an army across the map. One of the most powerful " <>
          "strategic abilities in the game, enabling instant multi-pronged assaults. " <>
          "Researched at the Arbiter Tribunal.",
      description_ko:
        "대상 범위 내 모든 아군 유닛을 아비터의 위치로 즉시 순간이동시킨다. " <>
          "군대를 맵 반대편으로 워프하여 기습 공격을 가능하게 한다. " <>
          "게임 내 가장 강력한 전략적 능력 중 하나로, 즉각적인 다방면 공습을 가능하게 한다. " <>
          "아비터 트리뷰널에서 연구한다."
    },
    %{
      slug: "stasis-field",
      name: "Stasis Field",
      name_ko: "스테이시스 필드",
      race: "protoss",
      caster: "arbiter",
      energy: 100,
      description:
        "Freezes all units (friend and foe) in the target area in time, making them invulnerable " <>
          "but unable to move, attack, or be targeted. Lasts about 40 seconds. Used to temporarily " <>
          "remove part of an enemy army from a fight. Researched at the Arbiter Tribunal.",
      description_ko:
        "대상 범위 내 모든 유닛(아군과 적군 모두)을 시간 속에 동결시켜 무적 상태로 만들지만 " <>
          "이동, 공격, 대상 지정이 불가능해진다. 약 40초간 지속된다. 적 군대의 일부를 " <>
          "전투에서 일시적으로 제거하는 데 사용된다. 아비터 트리뷰널에서 연구한다."
    },

    # -- Zerg --
    %{
      slug: "burrow",
      name: "Burrow",
      name_ko: "버로우",
      race: "zerg",
      caster: "zergling",
      energy: 0,
      description:
        "Allows most Zerg ground units to burrow underground, becoming invisible to units without " <>
          "detection. Burrowed units cannot move or attack (except Lurkers). Used for ambushes, hiding " <>
          "units, and dodging attacks. Researched at the Hatchery/Lair/Hive.",
      description_ko:
        "대부분의 저그 지상 유닛이 땅속으로 파고들어 탐지기 없는 유닛에게 보이지 않게 한다. " <>
          "버로우 상태의 유닛은 이동하거나 공격할 수 없다(러커 제외). 매복, 유닛 은닉, " <>
          "공격 회피에 사용된다. 해처리/레어/하이브에서 연구한다."
    },
    %{
      slug: "dark-swarm",
      name: "Dark Swarm",
      name_ko: "다크 스웜",
      race: "zerg",
      caster: "defiler",
      energy: 100,
      description:
        "Creates a dark cloud that blocks all ranged attacks against ground units underneath it. " <>
          "Units inside Dark Swarm can still attack normally, and melee units are unaffected. " <>
          "This is arguably the most powerful Zerg ability — it completely negates Marine, Dragoon, " <>
          "and Hydralisk fire. Researched at the Defiler Mound.",
      description_ko:
        "어두운 구름을 생성하여 그 아래 지상 유닛에 대한 모든 원거리 공격을 차단한다. " <>
          "다크 스웜 안의 유닛은 정상적으로 공격할 수 있으며, 근접 유닛은 영향을 받지 않는다. " <>
          "저그 최강의 능력이라 할 수 있다 — 마린, 드라군, 히드라리스크의 사격을 완전히 무력화한다. " <>
          "디파일러 마운드에서 연구한다."
    },
    %{
      slug: "plague",
      name: "Plague",
      name_ko: "플레이그",
      race: "zerg",
      caster: "defiler",
      energy: 150,
      description:
        "Infects all units in the target area with a disease that deals 295 damage over time. " <>
          "Plague cannot kill units — it reduces HP to a minimum of 1. Devastating for softening " <>
          "up armies before engagement and stripping shields from Protoss units. Researched at the Defiler Mound.",
      description_ko:
        "대상 범위 내 모든 유닛을 시간에 걸쳐 295 피해를 입히는 질병에 감염시킨다. " <>
          "플레이그는 유닛을 죽일 수 없다 — 체력을 최소 1까지만 감소시킨다. " <>
          "교전 전 군대를 약화시키고 프로토스 유닛의 보호막을 벗기는 데 치명적이다. " <>
          "디파일러 마운드에서 연구한다."
    },
    %{
      slug: "consume",
      name: "Consume",
      name_ko: "컨슘",
      race: "zerg",
      caster: "defiler",
      energy: 0,
      description:
        "Instantly kills a friendly Zerg unit to restore 50 energy to the Defiler. Essential for " <>
          "sustaining Dark Swarm and Plague usage in extended engagements. Zerglings are the typical " <>
          "sacrifice due to their low cost. Researched at the Defiler Mound.",
      description_ko:
        "아군 저그 유닛을 즉시 죽여 디파일러의 에너지를 50 회복한다. " <>
          "장기 교전에서 다크 스웜과 플레이그의 지속적인 사용에 필수적이다. " <>
          "저렴한 저글링이 일반적인 제물로 사용된다. 디파일러 마운드에서 연구한다."
    },
    %{
      slug: "spawn-broodling",
      name: "Spawn Broodling",
      name_ko: "스폰 브루들링",
      race: "zerg",
      caster: "queen",
      energy: 150,
      description:
        "Instantly kills a target non-robotic ground unit and spawns two Broodlings in its place. " <>
          "Can instantly destroy high-value targets like Siege Tanks and Ultralisks. Broodlings are " <>
          "temporary units that die after a short time. Researched at the Queen's Nest.",
      description_ko:
        "대상 비로봇 지상 유닛을 즉사시키고 그 자리에 두 마리의 브루들링을 생성한다. " <>
          "시즈 탱크나 울트라리스크 같은 고가치 대상을 즉시 제거할 수 있다. " <>
          "브루들링은 짧은 시간 후 죽는 임시 유닛이다. 퀸즈 네스트에서 연구한다."
    },
    %{
      slug: "ensnare",
      name: "Ensnare",
      name_ko: "인스네어",
      race: "zerg",
      caster: "queen",
      energy: 75,
      description:
        "Slows all units in the target area and reveals cloaked units. Ensnared units have " <>
          "reduced movement and attack speed. Useful for slowing enemy armies before engagement " <>
          "and countering cloaked units like Dark Templar or Wraiths. Researched at the Queen's Nest.",
      description_ko:
        "대상 범위 내 모든 유닛을 감속시키고 은폐 유닛을 드러낸다. 인스네어에 걸린 유닛은 " <>
          "이동 속도와 공격 속도가 감소한다. 교전 전 적군을 감속시키거나 " <>
          "다크 템플러나 레이스 같은 은폐 유닛에 대응하는 데 유용하다. 퀸즈 네스트에서 연구한다."
    },
    %{
      slug: "parasite",
      name: "Parasite",
      name_ko: "패러사이트",
      race: "zerg",
      caster: "queen",
      energy: 75,
      description:
        "Attaches a parasitic organism to a target unit, permanently sharing its vision with " <>
          "the Zerg player. The affected unit's owner may not even realize their unit is parasited. " <>
          "Useful for scouting and tracking army movements. Cannot be removed except by Restoration.",
      description_ko:
        "대상 유닛에 기생 생물체를 부착하여 저그 선수에게 영구적으로 시야를 공유한다. " <>
          "영향받은 유닛의 소유자는 자신의 유닛이 감염된 것을 인지하지 못할 수 있다. " <>
          "정찰과 군대 이동 추적에 유용하다. 레스토레이션으로만 제거할 수 있다."
    }
  ]

  def abilities, do: @abilities
  def ability(slug), do: Enum.find(@abilities, &(&1.slug == slug))
  def abilities_for_race(race_slug), do: Enum.filter(@abilities, &(&1.race == race_slug))

  def abilities_for_unit(unit_slug) do
    Enum.filter(@abilities, &(&1.caster == unit_slug))
  end

  # ---------------------------------------------------------------------------
  # Maps
  # ---------------------------------------------------------------------------

  @maps [
    %{
      slug: "fighting-spirit",
      name: "Fighting Spirit",
      name_ko: "Fighting Spirit",
      dimensions: "128x128",
      tileset: "Jungle World",
      players: 4,
      spawn_positions: "1, 5, 7, 11",
      era: "2008-present",
      description:
        "One of the most played maps in BW history. Fighting Spirit is a 4-player jungle map " <>
          "with a relatively standard layout — natural expansions with narrow ramps, a central open " <>
          "area, and multiple attack paths. Its balanced design has made it a tournament staple for " <>
          "over a decade. The map rewards both aggressive and defensive play styles equally.",
      description_ko:
        "브루드워 역사상 가장 많이 플레이된 맵 중 하나이다. 파이팅 스피릿은 비교적 표준적인 " <>
          "레이아웃의 4인용 정글 맵으로, 좁은 언덕길의 앞마당, 중앙 개활지, 다양한 공격 경로를 갖추고 있다. " <>
          "균형 잡힌 디자인 덕분에 10년 이상 대회의 단골 맵으로 자리잡았다. " <>
          "공격적인 플레이와 수비적인 플레이를 동등하게 보상하는 맵이다."
    },
    %{
      slug: "circuit-breaker",
      name: "Circuit Breaker",
      name_ko: "Circuit Breaker",
      dimensions: "128x128",
      tileset: "Space Platform",
      players: 4,
      spawn_positions: "1, 5, 7, 11",
      era: "2010-present",
      description:
        "A 4-player space platform map created by Earthattack (김응서). Circuit Breaker features " <>
          "a distinctive layout with cliffed natural expansions and multiple pathways. The space " <>
          "platform tileset gives it a unique visual identity. Widely used in ASL and other modern " <>
          "tournaments.",
      description_ko:
        "Earthattack(김응서)이 제작한 4인용 우주 플랫폼 맵이다. 서킷 브레이커는 절벽으로 된 " <>
          "앞마당과 다양한 이동 경로가 특징인 독특한 레이아웃을 갖추고 있다. " <>
          "우주 플랫폼 타일셋이 독특한 시각적 정체성을 부여한다. " <>
          "ASL 및 기타 현대 대회에서 널리 사용된다."
    },
    %{
      slug: "python",
      name: "Python",
      name_ko: "Python",
      dimensions: "128x128",
      tileset: "Jungle World",
      players: 4,
      spawn_positions: "1, 2, 7, 8",
      era: "2007-2012",
      description:
        "A legendary 4-player jungle map with rotational symmetry and a central plateau. Python " <>
          "was a cornerstone of competitive BW during the golden age of Korean pro leagues. Its " <>
          "large main bases, ramp-protected naturals, and open center allow for diverse strategies. " <>
          "The 1.3 revision is the most commonly played version.",
      description_ko:
        "회전 대칭과 중앙 고지대를 가진 전설적인 4인용 정글 맵이다. 파이썬은 " <>
          "한국 프로리그 황금기의 대회 핵심 맵이었다. 넓은 본진, 언덕으로 보호되는 앞마당, " <>
          "개방된 중앙이 다양한 전략을 허용한다. 1.3 버전이 가장 많이 플레이된 버전이다."
    },
    %{
      slug: "polypoid",
      name: "Polypoid",
      name_ko: "Polypoid",
      dimensions: "128x128",
      tileset: "Jungle World",
      players: 4,
      spawn_positions: "2, 5, 7, 10",
      era: "2022-present",
      description:
        "A modern 4-player jungle map featured in recent ASL seasons. Polypoid has rotational " <>
          "symmetry with naturals positioned at varying distances, creating interesting strategic " <>
          "decisions about expansion timing and attack angles. One of the key maps in the current " <>
          "competitive map pool.",
      description_ko:
        "최근 ASL 시즌에 등장한 현대적인 4인용 정글 맵이다. 폴리포이드는 회전 대칭이며 " <>
          "앞마당이 다양한 거리에 위치하여 확장 타이밍과 공격 각도에 대한 " <>
          "흥미로운 전략적 결정을 만들어낸다. 현재 대회 맵풀의 핵심 맵 중 하나이다."
    },
    %{
      slug: "sylphid",
      name: "Sylphid",
      name_ko: "Sylphid",
      dimensions: "128x128",
      tileset: "Jungle World",
      players: 3,
      spawn_positions: "4, 8, 12",
      era: "2020-present",
      description:
        "A 3-player jungle map with a circular layout. The three spawn positions sit on a circle " <>
          "centered on the map, with the center area serving as an intensive battleground. The lack " <>
          "of resources in the center forces players to expand outward. Featured in modern ASL seasons.",
      description_ko:
        "원형 레이아웃의 3인용 정글 맵이다. 세 시작 위치가 맵 중앙을 기준으로 원형으로 배치되어 있으며, " <>
          "중앙 지역이 치열한 전투 지대 역할을 한다. 중앙에 자원이 없어 " <>
          "선수들은 외곽으로 확장해야 한다. 현대 ASL 시즌에 등장했다."
    },
    %{
      slug: "aztec",
      name: "Aztec",
      name_ko: "Aztec",
      dimensions: "128x128",
      tileset: "Jungle World",
      players: 3,
      spawn_positions: "5, 8, 12",
      era: "2019-present",
      description:
        "A 3-player jungle map with distinctive terrain features. Aztec's asymmetric spawn positions " <>
          "create unique matchup dynamics depending on starting locations. The map has become a " <>
          "staple in modern ASL and BSL tournaments, known for producing exciting games.",
      description_ko:
        "독특한 지형 특징을 가진 3인용 정글 맵이다. 아즈텍의 비대칭 시작 위치는 " <>
          "시작 지점에 따라 독특한 매치업 역학을 만들어낸다. 현대 ASL과 BSL 대회의 " <>
          "단골 맵이 되었으며, 흥미진진한 게임을 만들어내는 것으로 유명하다."
    },
    %{
      slug: "butter",
      name: "Butter",
      name_ko: "Butter",
      dimensions: "112x128",
      tileset: "Desert",
      players: 2,
      spawn_positions: "1, 5",
      era: "2022-present",
      description:
        "A 2-player desert map with a vertical layout. Butter features a straightforward path " <>
          "between the two bases with expansion opportunities on the sides. The desert tileset gives " <>
          "it a distinct appearance. As a 2-player map, it eliminates spawn randomness, making it " <>
          "popular for deciding games in tournament sets.",
      description_ko:
        "세로 레이아웃의 2인용 사막 맵이다. 버터는 두 기지 사이에 직선적인 경로를 갖추고 " <>
          "양쪽에 확장 기회가 있다. 사막 타일셋이 독특한 외관을 부여한다. " <>
          "2인용 맵으로서 스폰 랜덤성을 제거하여, " <>
          "대회 세트에서 결정전 맵으로 인기가 높다."
    },
    %{
      slug: "heartbreak-ridge",
      name: "Heartbreak Ridge",
      name_ko: "Heartbreak Ridge",
      dimensions: "128x96",
      tileset: "Jungle World",
      players: 2,
      spawn_positions: "4, 10",
      era: "2008-present",
      description:
        "A classic 2-player jungle map with a horizontal layout. Heartbreak Ridge is one of the " <>
          "longest-running competitive maps in BW, known for its relatively short rush distance and " <>
          "cliffable natural expansion. The map favors aggressive play and has produced countless " <>
          "memorable tournament games.",
      description_ko:
        "가로 레이아웃의 클래식 2인용 정글 맵이다. 하트브레이크 리지는 BW에서 가장 오래 사용된 " <>
          "대회 맵 중 하나로, 비교적 짧은 러시 거리와 절벽 공격이 가능한 앞마당으로 유명하다. " <>
          "공격적인 플레이를 선호하며 수많은 명승부를 만들어냈다."
    },
    %{
      slug: "destination",
      name: "Destination",
      name_ko: "Destination",
      dimensions: "128x96",
      tileset: "Badlands",
      players: 2,
      spawn_positions: "5, 11",
      era: "2007-2012",
      description:
        "A 2-player badlands map from the golden era of Korean BW. Destination features a " <>
          "distinctive layout with a mineral-only natural and a gas expansion further from the main. " <>
          "The map was known for producing strategic, macro-oriented games and was a favorite in " <>
          "OSL and MSL tournaments.",
      description_ko:
        "한국 BW 황금기의 2인용 황무지 맵이다. 데스티네이션은 미네랄만 있는 앞마당과 " <>
          "본진에서 더 먼 가스 확장이 있는 독특한 레이아웃이 특징이다. " <>
          "전략적이고 매크로 지향적인 게임을 만들어내는 것으로 유명했으며, " <>
          "OSL과 MSL 대회에서 인기 맵이었다."
    },
    %{
      slug: "la-mancha",
      name: "La Mancha",
      name_ko: "La Mancha",
      dimensions: "128x128",
      tileset: "Desert",
      players: 4,
      spawn_positions: "1, 5, 7, 11",
      era: "2019-present",
      description:
        "A 4-player desert map with a distinctive open center. La Mancha features wide ramps " <>
          "and open terrain that favors mobile armies. The desert tileset and open layout make it " <>
          "particularly interesting for mech vs bio dynamics in TvT and mobile Zerg strategies.",
      description_ko:
        "독특한 개방형 중앙을 가진 4인용 사막 맵이다. 라만차는 넓은 언덕길과 기동력 있는 " <>
          "군대에 유리한 개방 지형이 특징이다. 사막 타일셋과 개방형 레이아웃이 " <>
          "TvT에서의 메카닉 대 바이오 역학과 기동형 저그 전략에 특히 흥미롭다."
    },
    %{
      slug: "benzene",
      name: "Benzene",
      name_ko: "Benzene",
      dimensions: "128x112",
      tileset: "Space Platform",
      players: 2,
      spawn_positions: "1, 7",
      era: "2010-2016",
      description:
        "A 2-player space platform map with a hexagonal ring structure inspired by the benzene " <>
          "molecule. The map features multiple paths between bases, cliffable positions, and " <>
          "interesting high-ground dynamics. Its unique layout creates diverse game types across " <>
          "all matchups.",
      description_ko:
        "벤젠 분자에서 영감을 받은 육각형 고리 구조의 2인용 우주 플랫폼 맵이다. " <>
          "기지 간 다양한 경로, 절벽 공격 가능 위치, 흥미로운 고지대 역학이 특징이다. " <>
          "독특한 레이아웃이 모든 매치업에서 다양한 유형의 게임을 만들어낸다."
    },
    %{
      slug: "lost-temple",
      name: "Lost Temple",
      name_ko: "Lost Temple",
      dimensions: "128x128",
      tileset: "Jungle World",
      players: 4,
      spawn_positions: "12, 2, 6, 8",
      era: "1998-2008",
      description:
        "The original competitive BW map. Lost Temple shipped with StarCraft and was the default " <>
          "competitive map for years. Its island expansion, temple in the center, and simple layout " <>
          "defined early BW strategy. While long retired from competitive play, it remains the most " <>
          "iconic and recognizable map in StarCraft history.",
      description_ko:
        "최초의 경쟁 BW 맵이다. 로스트 템플은 스타크래프트와 함께 출시되었으며, " <>
          "수년간 기본 대회 맵이었다. 섬 확장, 중앙의 사원, 단순한 레이아웃이 " <>
          "초기 BW 전략을 정의했다. 오래전 대회에서 은퇴했지만, " <>
          "스타크래프트 역사상 가장 상징적이고 인지도 높은 맵으로 남아 있다."
    },
    %{
      slug: "blue-storm",
      name: "Blue Storm",
      name_ko: "Blue Storm",
      dimensions: "128x96",
      tileset: "Twilight",
      players: 2,
      spawn_positions: "1, 7",
      era: "2008-2012",
      description:
        "A 2-player twilight map known for its atmospheric visuals and balanced gameplay. Blue Storm " <>
          "features a relatively standard 2-player layout with natural expansions protected by ramps " <>
          "and a contested center area. The twilight tileset gives it a distinctive purple-blue aesthetic.",
      description_ko:
        "분위기 있는 비주얼과 균형 잡힌 게임플레이로 유명한 2인용 황혼 맵이다. " <>
          "블루 스톰은 언덕으로 보호되는 앞마당과 경합 중앙 지역이 있는 비교적 표준적인 " <>
          "2인용 레이아웃을 갖추고 있다. 황혼 타일셋이 독특한 보라-파란 미학을 부여한다."
    },
    %{
      slug: "longinus",
      name: "Longinus",
      name_ko: "Longinus",
      dimensions: "128x128",
      tileset: "Jungle World",
      players: 3,
      spawn_positions: "3, 7, 11",
      era: "2008-2014",
      description:
        "A 3-player jungle map with wide-open spaces and long distances between bases. Longinus " <>
          "was a key tournament map during the later years of the Korean pro leagues, known for " <>
          "producing long, strategic games. The large map size favors economic play and late-game armies.",
      description_ko:
        "넓은 개활지와 기지 간 긴 거리를 가진 3인용 정글 맵이다. 롱기누스는 " <>
          "한국 프로리그 후반기의 핵심 대회 맵으로, 길고 전략적인 게임을 만들어내는 것으로 유명했다. " <>
          "큰 맵 크기가 경제적 운영과 후반 군대를 선호한다."
    },
    %{
      slug: "tau-cross",
      name: "Tau Cross",
      name_ko: "Tau Cross",
      dimensions: "128x128",
      tileset: "Ice",
      players: 3,
      spawn_positions: "1, 5, 9",
      era: "2009-2014",
      description:
        "A 3-player ice map shaped like the Greek letter tau (T). The distinctive layout creates " <>
          "asymmetric spawn dynamics where different positions have different strategic advantages. " <>
          "The ice tileset makes it one of the most visually distinctive competitive maps.",
      description_ko:
        "그리스 문자 타우(T) 형태의 3인용 얼음 맵이다. 독특한 레이아웃이 비대칭 스폰 역학을 만들어 " <>
          "위치마다 다른 전략적 이점을 가진다. 얼음 타일셋이 시각적으로 " <>
          "가장 독특한 대회 맵 중 하나로 만든다."
    },
    %{
      slug: "andromeda",
      name: "Andromeda",
      name_ko: "Andromeda",
      dimensions: "128x128",
      tileset: "Space Platform",
      players: 4,
      spawn_positions: "2, 4, 8, 10",
      era: "2008-2012",
      description:
        "A 4-player space platform map that was a major tournament staple during the golden age " <>
          "of Korean BW. Andromeda features wide main bases, ramp-protected naturals, and a relatively " <>
          "open center. Its balanced design across all matchups made it one of the most respected " <>
          "competitive maps.",
      description_ko:
        "한국 BW 황금기에 주요 대회 단골 맵이었던 4인용 우주 플랫폼 맵이다. " <>
          "안드로메다는 넓은 본진, 언덕으로 보호되는 앞마당, 비교적 개방된 중앙이 특징이다. " <>
          "모든 매치업에서 균형 잡힌 디자인으로 가장 존경받는 대회 맵 중 하나가 되었다."
    },
    %{
      slug: "match-point",
      name: "Match Point",
      name_ko: "Match Point",
      dimensions: "112x128",
      tileset: "Space Platform",
      players: 2,
      spawn_positions: "1, 7",
      era: "2009-2014",
      description:
        "A 2-player space platform map with a vertical layout. Match Point features a central " <>
          "high-ground area and multiple attack paths. The relatively compact design leads to " <>
          "aggressive, action-packed games. Popular in both Korean and international tournaments.",
      description_ko:
        "세로 레이아웃의 2인용 우주 플랫폼 맵이다. 매치 포인트는 중앙 고지대와 다양한 공격 경로가 " <>
          "특징이다. 비교적 컴팩트한 디자인으로 공격적이고 액션이 넘치는 게임이 펼쳐진다. " <>
          "한국과 해외 대회 모두에서 인기가 높았다."
    }
  ]

  def wiki_maps, do: @maps
  def wiki_map(slug), do: Enum.find(@maps, &(&1.slug == slug))
end
