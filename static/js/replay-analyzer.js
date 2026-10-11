// broodwar.live — in-browser replay analyzer.
//
// Parses .rep files with the bw-engine WASM build (static/wasm/, see SOURCE.md)
// entirely on the client: the file is read with FileReader APIs and never sent
// anywhere. The WASM is imported lazily the first time a file is chosen.
//
// Mounts on #replay-analyzer (templates/replays.html). UI strings come from the
// `replay_*` keys in config.toml via #replay-i18n; localized wiki titles from
// #replay-wiki are used to label and link units, buildings and upgrades.

const root = document.getElementById("replay-analyzer")

// Brood War runs at 42 ms per game frame on Fastest (1000 / 42 ≈ 23.81 fps).
// Replay timestamps and the in-game clock both use this rate.
const FPS = 1000 / 42
const MAX_FILE_BYTES = 16 * 1024 * 1024
const BO_PREVIEW_ROWS = 40

// ---------------------------------------------------------------------------
// Game data (IDs follow replay-core/src/gamedata.rs)
// ---------------------------------------------------------------------------

const UNIT_NAMES = {
  0: "Marine", 1: "Ghost", 2: "Vulture", 3: "Goliath", 5: "Siege Tank", 7: "SCV", 8: "Wraith",
  9: "Science Vessel", 11: "Dropship", 12: "Battlecruiser", 13: "Spider Mine", 14: "Nuclear Missile",
  30: "Siege Tank", 32: "Firebat", 34: "Medic", 58: "Valkyrie",
  35: "Larva", 36: "Egg", 37: "Zergling", 38: "Hydralisk", 39: "Ultralisk", 40: "Broodling",
  41: "Drone", 42: "Overlord", 43: "Mutalisk", 44: "Guardian", 45: "Queen", 46: "Defiler",
  47: "Scourge", 50: "Infested Terran", 59: "Cocoon", 62: "Devourer", 97: "Lurker Egg", 103: "Lurker",
  60: "Corsair", 61: "Dark Templar", 63: "Dark Archon", 64: "Probe", 65: "Zealot", 66: "Dragoon",
  67: "High Templar", 68: "Archon", 69: "Shuttle", 70: "Scout", 71: "Arbiter", 72: "Carrier",
  73: "Interceptor", 83: "Reaver", 84: "Observer", 85: "Scarab",
  106: "Command Center", 107: "Comsat Station", 108: "Nuclear Silo", 109: "Supply Depot",
  110: "Refinery", 111: "Barracks", 112: "Academy", 113: "Factory", 114: "Starport",
  115: "Control Tower", 116: "Science Facility", 117: "Covert Ops", 118: "Physics Lab",
  120: "Machine Shop", 122: "Engineering Bay", 123: "Armory", 124: "Missile Turret", 125: "Bunker",
  130: "Infested Command Center", 131: "Hatchery", 132: "Lair", 133: "Hive", 134: "Nydus Canal",
  135: "Hydralisk Den", 136: "Defiler Mound", 137: "Greater Spire", 138: "Queen's Nest",
  139: "Evolution Chamber", 140: "Ultralisk Cavern", 141: "Spire", 142: "Spawning Pool",
  143: "Creep Colony", 144: "Spore Colony", 146: "Sunken Colony", 149: "Extractor",
  154: "Nexus", 155: "Robotics Facility", 156: "Pylon", 157: "Assimilator", 159: "Observatory",
  160: "Gateway", 162: "Photon Cannon", 163: "Citadel of Adun", 164: "Cybernetics Core",
  165: "Templar Archives", 166: "Forge", 167: "Stargate", 169: "Fleet Beacon",
  170: "Arbiter Tribunal", 171: "Robotics Support Bay", 172: "Shield Battery",
}

const TECH_NAMES = {
  0: "Stim Packs", 1: "Lockdown", 2: "EMP Shockwave", 3: "Spider Mines", 4: "Scanner Sweep",
  5: "Tank Siege Mode", 6: "Defensive Matrix", 7: "Irradiate", 8: "Yamato Gun", 9: "Cloaking Field",
  10: "Personnel Cloaking", 11: "Burrowing", 12: "Infestation", 13: "Spawn Broodlings",
  14: "Dark Swarm", 15: "Plague", 16: "Consume", 17: "Ensnare", 18: "Parasite", 19: "Psionic Storm",
  20: "Hallucination", 21: "Recall", 22: "Stasis Field", 23: "Archon Warp", 24: "Restoration",
  25: "Disruption Web", 27: "Mind Control", 28: "Dark Archon Meld", 29: "Feedback",
  30: "Optical Flare", 31: "Maelstrom", 32: "Lurker Aspect", 34: "Healing", 45: "Nuclear Strike",
}

const UPGRADE_NAMES = {
  0: "Infantry Armor", 1: "Vehicle Plating", 2: "Ship Plating", 3: "Zerg Carapace",
  4: "Zerg Flyer Carapace", 5: "Protoss Ground Armor", 6: "Protoss Air Armor", 7: "Infantry Weapons",
  8: "Vehicle Weapons", 9: "Ship Weapons", 10: "Zerg Melee Attacks", 11: "Zerg Missile Attacks",
  12: "Zerg Flyer Attacks", 13: "Protoss Ground Weapons", 14: "Protoss Air Weapons",
  15: "Protoss Plasma Shields", 16: "U-238 Shells", 17: "Ion Thrusters", 19: "Titan Reactor",
  20: "Ocular Implants", 21: "Moebius Reactor", 22: "Apollo Reactor", 23: "Colossus Reactor",
  24: "Ventral Sacs", 25: "Antennae", 26: "Pneumatized Carapace", 27: "Metabolic Boost",
  28: "Adrenal Glands", 29: "Muscular Augments", 30: "Grooved Spines", 31: "Gamete Meiosis",
  32: "Metasynaptic Node", 33: "Singularity Charge", 34: "Leg Enhancements", 35: "Scarab Damage",
  36: "Reaver Capacity", 37: "Gravitic Drive", 38: "Sensor Array", 39: "Gravitic Boosters",
  40: "Khaydarin Amulet", 41: "Apial Sensors", 42: "Gravitic Thrusters", 43: "Carrier Capacity",
  44: "Khaydarin Core", 47: "Argus Jewel", 49: "Argus Talisman", 51: "Caduceus Reactor",
  52: "Chitinous Plating", 53: "Anabolic Synthesis", 54: "Charon Boosters",
}

// Wiki slugs that differ from the slugified English name.
const WIKI_ALIASES = {
  "tech:Stim Packs": "upgrades/stim-pack",
  "tech:Tank Siege Mode": "upgrades/siege-tech",
  "tech:Burrowing": "abilities/burrow",
  "tech:Spawn Broodlings": "abilities/spawn-broodling",
  "upgrade:Zerg Carapace": "upgrades/carapace",
  "upgrade:Zerg Flyer Carapace": "upgrades/flyer-carapace",
  "upgrade:Protoss Ground Armor": "upgrades/ground-armor",
  "upgrade:Protoss Air Armor": "upgrades/air-armor",
  "upgrade:Zerg Melee Attacks": "upgrades/melee-attacks",
  "upgrade:Zerg Missile Attacks": "upgrades/missile-attacks",
  "upgrade:Zerg Flyer Attacks": "upgrades/flyer-attacks",
  "upgrade:Protoss Ground Weapons": "upgrades/ground-weapons",
  "upgrade:Protoss Air Weapons": "upgrades/air-weapons",
  "upgrade:Protoss Plasma Shields": "upgrades/plasma-shields",
}

// Supply cost per production order (whole supply; a Zergling or Scourge
// order hatches a pair for 1). Morphs list the *added* supply.
const SUPPLY = {
  0: 1, 1: 1, 2: 2, 3: 2, 5: 2, 7: 1, 8: 2, 9: 2, 11: 2, 12: 6, 32: 1, 34: 1, 58: 3,
  37: 1, 38: 1, 39: 4, 41: 1, 43: 2, 45: 2, 46: 2, 47: 1, 103: 1,
  60: 2, 61: 2, 64: 1, 65: 2, 66: 2, 67: 2, 69: 2, 70: 3, 71: 4, 72: 6, 83: 4, 84: 1,
}
const WORKERS = new Set([7, 41, 64])
const isWorker = (e) => (e.kind === "Train" || e.kind === "UnitMorph") && WORKERS.has(e.id)
const SUPPLY_BUILDINGS = new Set([109, 156])
const TOWN_HALLS = new Set([106, 131, 154])

// Standard and Remastered player colors (index = header color id).
const PLAYER_COLORS = [
  "#f40404", "#0c48cc", "#2cb494", "#88409c", "#f88c14", "#703014", "#cce0d0", "#fcfc38",
  "#088008", "#fcfc7c", "#ecc4b0", "#4068d4", "#74a47c", "#7290b8", "#00e4fc", "#ffc4e4",
  "#787800", "#d2f53c", "#0000e6", "#f032e6", "#808080", "#3c3c3c",
]

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function readJson(id) {
  try { return JSON.parse(document.getElementById(id)?.textContent || "{}") } catch { return {} }
}

const I18N = readJson("replay-i18n")
const WIKI = readJson("replay-wiki")
const lang = root?.dataset.lang || "en"
const lp = root?.dataset.lp || ""
const locale = lang === "ko" ? "ko-KR" : "en-US"
const nf = new Intl.NumberFormat(locale)

function t(key, vars) {
  let s = I18N["replay_" + key] ?? key
  if (vars) s = s.replace(/\{(\w+)\}/g, (m, k) => (k in vars ? vars[k] : m))
  return s
}

function esc(value) {
  return String(value ?? "").replace(/[&<>"']/g, (c) => ({"&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;"}[c]))
}

// Replay strings can carry BW text color codes (control bytes); drop them.
function clean(s) {
  return String(s ?? "").replace(/[\u0000-\u001f\u007f]/g, "").trim()
}

function variant(v) {
  if (v == null) return ""
  return typeof v === "string" ? v : Object.keys(v)[0]
}

function slugify(s) {
  return s.toLowerCase().replace(/'/g, "").replace(/[^a-z0-9]+/g, "-").replace(/^-+|-+$/g, "")
}

function clock(seconds) {
  const s = Math.max(0, Math.floor(seconds))
  const h = Math.floor(s / 3600)
  const m = Math.floor((s % 3600) / 60)
  const ss = String(s % 60).padStart(2, "0")
  return h ? `${h}:${String(m).padStart(2, "0")}:${ss}` : `${m}:${ss}`
}

const frameSecs = (frame) => frame / FPS

// Resolve a game object to its localized wiki title and link.
function wikiRef(kind, id) {
  let name, candidates
  if (kind === "unit") {
    name = UNIT_NAMES[id]
    if (!name) return {name: t("unknown_unit", {id}), href: null}
    const isBuilding = (id >= 106 && id <= 125) || (id >= 130 && id <= 146) || id === 149 || (id >= 154 && id <= 172)
    candidates = [(isBuilding ? "buildings/" : "units/") + slugify(name)]
  } else if (kind === "tech" || kind === "upgrade") {
    name = (kind === "tech" ? TECH_NAMES : UPGRADE_NAMES)[id]
    if (!name) return {name: t("unknown_unit", {id}), href: null}
    const slug = slugify(name)
    candidates = [WIKI_ALIASES[`${kind}:${name}`], "upgrades/" + slug, "abilities/" + slug].filter(Boolean)
  } else {
    return {name: t("action_fighter"), href: null}
  }
  for (const key of candidates) {
    if (WIKI[key]) return {name: WIKI[key], href: `${lp}/wiki/${key}/`}
  }
  return {name, href: null}
}

function refHtml(ref) {
  return ref.href
    ? `<a href="${esc(ref.href)}" class="hover:text-primary hover:underline underline-offset-2">${esc(ref.name)}</a>`
    : esc(ref.name)
}

function mapRef(rawName) {
  const name = clean(rawName)
  const base = name
    .replace(/\|?\s*iccup\s*\|?/i, "")
    .replace(/^[^a-z0-9]+/i, "")
    .replace(/\s*v?\d+(\.\d+)*[a-z]?\s*$/i, "")
  const key = "maps/" + slugify(base)
  return WIKI[key] ? {name, href: `${lp}/wiki/${key}/`} : {name, href: null}
}

function colorOf(player) {
  const hex = player.custom_color != null
    ? "#" + player.custom_color.toString(16).padStart(6, "0")
    : PLAYER_COLORS[player.color] || null
  const names = t("color_names").split(",")
  const idx = hex ? PLAYER_COLORS.indexOf(hex) : -1
  return {hex, name: idx >= 0 && names[idx] ? names[idx].trim() : hex || "?"}
}

function formatVersion(bytes, extra) {
  if (bytes.length > 12 && bytes[12] === 0x73) return t("version_121")
  if (bytes.length > 28 && bytes[28] === 0x78) return t("version_118")
  return extra?.tags?.length ? t("version_121") : t("version_legacy")
}

// ---------------------------------------------------------------------------
// Analysis on top of the parser output
// ---------------------------------------------------------------------------

function decodeAction(action) {
  const kind = variant(action)
  const id = typeof action === "string" ? null : action[kind]
  switch (kind) {
    case "Build": return {kind, id, ref: wikiRef("unit", id)}
    case "Train": return {kind, id, ref: wikiRef("unit", id)}
    case "UnitMorph": return {kind, id, ref: wikiRef("unit", id)}
    case "BuildingMorph": return {kind, id, ref: wikiRef("unit", id)}
    case "Research": return {kind, id, ref: wikiRef("tech", id)}
    case "Upgrade": return {kind, id, ref: wikiRef("upgrade", id)}
    default: return {kind: "TrainFighter", id: null, ref: wikiRef("fighter")}
  }
}

// Production model used to estimate supply. Replays store orders, not
// results: a player who clicks "Probe" five times queues five probes that
// start one after another, and a Zerg can only morph as many larvae as the
// hatcheries have spawned. Build times are in frames (wiki seconds × 15).
const PRODUCER = {
  7: 106, 0: 111, 32: 111, 34: 111, 1: 111, 2: 113, 5: 113, 3: 113,
  8: 114, 11: 114, 9: 114, 12: 114, 58: 114,
  64: 154, 65: 160, 66: 160, 67: 160, 61: 160, 69: 155, 83: 155, 84: 155,
  70: 167, 60: 167, 72: 167, 71: 167,
}
const BUILD_FRAMES = {
  7: 300, 0: 360, 32: 360, 34: 450, 1: 750, 2: 450, 5: 750, 3: 600,
  8: 900, 11: 750, 9: 1200, 12: 2000, 58: 750,
  64: 300, 65: 600, 66: 750, 67: 750, 61: 750, 69: 900, 83: 1050, 84: 600,
  70: 1200, 60: 600, 72: 2100, 71: 2400,
  106: 1800, 111: 1200, 113: 1200, 114: 1050, 154: 1800, 160: 900, 155: 1200, 167: 1050, 131: 1800,
}
const LARVA_UNITS = new Set([41, 37, 38, 42, 43, 47, 39, 46])
const LARVA_FRAMES = 342
const TECH_REPEAT_FRAMES = 60 * FPS
const QUEUE_SLOTS = 5

// Build order with an estimated supply count when each order was issued.
// Orders that could not have been carried out (queue full, no larva) are
// kept but flagged `dropped`; cancels and deaths are not modelled.
// `selected[i]` is how many units the player had selected when issuing the
// i-th order: one Zerg morph order applies to every selected larva.
function buildOrderFor(entries, race, selected = []) {
  const rows = entries.map((e, i) => ({frame: e.frame, secs: frameSecs(e.frame), count: 1, selected: selected[i] || 1, ...decodeAction(e.action)}))
  const lastTech = new Map()
  const producers = new Map() // building id -> [{ready, free}]
  const addProducer = (id, ready) => {
    if (!producers.has(id)) producers.set(id, [])
    producers.get(id).push({ready, free: ready})
  }
  if (race === "Terran") addProducer(106, 0)
  if (race === "Protoss") addProducer(154, 0)
  let hatcheries = [0]
  let larva = 3, larvaAt = 0
  const starts = [] // [frame, supply delta]

  for (const row of rows) {
    const f = row.frame
    if (row.kind === "Build" || row.kind === "BuildingMorph") {
      if (PRODUCER_BUILDINGS.has(row.id)) addProducer(row.id, f + (BUILD_FRAMES[row.id] || 1200))
      if (row.id === 131 && row.kind === "Build") hatcheries.push(f + BUILD_FRAMES[131])
      if (row.kind === "Build" && race === "Zerg") starts.push([f, -1]) // the Drone becomes the building
      continue
    }
    if (row.kind === "Research" || row.kind === "Upgrade") {
      // Repeated clicks while the research is already running.
      const key = row.kind + row.id
      if (lastTech.has(key) && f - lastTech.get(key) < TECH_REPEAT_FRAMES) row.dropped = true
      else lastTech.set(key, f)
      continue
    }
    if (row.kind !== "Train" && row.kind !== "UnitMorph") continue
    const cost = SUPPLY[row.id] || 0
    if (race === "Zerg" && LARVA_UNITS.has(row.id)) {
      const halls = hatcheries.filter((h) => h <= f).length
      larva = Math.min(3 * halls, larva + ((f - larvaAt) * halls) / LARVA_FRAMES)
      larvaAt = f
      const n = Math.min(row.selected, Math.floor(larva))
      if (n < 1) { row.dropped = true; continue }
      larva -= n
      row.count = n
      starts.push([f, cost * n])
      continue
    }
    const pool = producers.get(PRODUCER[row.id])
    if (!pool) { starts.push([f, cost]); continue }
    const live = pool.filter((p) => p.ready <= f)
    const waiting = starts.filter(([s, , id]) => s > f && PRODUCER[id] === PRODUCER[row.id]).length
    if (!live.length || waiting >= QUEUE_SLOTS * live.length) { row.dropped = true; continue }
    const slot = live.reduce((a, b) => (b.free < a.free ? b : a))
    const begin = Math.max(f, slot.free)
    slot.free = begin + (BUILD_FRAMES[row.id] || 600)
    starts.push([begin, cost, row.id])
  }

  for (const row of rows) {
    let supply = 4
    for (const [s, d] of starts) if (s < row.frame) supply += d
    row.supply = supply
  }
  return rows
}
const PRODUCER_BUILDINGS = new Set(Object.values(PRODUCER))

// Opening label, adapted from replay-core/src/classify.rs (not exported by the
// parser-only WASM). Differences: it reads the first non-worker orders of the
// first four minutes, uses the estimated supply (replay-core counts Train(41)
// drones, but drones are larva morphs, so every pool looked like a 4 pool),
// and "CC First" / "Nexus First" are reachable.
function classifyOpening(bo, race) {
  // replay-core looks at the first 20 orders including workers, which on
  // real replays often ends before the second production building.
  const first = bo.filter((e) => !e.dropped && !isWorker(e) && e.secs < 240).slice(0, 20)
  const buildings = first.filter((e) => e.kind === "Build" || (race === "Zerg" && e.kind === "BuildingMorph")).map((e) => e.id)
  if (!buildings.length) return null
  const count = (id) => buildings.filter((b) => b === id).length
  const has = (id) => buildings.includes(id)
  const idx = (id) => buildings.indexOf(id)
  const r = (name, confidence) => ({name, confidence})

  if (race === "Terran") {
    const rax = count(111), fac = has(113), port = has(114), acad = has(112)
    const firstProd = buildings.find((b) => b !== 109 && b !== 110)
    if (firstProd === 106) return r("CC First", 0.75)
    if (rax >= 1 && fac && port && !acad) return r("1-1-1", 0.85)
    if (rax >= 2 && !fac) return acad ? r("2 Rax Academy", 0.8) : r("2 Rax", 0.8)
    if (rax >= 1 && acad && !fac) return r("Bio", 0.7)
    if (fac && rax === 1) {
      if (port) return r("Mech", 0.75)
      if (has(120)) return r("Factory Expand", 0.7)
      return r("1 Rax FE", 0.6)
    }
    if (has(125) && idx(125) < 4) return r("Bunker Rush", 0.7)
    if (firstProd === 111) return r("Barracks First", 0.5)
    return r(t("opening_unknown"), 0.3)
  }
  if (race === "Zerg") {
    // Opening = pool/hatch timing, then the first tech it heads into.
    // (replay-core labels by tech first and maps pools above 12 supply to
    // "Overpool"; this reads closer to how players name Zerg openings.)
    const pool = idx(142), hatch = idx(131)
    const poolEntry = bo.find((e) => e.kind === "Build" && e.id === 142)
    let name
    if (pool >= 0 && hatch >= 0 && hatch < pool) {
      name = buildings.slice(0, pool).filter((b) => b === 131).length >= 2 ? "3 Hatch Before Pool" : "12 Hatch"
    } else if (pool >= 0) {
      const s = poolEntry ? poolEntry.supply : 4
      name = s <= 5 ? "4/5 Pool" : s <= 9 ? "9 Pool" : s <= 11 ? "Overpool" : "12 Pool"
    } else {
      return r(t("opening_unknown"), 0.3)
    }
    const tech = has(141) && !has(135) ? "Muta" : has(135) ? "Hydra" : has(132) ? "Lair" : ""
    return r(tech ? `${name} → ${tech}` : name, 0.75)
  }
  if (race === "Protoss") {
    const gates = count(160), core = has(164), nexus = count(154)
    if (nexus >= 1 && buildings.find((b) => b !== 156 && b !== 157) === 154) return r("Nexus First", 0.8)
    const forge = idx(166), gate = idx(160)
    if (forge >= 0 && gate >= 0 && forge < gate) return has(162) ? r("Forge FE + Cannon", 0.85) : r("Forge FE", 0.85)
    if (forge >= 0 && gates === 0) return r("Forge FE", 0.75)
    if (has(165) && gates >= 1) return r("DT Rush", 0.8)
    if (gates >= 2) return core ? r("2 Gate Core", 0.8) : r("2 Gate", 0.8)
    if (gates === 1 && core) {
      if (has(167)) return r("1 Gate Stargate", 0.8)
      if (has(155)) return r("1 Gate Robo", 0.8)
      if (has(163)) return r("1 Gate Citadel", 0.75)
      if (nexus >= 1) return r("1 Gate FE", 0.8)
      return r("1 Gate Core", 0.7)
    }
    if (gates === 1) return r("Gateway First", 0.5)
    return r(t("opening_unknown"), 0.3)
  }
  return null
}

// First order of each structure (supply buildings excluded) plus every
// research and upgrade: the player's tech path.
function techPath(bo, race) {
  const seen = new Set()
  let halls = race === "Zerg" || race === "Terran" || race === "Protoss" ? 1 : 0
  const out = []
  for (const e of bo) {
    if (e.dropped) continue
    if (e.kind === "Build" || e.kind === "BuildingMorph") {
      if (TOWN_HALLS.has(e.id) && e.kind === "Build") {
        halls += 1
        out.push({...e, note: t("base_n", {n: halls})})
        continue
      }
      if (SUPPLY_BUILDINGS.has(e.id) || seen.has(e.id)) continue
      seen.add(e.id)
      out.push(e)
    } else if (e.kind === "Research" || e.kind === "Upgrade") {
      out.push(e)
    }
  }
  return out
}

const BO_KINDS = new Set(["Build", "Train", "UnitMorph", "BuildingMorph", "Research", "Upgrade", "TrainFighter"])

// Follow each player's current selection through select and hotkey commands.
function trackSelection(d, kind, cmd) {
  if (kind === "Select") d.sel = [...cmd.Select.unit_tags]
  else if (kind === "SelectAdd") d.sel = [...new Set([...d.sel, ...cmd.SelectAdd.unit_tags])]
  else if (kind === "SelectRemove") d.sel = d.sel.filter((tag) => !cmd.SelectRemove.unit_tags.includes(tag))
  else if (kind === "Hotkey") {
    const {action, group} = cmd.Hotkey
    if (action === "Select") d.sel = [...(d.groups.get(group) || d.sel)]
    else d.groups.set(group, [...d.sel])
  } else if (BO_KINDS.has(kind)) d.boSelection.push(d.sel.length || 1)
}

function isMeaningful(kind) {
  return !["KeepAlive", "Other", "Select", "SelectAdd", "SelectRemove", "Chat", "LeaveGame", "MinimapPing"].includes(kind)
}

// APM / EAPM over a sliding 60 s window, sampled across the game.
function apmSeries(frames, totalFrames) {
  const window = 60 * FPS
  const step = Math.max(10 * FPS, totalFrames / 150)
  const out = []
  for (let f = step; f <= totalFrames + 1; f += step) {
    const from = Math.max(0, f - window)
    const minutes = (f - from) / FPS / 60
    out.push({secs: frameSecs(f), apm: countIn(frames.apm, from, f) / minutes, eapm: countIn(frames.eapm, from, f) / minutes})
  }
  return out
}

function countIn(sorted, from, to) {
  return lowerBound(sorted, to) - lowerBound(sorted, from)
}

function lowerBound(arr, x) {
  let lo = 0, hi = arr.length
  while (lo < hi) {
    const mid = (lo + hi) >> 1
    if (arr[mid] < x) lo = mid + 1
    else hi = mid
  }
  return lo
}

function buildModel(r, bytes, file, parseMs) {
  const h = r.header
  const meta = r.metadata || {}
  const winnerId = meta.result && typeof meta.result === "object" ? meta.result.Winner?.player_id : undefined
  const apmById = new Map((r.player_apm || []).map((a) => [a.player_id, a]))

  // Per-player command digests (computers share player_id 255 and issue none).
  const digest = new Map()
  const chat = []
  const slotName = new Map(h.players.map((p) => [p.slot_id, clean(p.name)]))
  for (const c of r.commands) {
    const kind = variant(c.command)
    let d = digest.get(c.player_id)
    if (!d) digest.set(c.player_id, d = {apm: [], eapm: [], hotkeys: new Set(), sel: [], groups: new Map(), boSelection: []})
    trackSelection(d, kind, c.command)
    if (isMeaningful(kind)) {
      d.apm.push(c.frame)
      if (kind === "Hotkey") {
        const hk = c.command.Hotkey
        d.hotkeys.add(hk.group)
        if (hk.action !== "Select") d.eapm.push(c.frame)
      } else {
        d.eapm.push(c.frame)
      }
    }
    if (kind === "Chat") {
      const msg = clean(c.command.Chat.message)
      if (msg) chat.push({secs: frameSecs(c.frame), who: slotName.get(c.command.Chat.sender_slot) ?? `#${c.player_id}`, msg})
    }
  }

  const humans = new Set(h.players.filter((p) => variant(p.player_type) === "Human").map((p) => p.player_id))
  let series = 0
  const players = h.players.map((p) => {
    const race = variant(p.race)
    const type = variant(p.player_type)
    const isHuman = type === "Human"
    const entries = isHuman ? r.build_order.filter((e) => e.player_id === p.player_id) : []
    const bo = buildOrderFor(entries, race, digest.get(p.player_id)?.boSelection)
    const apm = isHuman ? apmById.get(p.player_id) : null
    const d = isHuman ? digest.get(p.player_id) : null
    const units = new Map()
    for (const e of bo) if (!e.dropped && (e.kind === "Train" || e.kind === "UnitMorph")) units.set(e.id, (units.get(e.id) || 0) + e.count)
    return {
      name: clean(p.name) || "?",
      race,
      raceCode: {Terran: "T", Protoss: "P", Zerg: "Z"}[race] || "?",
      isHuman,
      team: p.team,
      color: colorOf(p),
      apm: apm ? apm.apm : null,
      eapm: apm ? apm.eapm : null,
      winner: winnerId !== undefined && humans.has(winnerId) && p.player_id === winnerId,
      bo,
      opening: isHuman ? classifyOpening(bo, race) : null,
      tech: techPath(bo, race),
      units: [...units.entries()].sort((a, b) => b[1] - a[1]),
      hotkeys: d ? [...d.hotkeys].sort((a, b) => a - b) : [],
      apmSeries: d && d.apm.length ? apmSeries(d, h.frame_count) : null,
      series: d && d.apm.length ? ++series : 0,
    }
  })

  const warnings = r.command_warnings || {}
  return {
    file,
    parseMs,
    players,
    chat,
    map: mapRef(h.map_name),
    matchup: meta.matchup?.code || "",
    is1v1: !!meta.is_1v1,
    durationSecs: frameSecs(h.frame_count),
    startTime: h.start_time ? new Date(h.start_time * 1000) : null,
    gameType: variant(h.game_type),
    speed: variant(h.game_speed),
    version: formatVersion(bytes, r.extra_sections),
    engine: variant(h.engine),
    lobby: clean(h.game_title),
    host: clean(h.host_name),
    mapSize: h.map_width && h.map_height ? `${h.map_width}×${h.map_height}` : "",
    commandCount: r.commands.length,
    warningCount: (warnings.unknown_commands || 0) + (warnings.truncated_commands || 0),
    warnings,
  }
}

// ---------------------------------------------------------------------------
// Rendering
// ---------------------------------------------------------------------------

const RACE_TEXT = {Terran: "text-race-terran", Protoss: "text-race-protoss", Zerg: "text-race-zerg"}
const ACTION_LABEL = {
  Build: "action_build", Train: "action_train", UnitMorph: "action_morph", BuildingMorph: "action_morph",
  Research: "action_research", Upgrade: "action_upgrade", TrainFighter: "action_train",
}

function raceName(race) {
  return {Terran: t("race_terran"), Protoss: t("race_protoss"), Zerg: t("race_zerg")}[race] || t("race_unknown")
}

function gameTypeName(type) {
  const key = "gametype_" + type.toLowerCase()
  return I18N["replay_" + key] ? t(key) : type.replace(/([a-z])([A-Z])/g, "$1 $2")
}

function swatch(color, extra = "") {
  return color.hex
    ? `<span class="inline-block size-3 rounded-sm ring-1 ring-base-content/20 shrink-0 ${extra}" style="background:${esc(color.hex)}" title="${esc(color.name)}" aria-hidden="true"></span>`
    : ""
}

function fact(label, value) {
  if (!value) return ""
  return `<div><dt class="text-[10px] uppercase tracking-wider text-base-content/40">${esc(label)}</dt><dd class="text-sm mt-0.5">${value}</dd></div>`
}

function renderPlayer(p) {
  const hum = p.isHuman
  return `
    <li class="flex flex-wrap items-center gap-x-4 gap-y-2 rounded-lg bg-base-content/[0.03] px-4 py-3">
      <div class="flex items-center gap-2 min-w-0">
        ${swatch(p.color)}
        <span class="font-semibold truncate">${esc(p.name)}</span>
        <span class="sr-only">${esc(t("color"))}: ${esc(p.color.name)}</span>
        ${p.winner ? `<span class="text-[10px] px-1.5 py-0.5 rounded bg-success/15 text-success font-semibold" title="${esc(t("winner_hint"))}">${esc(t("likely_winner"))}</span>` : ""}
        ${!hum ? `<span class="text-[10px] px-1.5 py-0.5 rounded bg-base-content/10 text-base-content/60">${esc(t("computer"))}</span>` : ""}
      </div>
      <span class="text-xs font-bold ${RACE_TEXT[p.race] || ""}">${esc(raceName(p.race))}</span>
      ${p.opening ? `<span class="text-xs text-base-content/60" title="${esc(t("opening_hint", {pct: Math.round(p.opening.confidence * 100)}))}">${esc(t("opening"))}: <span class="text-primary font-medium">${esc(p.opening.name)}</span></span>` : ""}
      ${p.apm != null ? `<span class="ml-auto flex gap-4 font-stats text-xs text-base-content/70">
        <span><abbr title="${esc(t("apm_hint"))}" class="no-underline text-base-content/40">APM</abbr> ${Math.round(p.apm)}</span>
        <span><abbr title="${esc(t("eapm_hint"))}" class="no-underline text-base-content/40">EAPM</abbr> ${Math.round(p.eapm)}</span>
      </span>` : ""}
    </li>`
}

function renderBuildOrder(p, idx) {
  const id = `bo-${idx}`
  return `
    <section class="min-w-0" data-bo="${idx}">
      <div class="flex items-center justify-between gap-2 mb-2">
        <h4 class="text-sm font-semibold flex items-center gap-2 min-w-0">${swatch(p.color)}<span class="truncate">${esc(p.name)}</span>
          <span class="text-xs font-bold ${RACE_TEXT[p.race] || ""}">${esc(p.raceCode)}</span></h4>
        <button type="button" class="btn btn-ghost btn-xs" data-copy="${idx}">${esc(t("copy_bo"))}</button>
      </div>
      <div class="overflow-x-auto rounded-lg border border-base-content/5">
        <table class="table table-xs" id="${id}">
          <thead><tr><th scope="col">${esc(t("col_time"))}</th><th scope="col" title="${esc(t("supply_hint"))}">${esc(t("col_supply"))}</th><th scope="col">${esc(t("col_action"))}</th></tr></thead>
          <tbody></tbody>
        </table>
      </div>
      <button type="button" class="btn btn-ghost btn-xs mt-2 hidden" data-more="${idx}"></button>
    </section>`
}

function boRowsHtml(rows) {
  return rows.map((e) => `
    <tr${e.dropped ? ` class="opacity-40" title="${esc(t("dropped_hint"))}"` : ""}>
      <td class="font-stats text-base-content/50">${clock(e.secs)}</td>
      <td class="font-stats">${e.supply}</td>
      <td><span class="text-base-content/40 mr-1">${esc(t(ACTION_LABEL[e.kind]))}</span>${refHtml(e.ref)}${e.count > 1 ? ` <span class="font-stats text-base-content/50">×${e.count}</span>` : ""}</td>
    </tr>`).join("")
}

function boVisible(p, showWorkers) {
  return showWorkers ? p.bo : p.bo.filter((e) => !isWorker(e))
}

function boText(p, model, showWorkers) {
  const head = `${p.name} (${raceName(p.race)})${p.opening ? " — " + p.opening.name : ""} · ${model.map.name}`
  return [head, ...boVisible(p, showWorkers).filter((e) => !e.dropped).map((e) => `${clock(e.secs).padStart(5)}  ${String(e.supply).padStart(3)}  ${e.ref.name}${e.count > 1 ? " x" + e.count : ""}`)].join("\n")
}

function renderTech(p) {
  if (!p.tech.length) return ""
  return `
    <div class="min-w-0">
      <h4 class="text-sm font-semibold mb-2 flex items-center gap-2">${swatch(p.color)}<span class="truncate">${esc(p.name)}</span></h4>
      <ol class="flex flex-wrap gap-1.5">
        ${p.tech.map((e) => `<li class="text-xs rounded-md bg-base-content/5 px-2 py-1"><span class="font-stats text-base-content/50">${clock(e.secs)}</span> ${refHtml(e.ref)}${e.note ? ` <span class="text-primary/80">(${esc(e.note)})</span>` : ""}</li>`).join("")}
      </ol>
      ${p.units.length ? `<p class="mt-3 text-xs text-base-content/50">${esc(t("units_ordered"))}:</p>
      <ul class="flex flex-wrap gap-1.5 mt-1">${p.units.map(([id, n]) => `<li class="text-xs rounded-md border border-base-content/10 px-2 py-0.5">${refHtml(wikiRef("unit", id))} <span class="font-stats text-base-content/60">×${n}</span></li>`).join("")}</ul>` : ""}
      ${p.hotkeys.length ? `<p class="mt-3 text-xs text-base-content/50">${esc(t("hotkeys"))}: <span class="font-stats text-base-content/70">${p.hotkeys.map((g) => esc(g)).join(" ")}</span></p>` : ""}
    </div>`
}

function renderReplay(model) {
  const humans = model.players.filter((p) => p.isHuman)
  const title = model.is1v1 && humans.length === 2 ? `${esc(humans[0].name)} <span class="text-base-content/30 font-normal">vs</span> ${esc(humans[1].name)}` : refHtml(model.map)
  const date = model.startTime
    ? `<time datetime="${model.startTime.toISOString()}">${esc(model.startTime.toLocaleString(locale, {dateStyle: "medium", timeStyle: "short"}))}</time>`
    : ""
  const charted = model.players.filter((p) => p.apmSeries)
  const boPlayers = model.players.filter((p) => p.bo.length)

  const card = document.createElement("article")
  card.className = "glass-card rounded-box p-5 sm:p-6 animate-fade-up"
  card.innerHTML = `
    <header class="flex items-start gap-3">
      <div class="min-w-0 flex-1">
        <p class="text-xs text-base-content/40 truncate">${esc(model.file.name)}</p>
        <h2 class="text-lg sm:text-xl font-semibold mt-1 flex flex-wrap items-center gap-2">
          ${model.matchup ? `<span class="text-sm font-bold text-primary">${esc(model.matchup)}</span>` : ""}
          <span>${title}</span>
        </h2>
      </div>
      <button type="button" class="btn btn-ghost btn-sm btn-square" data-close aria-label="${esc(t("close"))}">&times;</button>
    </header>

    <dl class="mt-5 grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-4">
      ${fact(t("map"), refHtml(model.map) + (model.mapSize ? ` <span class="text-base-content/40 text-xs">${esc(model.mapSize)}</span>` : ""))}
      ${fact(t("duration"), `<span class="font-stats">${clock(model.durationSecs)}</span>`)}
      ${fact(t("date"), date)}
      ${fact(t("game_type"), esc(gameTypeName(model.gameType)) + (model.speed && model.speed !== "Fastest" ? ` <span class="text-warning text-xs">(${esc(model.speed)})</span>` : ""))}
      ${fact(t("version"), esc(model.version))}
      ${fact(t("lobby"), esc(model.lobby))}
    </dl>

    <h3 class="text-sm font-semibold mt-6 mb-2">${esc(t("players"))}</h3>
    <ul class="flex flex-col gap-2">${model.players.map(renderPlayer).join("")}</ul>
    ${model.players.some((p) => p.winner) ? `<p class="mt-2 text-[11px] text-base-content/40">${esc(t("winner_hint"))}</p>` : ""}

    ${charted.length ? `
    <section class="mt-8" data-chart>
      <div class="flex flex-wrap items-center justify-between gap-3 mb-3">
        <h3 class="text-sm font-semibold" id="apm-title-${model.uid}">${esc(t("apm_over_time"))}</h3>
        <div class="join" role="group" aria-label="${esc(t("apm_metric"))}">
          <button type="button" class="join-item btn btn-xs btn-active" data-metric="apm" aria-pressed="true">APM</button>
          <button type="button" class="join-item btn btn-xs" data-metric="eapm" aria-pressed="false">EAPM</button>
        </div>
      </div>
      <div class="flex flex-wrap gap-4 mb-2 text-xs" data-legend>
        ${charted.map((p) => `<span class="flex items-center gap-1.5"><span class="inline-block w-4 h-0.5 rounded" style="background:var(--rs-${p.series})" aria-hidden="true"></span>${esc(p.name)}</span>`).join("")}
      </div>
      <div class="relative" data-plot></div>
      <details class="mt-2 text-xs">
        <summary class="cursor-pointer text-base-content/50 hover:text-base-content/80">${esc(t("show_table"))}</summary>
        <div class="overflow-x-auto max-h-72 mt-2" data-table></div>
      </details>
    </section>` : ""}

    ${boPlayers.length ? `
    <section class="mt-8">
      <div class="flex flex-wrap items-center justify-between gap-3 mb-3">
        <h3 class="text-sm font-semibold">${esc(t("build_orders"))}</h3>
        <label class="flex items-center gap-2 text-xs text-base-content/60 cursor-pointer">
          <input type="checkbox" class="toggle toggle-xs toggle-primary" data-workers /> ${esc(t("show_workers"))}
        </label>
      </div>
      <div class="grid gap-6 lg:grid-cols-2">${boPlayers.map((p) => renderBuildOrder(p, model.players.indexOf(p))).join("")}</div>
      <p class="mt-3 text-[11px] text-base-content/40">${esc(t("bo_note"))}</p>
    </section>

    <section class="mt-8">
      <h3 class="text-sm font-semibold mb-3">${esc(t("tech_path"))}</h3>
      <div class="grid gap-6 lg:grid-cols-2">${boPlayers.map(renderTech).join("")}</div>
    </section>` : `<p class="mt-8 text-sm text-base-content/50">${esc(t("no_build"))}</p>`}

    ${model.chat.length ? `
    <details class="mt-8">
      <summary class="cursor-pointer text-sm font-semibold">${esc(t("chat"))} <span class="text-base-content/40 font-normal">(${model.chat.length})</span></summary>
      <ul class="mt-2 flex flex-col gap-1 text-xs">${model.chat.map((c) => `<li><span class="font-stats text-base-content/40">${clock(c.secs)}</span> <span class="font-semibold">${esc(c.who)}:</span> ${esc(c.msg)}</li>`).join("")}</ul>
    </details>` : ""}

    <footer class="mt-8 pt-4 border-t border-base-content/5 flex flex-wrap items-center gap-x-3 gap-y-2 text-[11px] text-base-content/40">
      <span>${esc(t("parsed_locally", {ms: Math.max(1, Math.round(model.parseMs))}))}</span>
      <span aria-hidden="true">·</span>
      <span>${esc(t("commands_n", {n: nf.format(model.commandCount)}))}</span>
      <span aria-hidden="true">·</span>
      <span title="${esc(t("warnings_hint", {bytes: nf.format(model.warnings.skipped_bytes || 0)}))}" class="${model.warningCount ? "text-warning/80" : ""}">${esc(t("warnings_n", {n: nf.format(model.warningCount)}))}</span>
      ${root.dataset.api ? `<button type="button" class="btn btn-primary btn-soft btn-xs ml-auto" data-share>${esc(t("share"))}</button><span data-share-status></span>` : ""}
    </footer>`

  wireCard(card, model)
  return card
}

function wireCard(card, model) {
  card.querySelector("[data-close]").addEventListener("click", () => {
    card.remove()
    setStatus("")
  })

  // Build orders
  const workerToggle = card.querySelector("[data-workers]")
  const expanded = new Set()
  const drawBuildOrders = () => {
    const showWorkers = !!workerToggle?.checked
    card.querySelectorAll("[data-bo]").forEach((sec) => {
      const idx = Number(sec.dataset.bo)
      const rows = boVisible(model.players[idx], showWorkers)
      const all = expanded.has(idx)
      sec.querySelector("tbody").innerHTML = boRowsHtml(all ? rows : rows.slice(0, BO_PREVIEW_ROWS))
      const more = sec.querySelector("[data-more]")
      more.classList.toggle("hidden", rows.length <= BO_PREVIEW_ROWS)
      more.textContent = all ? t("show_less") : t("show_all", {n: rows.length})
    })
  }
  workerToggle?.addEventListener("change", drawBuildOrders)
  card.querySelectorAll("[data-more]").forEach((btn) => btn.addEventListener("click", () => {
    const idx = Number(btn.dataset.more)
    expanded.has(idx) ? expanded.delete(idx) : expanded.add(idx)
    drawBuildOrders()
  }))
  card.querySelectorAll("[data-copy]").forEach((btn) => btn.addEventListener("click", async () => {
    const text = boText(model.players[Number(btn.dataset.copy)], model, !!workerToggle?.checked)
    const ok = await copyText(text)
    btn.textContent = ok ? t("copied") : t("copy_failed")
    setTimeout(() => { btn.textContent = t("copy_bo") }, 1600)
  }))
  drawBuildOrders()

  // APM chart
  const chart = card.querySelector("[data-chart]")
  if (chart) {
    let metric = "apm"
    const draw = () => drawChart(chart, model, metric)
    chart.querySelectorAll("[data-metric]").forEach((btn) => btn.addEventListener("click", () => {
      metric = btn.dataset.metric
      chart.querySelectorAll("[data-metric]").forEach((b) => {
        const on = b === btn
        b.classList.toggle("btn-active", on)
        b.setAttribute("aria-pressed", String(on))
      })
      draw()
    }))
    // The card is attached to the page right after this returns; measure then.
    requestAnimationFrame(draw)
    let lastWidth = 0
    window.addEventListener("resize", () => {
      if (!card.isConnected || chart.clientWidth === lastWidth) return
      lastWidth = chart.clientWidth
      draw()
    })
  }

  const share = card.querySelector("[data-share]")
  if (share) share.addEventListener("click", () => shareReplay(model, share, card.querySelector("[data-share-status]")))
}

async function copyText(text) {
  try {
    await navigator.clipboard.writeText(text)
    return true
  } catch {
    const ta = document.createElement("textarea")
    ta.value = text
    ta.style.position = "fixed"
    ta.style.opacity = "0"
    document.body.appendChild(ta)
    ta.select()
    let ok = false
    try { ok = document.execCommand("copy") } catch { ok = false }
    ta.remove()
    return ok
  }
}

// --- APM chart (inline SVG) -------------------------------------------------

const SVG_NS = "http://www.w3.org/2000/svg"

function niceMax(v) {
  if (v <= 0) return 10
  const steps = [40, 80, 100, 120, 160, 200, 240, 300, 400, 500, 600, 800, 1000, 1200]
  return steps.find((s) => s >= v * 1.05) || Math.ceil(v / 200) * 200
}

function drawChart(chart, model, metric) {
  const series = model.players.filter((p) => p.apmSeries)
  // Draw at the container's pixel width so labels stay at their real size.
  const plotEl = chart.querySelector("[data-plot]")
  const W = Math.max(300, Math.round(plotEl.clientWidth || 720))
  const H = W < 560 ? 220 : 260, ml = 36, mr = W < 560 ? 72 : 96, mt = 10, mb = 28
  const iw = W - ml - mr, ih = H - mt - mb
  const dur = Math.max(1, model.durationSecs)
  const ymax = niceMax(Math.max(...series.flatMap((p) => p.apmSeries.map((s) => s[metric]))))
  const x = (s) => ml + (s / dur) * iw
  const y = (v) => mt + ih - (v / ymax) * ih
  const label = metric.toUpperCase()

  const minutes = dur / 60
  const minuteStep = [1, 2, 5, 10, 15, 20].find((m) => (minutes / m) * 46 <= iw) || 30
  const xticks = []
  for (let m = 0; m * 60 <= dur; m += minuteStep) xticks.push(m)
  const yticks = [0, 0.25, 0.5, 0.75, 1].map((f) => Math.round(ymax * f))

  // Direct labels at the line ends, nudged apart.
  const ends = series.map((p) => {
    const last = p.apmSeries[p.apmSeries.length - 1]
    return {p, y: y(last[metric]), v: last[metric]}
  }).sort((a, b) => a.y - b.y)
  for (let i = 1; i < ends.length; i++) if (ends[i].y - ends[i - 1].y < 13) ends[i].y = ends[i - 1].y + 13

  const titleId = `apm-svg-title-${model.uid}`
  const descId = `apm-svg-desc-${model.uid}`
  const summary = series.map((p) => `${p.name}: ${t("avg")} ${Math.round(metric === "apm" ? p.apm : p.eapm)}`).join(", ")

  const plot = plotEl
  plot.innerHTML = `
    <svg viewBox="0 0 ${W} ${H}" class="w-full h-auto text-base-content select-none touch-pan-y" role="img" aria-labelledby="${titleId} ${descId}" tabindex="0">
      <title id="${titleId}">${esc(t("apm_over_time"))} (${label})</title>
      <desc id="${descId}">${esc(summary)}</desc>
      <g aria-hidden="true">
        ${yticks.map((v) => `<line x1="${ml}" x2="${ml + iw}" y1="${y(v)}" y2="${y(v)}" stroke="currentColor" stroke-opacity="${v === 0 ? 0.25 : 0.08}" />
          <text x="${ml - 6}" y="${y(v) + 3.5}" text-anchor="end" font-size="10" fill="currentColor" fill-opacity="0.5" class="font-stats">${v}</text>`).join("")}
        ${xticks.map((m) => `<text x="${x(m * 60)}" y="${H - 8}" text-anchor="middle" font-size="10" fill="currentColor" fill-opacity="0.5" class="font-stats">${m}:00</text>`).join("")}
        ${series.map((p) => `<polyline fill="none" stroke-width="2" stroke-linejoin="round" stroke-linecap="round" style="stroke:var(--rs-${p.series})"
            points="${p.apmSeries.map((s) => `${x(s.secs).toFixed(1)},${y(s[metric]).toFixed(1)}`).join(" ")}" />`).join("")}
        ${ends.map((e) => `<text x="${ml + iw + 6}" y="${(e.y + 3.5).toFixed(1)}" font-size="10" fill="currentColor" fill-opacity="0.75">${esc(e.p.name.length > 12 ? e.p.name.slice(0, 11) + "…" : e.p.name)}</text>`).join("")}
        <g data-cross style="display:none">
          <line y1="${mt}" y2="${mt + ih}" stroke="currentColor" stroke-opacity="0.35" stroke-dasharray="3 3" />
          ${series.map((p) => `<circle r="4" stroke-width="2" style="fill:var(--rs-${p.series});stroke:var(--color-base-100)" data-dot="${p.series}" />`).join("")}
        </g>
        <rect x="${ml}" y="${mt}" width="${iw}" height="${ih}" fill="transparent" data-hit />
      </g>
    </svg>
    <div data-tip class="pointer-events-none absolute z-10 hidden rounded-md glass-card-elevated px-2.5 py-1.5 text-xs shadow-lg whitespace-nowrap"></div>`

  // Table view
  const table = chart.querySelector("[data-table]")
  const base = series[0].apmSeries
  table.innerHTML = `
    <table class="table table-xs">
      <caption class="sr-only">${esc(t("apm_over_time"))} (${label})</caption>
      <thead><tr><th scope="col">${esc(t("col_time"))}</th>${series.map((p) => `<th scope="col">${esc(p.name)}</th>`).join("")}</tr></thead>
      <tbody>${base.map((s, i) => `<tr><td class="font-stats">${clock(s.secs)}</td>${series.map((p) => `<td class="font-stats">${Math.round(p.apmSeries[i]?.[metric] ?? 0)}</td>`).join("")}</tr>`).join("")}</tbody>
    </table>`

  // Hover / keyboard crosshair
  const svg = plot.querySelector("svg")
  const cross = svg.querySelector("[data-cross]")
  const tip = plot.querySelector("[data-tip]")
  let current = -1
  const show = (i) => {
    i = Math.max(0, Math.min(base.length - 1, i))
    current = i
    const sx = x(base[i].secs)
    cross.style.display = ""
    cross.querySelector("line").setAttribute("x1", sx)
    cross.querySelector("line").setAttribute("x2", sx)
    for (const p of series) {
      const dot = cross.querySelector(`[data-dot="${p.series}"]`)
      const s = p.apmSeries[i]
      dot.setAttribute("cx", sx)
      dot.setAttribute("cy", s ? y(s[metric]) : -10)
    }
    tip.innerHTML = `<div class="font-stats text-base-content/60 mb-0.5">${clock(base[i].secs)}</div>` +
      series.map((p) => `<div class="flex items-center gap-1.5"><span class="inline-block w-3 h-0.5 rounded" style="background:var(--rs-${p.series})"></span>${esc(p.name)} <span class="font-stats font-semibold ml-auto pl-3">${Math.round(p.apmSeries[i]?.[metric] ?? 0)}</span></div>`).join("")
    tip.classList.remove("hidden")
    const box = svg.getBoundingClientRect()
    const px = (sx / W) * box.width
    const left = px + 12 + tip.offsetWidth > box.width ? px - tip.offsetWidth - 12 : px + 12
    tip.style.left = `${Math.max(0, left)}px`
    tip.style.top = "8px"
  }
  const hide = () => {
    cross.style.display = "none"
    tip.classList.add("hidden")
    current = -1
  }
  const indexAt = (clientX) => {
    const box = svg.getBoundingClientRect()
    const sx = ((clientX - box.left) / box.width) * W
    const secs = ((sx - ml) / iw) * dur
    let best = 0
    for (let i = 1; i < base.length; i++) if (Math.abs(base[i].secs - secs) < Math.abs(base[best].secs - secs)) best = i
    return best
  }
  const hit = svg.querySelector("[data-hit]")
  hit.addEventListener("pointermove", (e) => show(indexAt(e.clientX)))
  hit.addEventListener("pointerleave", hide)
  svg.addEventListener("blur", hide)
  svg.addEventListener("keydown", (e) => {
    const stepBy = {ArrowRight: 1, ArrowLeft: -1, PageUp: 6, PageDown: -6}[e.key]
    if (e.key === "Escape") return hide()
    if (stepBy === undefined && e.key !== "Home" && e.key !== "End") return
    e.preventDefault()
    if (e.key === "Home") return show(0)
    if (e.key === "End") return show(base.length - 1)
    show(current < 0 ? 0 : current + stepBy)
  })
}

// --- Errors / status ----------------------------------------------------------

function setStatus(text) {
  const el = document.getElementById("replay-status")
  if (el) el.textContent = text
}

function renderError(fileName, message, detail) {
  const card = document.createElement("article")
  card.className = "rounded-box border border-error/25 bg-error/5 p-5 animate-fade-up"
  card.setAttribute("role", "alert")
  card.innerHTML = `
    <div class="flex items-start gap-3">
      <svg class="size-5 shrink-0 text-error mt-0.5" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 1 1-18 0 9 9 0 0 1 18 0Zm-9 3.75h.008v.008H12v-.008Z" /></svg>
      <div class="min-w-0 flex-1">
        <p class="text-sm font-semibold break-all">${esc(fileName)}</p>
        <p class="text-sm text-base-content/70 mt-1">${esc(message)}</p>
        ${detail ? `<details class="mt-2 text-xs text-base-content/50"><summary class="cursor-pointer">${esc(t("error_details"))}</summary><code class="block mt-1 break-all">${esc(detail)}</code></details>` : ""}
      </div>
      <button type="button" class="btn btn-ghost btn-sm btn-square" data-close aria-label="${esc(t("close"))}">&times;</button>
    </div>`
  card.querySelector("[data-close]").addEventListener("click", () => card.remove())
  document.getElementById("replay-results").prepend(card)
}

function friendlyParseError(message) {
  const m = String(message).toLowerCase()
  if (m.includes("magic") || m.includes("too short")) return t("err_not_replay")
  if (m.includes("decompress") || m.includes("zlib") || m.includes("section") || m.includes("unexpected end")) return t("err_corrupt")
  return t("err_unsupported")
}

// --- Parser loading -------------------------------------------------------------

let parserPromise = null

// Strip the origin from get_url() output so preview deploys load their own copy.
function localUrl(u) {
  try {
    const url = new URL(u, location.href)
    return url.pathname + url.search
  } catch {
    return u
  }
}

function loadParser() {
  if (!parserPromise) {
    parserPromise = (async () => {
      const mod = await import(localUrl(root.dataset.wasmJs))
      await mod.default({module_or_path: localUrl(root.dataset.wasmBin)})
      return mod.parseReplay
    })()
    parserPromise.catch(() => { parserPromise = null })
  }
  return parserPromise
}

// --- File handling ---------------------------------------------------------------

let uidCounter = 0
let queue = Promise.resolve()

async function analyze(file) {
  const results = document.getElementById("replay-results")
  if (!/\.rep$/i.test(file.name)) return renderError(file.name, t("err_not_rep"))
  if (file.size === 0) return renderError(file.name, t("err_empty"))
  if (file.size > MAX_FILE_BYTES) return renderError(file.name, t("err_too_big"))

  let parse
  try {
    if (!parserPromise) setStatus(t("status_loading"))
    parse = await loadParser()
  } catch (e) {
    setStatus("")
    return renderError(file.name, t("err_wasm"), e?.message || String(e))
  }

  setStatus(t("status_parsing", {name: file.name}))
  const bytes = new Uint8Array(await file.arrayBuffer())
  let replay
  const t0 = performance.now()
  try {
    replay = parse(bytes)
  } catch (e) {
    setStatus("")
    const msg = e?.message || String(e)
    return renderError(file.name, friendlyParseError(msg), msg)
  }
  const ms = performance.now() - t0

  try {
    const model = buildModel(replay, bytes, file, ms)
    model.uid = ++uidCounter
    model.bytes = bytes
    results.prepend(renderReplay(model))
    setStatus(t("status_done", {name: file.name}))
  } catch (e) {
    setStatus("")
    console.error(e)
    renderError(file.name, t("err_render"), e?.message || String(e))
  }
}

function handleFiles(fileList) {
  const files = [...fileList]
  for (const f of files) queue = queue.then(() => analyze(f)).catch((e) => console.error(e))
  return queue
}

async function shareReplay(model, btn, statusEl) {
  btn.disabled = true
  statusEl.textContent = t("share_uploading")
  try {
    const form = new FormData()
    form.append("replay[file]", new Blob([model.bytes]), model.file.name)
    const res = await fetch(`${root.dataset.api}/api/replays`, {method: "POST", body: form})
    if (!res.ok) {
      const err = await res.json().catch(() => ({}))
      throw new Error(err.error?.message || `HTTP ${res.status}`)
    }
    statusEl.textContent = t("share_done")
  } catch (e) {
    statusEl.textContent = t("share_failed", {error: e.message})
    btn.disabled = false
  }
}

function init() {
  const input = document.getElementById("replay-file")
  const drop = document.getElementById("replay-drop")
  if (!input || !drop) return

  input.addEventListener("change", () => {
    if (input.files?.length) handleFiles(input.files).then(() => { input.value = "" })
  })
  const over = (on) => {
    drop.classList.toggle("border-primary/60", on)
    drop.classList.toggle("bg-primary/5", on)
  }
  drop.addEventListener("dragover", (e) => {
    e.preventDefault()
    e.dataTransfer.dropEffect = "copy"
    over(true)
  })
  drop.addEventListener("dragleave", () => over(false))
  drop.addEventListener("drop", (e) => {
    e.preventDefault()
    e.stopPropagation()
    over(false)
    if (e.dataTransfer?.files?.length) handleFiles(e.dataTransfer.files)
  })
  // Dropping a file anywhere else on the page should not navigate away from it.
  window.addEventListener("dragover", (e) => e.preventDefault())
  window.addEventListener("drop", (e) => {
    e.preventDefault()
    if (e.dataTransfer?.files?.length) handleFiles(e.dataTransfer.files)
  })
}

if (root) init()

// Exposed for the end-to-end test harness.
export {handleFiles, loadParser}
