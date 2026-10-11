// Player comparison (templates/compare.html). Loads /compare.json (templates/compare.json:
// players, round names, seasons, individual playoff matches, team-league sets) once, then
// renders two players side by side from the URL state ?a=<slug>&b=<slug>.
//
// Counting rules mirror the player pages (templates/players/player.html):
//   * playoff series: a match counts when its winner is known (walkovers included);
//   * games: scores of matches that are not walkovers;
//   * finals: matches in the last bracket round when that round holds a single match;
//   * team-league sets: every set listed (walkover sets are not in the data); the
//     head-to-head counts 1v1 sets (as the player pages' "Team league" column) and lists
//     2v2 sets in which the two players were on opposite sides separately.
// Pickers follow search.js conventions: NFKC + lowercase + punctuation-insensitive matching
// over ID, aliases, Korean real name and romanized name; exact > prefix > word > substring.
;(function () {
  const root = document.getElementById("cmp")
  if (!root) return
  const form = document.getElementById("cmp-form")
  const result = document.getElementById("cmp-result")
  const status = document.getElementById("cmp-status")
  const featured = document.getElementById("cmp-featured")
  let L = {}
  try { L = JSON.parse(document.getElementById("cmp-i18n").textContent) } catch (e) {}
  const t = (k, vars) => {
    let s = L[k] || k
    if (vars) for (const v in vars) s = s.split("{" + v + "}").join(vars[v])
    return s
  }
  const lang = document.documentElement.lang === "ko" ? "ko" : "en"
  const lp = root.dataset.lp || ""

  const norm = (s) => (s || "").normalize("NFKC").toLowerCase().replace(/[^\p{L}\p{N}]+/gu, " ").trim()
  const compact = (s) => s.replace(/ /g, "")
  const esc = (s) => String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;")
  const pad = (n) => (n < 10 ? "0" : "") + n
  const pct = (w, l) => (w + l ? Math.round((w * 100) / (w + l)) + "%" : "–")
  const RACE = { t: ["terran", "T"], p: ["protoss", "P"], z: ["zerg", "Z"] }

  // ---- Data ---------------------------------------------------------------------------
  let D = null
  let loading = null

  function load() {
    if (loading) return loading
    loading = fetch(root.dataset.src || "/compare.json")
      .then((r) => { if (!r.ok) throw new Error(r.status); return r.json() })
      .then((raw) => { D = prepare(raw); render() })
      .catch(() => { loading = null; D = null; renderError() })
    return loading
  }

  function prepare(raw) {
    const players = new Map()
    for (const [slug, id, real, race, aliases, titles, runner, years, rom] of raw.p) {
      const al = aliases ? aliases.split("|") : []
      const rawNames = [id, real, rom, ...al].filter((n) => norm(n))
      const names = rawNames.map(norm)
      players.set(slug, { slug, id, real, race, al, titles, runner, years, rom, rawNames, names, namesC: names.map(compact), ev: [] })
    }
    const rounds = raw.r.map((r) => (lang === "ko" && r[1] ? r[1] : r[0]))
    const seasons = raw.s.map(([slug, title, koTitle, league, year, end, ris]) => ({
      url: lp + "/tournaments/" + slug + "/", title: lang === "ko" && koTitle ? koTitle : title, league, year, end, rounds: ris.map((i) => rounds[i]),
    }))
    const events = []
    const add = (ev, slugs) => {
      events.push(ev)
      for (const s of slugs) { const p = players.get(s); if (p && !p.ev.includes(ev)) p.ev.push(ev) }
    }
    for (const [si, ri, mi, d, a, b, sa, sb, w, x] of raw.m) {
      const s = seasons[si]
      add({ kind: "m", s, round: s.rounds[ri], d, k: (d || s.end) + "-" + pad(ri + 1) + "-" + pad(mi), a, b, sa, sb, w, wo: !!(x & 1), fin: !!(x & 2) }, [a, b])
    }
    for (const [si, ri, mi, gi, d, ta, tb, x, sets] of raw.t) {
      const s = seasons[si]
      sets.forEach((st, j) => {
        const [a, b, w, map, ms, ace, races, a2, b2] = st
        const two = st.length > 7
        add({
          kind: "t", s, round: s.rounds[ri], d, k: (d || s.end) + "-" + pad(ri + 1) + "-" + pad(mi) + "-" + gi + "-" + pad(j + 1),
          url: s.url + "#tl-r" + (ri + 1) + "-m" + mi, ta, tb, fin: !!(x & 2), two,
          sa: two ? [a, a2] : [a], sb: two ? [b, b2] : [b], w, map, ms, ace: !!ace, races,
        }, two ? [a, a2, b, b2] : [a, b])
      })
    }
    for (const p of players.values()) p.ev.sort((x, y) => (x.k < y.k ? -1 : x.k > y.k ? 1 : 0))
    return { players, events }
  }

  const side = (ev, slug) => (ev.kind === "m" ? (ev.a === slug ? "a" : ev.b === slug ? "b" : "") : ev.sa.includes(slug) ? "a" : ev.sb.includes(slug) ? "b" : "")
  const name = (ref) => {
    if (!ref) return ""
    if (ref[0] === "~") return ref.slice(1)
    const p = D.players.get(ref)
    return p ? p.id : ref
  }

  function career(p) {
    const c = { sw: 0, sl: 0, gw: 0, gl: 0, fw: 0, fl: 0, tw: 0, tl: 0, years: [] }
    for (const ev of p.ev) {
      const me = side(ev, p.slug)
      const y = (ev.d || ev.s.end || "").slice(0, 4)
      if (y) c.years.push(y)
      if (ev.kind === "m") {
        if (ev.w) {
          const won = ev.w === me
          won ? c.sw++ : c.sl++
          if (ev.fin) won ? c.fw++ : c.fl++
        }
        if (!ev.wo) { c.gw += me === "a" ? ev.sa : ev.sb; c.gl += me === "a" ? ev.sb : ev.sa }
      } else {
        ev.w === me ? c.tw++ : c.tl++
      }
    }
    c.years.sort()
    return c
  }

  // Meetings between a and b, oldest first, with totals from a's side.
  function headToHead(a, b) {
    const list = a.ev.filter((ev) => {
      const sa = side(ev, a.slug), sb = side(ev, b.slug)
      return sa && sb && sa !== sb
    })
    const h = { sw: 0, sl: 0, gw: 0, gl: 0, tw: 0, tl: 0, t2w: 0, t2l: 0, list, leagues: new Map(), maps: new Map() }
    for (const ev of list) {
      const me = side(ev, a.slug)
      const lg = h.leagues.get(ev.s.league) || { sw: 0, sl: 0, gw: 0, gl: 0, tw: 0, tl: 0, n: 0, last: "" }
      lg.n++
      lg.last = ev.k
      if (ev.kind === "m") {
        if (ev.w) { if (ev.w === me) { h.sw++; lg.sw++ } else { h.sl++; lg.sl++ } }
        if (!ev.wo) {
          const mg = me === "a" ? ev.sa : ev.sb, og = me === "a" ? ev.sb : ev.sa
          h.gw += mg; h.gl += og; lg.gw += mg; lg.gl += og
        }
      } else {
        const won = ev.w === me
        if (ev.two) won ? h.t2w++ : h.t2l++
        else won ? h.tw++ : h.tl++
        won ? lg.tw++ : lg.tl++
        if (ev.map) {
          const m = h.maps.get(ev.map) || { w: 0, l: 0, ms: ev.ms }
          won ? m.w++ : m.l++
          h.maps.set(ev.map, m)
        }
      }
      h.leagues.set(ev.s.league, lg)
    }
    return h
  }

  // Most frequent opponents with a profile: individual matches + 1v1 sets.
  function rivals(p, n) {
    const c = new Map()
    for (const ev of p.ev) {
      if (ev.kind === "t" && ev.two) continue
      const me = side(ev, p.slug)
      const opp = ev.kind === "m" ? (me === "a" ? ev.b : ev.a) : me === "a" ? ev.sb[0] : ev.sa[0]
      if (!opp || opp[0] === "~" || !D.players.has(opp)) continue
      c.set(opp, (c.get(opp) || 0) + 1)
    }
    return [...c.entries()].sort((x, y) => y[1] - x[1] || name(x[0]).localeCompare(name(y[0]))).slice(0, n)
  }

  // ---- Search (pickers) -----------------------------------------------------------------
  function search(q) {
    const qn = norm(q)
    const all = [...D.players.values()]
    if (!qn) return all.slice().sort((x, y) => y.titles - x.titles || y.ev.length - x.ev.length).slice(0, 8).map((p) => [p, 0])
    const qc = compact(qn), tokens = qn.split(" ")
    const hits = []
    for (const p of all) {
      let best = 0, hit = 0
      p.names.forEach((n, i) => {
        const nc = p.namesC[i], bonus = i === 0 ? 50 : 0
        let s = 0
        if (n === qn || nc === qc) s = 1000 + bonus
        else if (n.startsWith(qn) || nc.startsWith(qc)) s = 600 + bonus
        else if (tokens.every((tk) => (" " + n).includes(" " + tk))) s = 400 + bonus
        else if (nc.includes(qc)) s = 250 + bonus
        if (s > best) { best = s; hit = i }
      })
      if (best) hits.push([best, p, hit])
    }
    hits.sort((x, y) => y[0] - x[0] || y[1].ev.length - x[1].ev.length || x[1].id.length - y[1].id.length)
    return hits.slice(0, 12).map(([, p, i]) => [p, i])
  }

  const state = { a: "", b: "" }
  const pickers = {}

  function raceTile(race, size) {
    const r = RACE[race]
    const sz = size || "w-5 h-5"
    if (!r) return `<span class="${sz} shrink-0 rounded bg-base-content/10" aria-hidden="true"></span>`
    return `<span class="bg-race-${r[0]} ${sz} shrink-0 rounded flex items-center justify-center text-[11px] leading-none font-black text-base-100" aria-hidden="true">${r[1]}</span>`
  }

  function setupPicker(el) {
    const s = el.dataset.side
    const input = el.querySelector("input")
    const list = el.querySelector("[role=listbox]")
    const clear = el.querySelector("[data-clear]")
    const tile = el.querySelector("[data-race-tile]")
    const pk = { el, input, list, clear, tile, opts: [], active: -1, open: false }
    pickers[s] = pk

    const close = () => {
      pk.open = false
      list.hidden = true
      input.setAttribute("aria-expanded", "false")
      input.removeAttribute("aria-activedescendant")
    }
    const setActive = (i) => {
      if (!pk.opts.length) return
      pk.active = (i + pk.opts.length) % pk.opts.length
      list.querySelectorAll("[role=option]").forEach((o, j) => {
        const on = j === pk.active
        o.setAttribute("aria-selected", on ? "true" : "false")
        o.classList.toggle("bg-primary/10", on)
        if (on) o.scrollIntoView({ block: "nearest" })
      })
      input.setAttribute("aria-activedescendant", `cmp-${s}-opt-${pk.active}`)
    }
    const show = () => {
      if (!D) { load(); return }
      const hits = search(input.value)
      pk.opts = hits.map((h) => h[0])
      if (!hits.length) {
        list.innerHTML = `<li class="px-3 py-2 text-sm text-base-content/70">${esc(t("cmp_no_match"))}</li>`
      } else {
        list.innerHTML = hits.map(([p, hi], i) => {
          const extra = hi > 0 ? p.rawNames[hi] : p.real || p.rom
          return `<li id="cmp-${s}-opt-${i}" role="option" aria-selected="false" data-i="${i}" class="flex items-center gap-2.5 px-3 py-2 rounded-lg cursor-pointer text-sm">
            ${raceTile(p.race)}<span class="font-medium">${esc(p.id)}</span>${extra ? `<span class="text-xs text-base-content/70 truncate">${esc(extra)}</span>` : ""}
            ${p.titles ? `<span class="ml-auto font-stats text-xs text-warning shrink-0">&#9733; ${p.titles}</span>` : ""}</li>`
        }).join("")
      }
      list.hidden = false
      pk.open = true
      input.setAttribute("aria-expanded", "true")
      announce(hits.length ? t("cmp_options", { n: hits.length }) : t("cmp_no_match"))
      if (hits.length) setActive(0)
    }
    const pick = (p) => {
      close()
      choose(s, p ? p.slug : "")
    }
    pk.show = show
    pk.close = close

    input.addEventListener("focus", () => { if (!state[s] || input.value === "") show(); else input.select() })
    input.addEventListener("click", () => { if (!pk.open) show() })
    let timer = null
    input.addEventListener("input", () => { clearTimeout(timer); timer = setTimeout(show, 60) })
    input.addEventListener("keydown", (e) => {
      if (e.key === "ArrowDown") { e.preventDefault(); if (!pk.open) show(); else setActive(pk.active + 1) }
      else if (e.key === "ArrowUp") { e.preventDefault(); if (!pk.open) show(); else setActive(pk.active - 1) }
      else if (e.key === "Enter") {
        e.preventDefault()
        if (pk.open && pk.opts.length) pick(pk.opts[Math.max(0, pk.active)])
      } else if (e.key === "Escape") {
        if (pk.open) { e.preventDefault(); close(); syncInputs() }
      } else if (e.key === "Tab") {
        close()
      }
    })
    input.addEventListener("blur", () => setTimeout(() => { if (!el.contains(document.activeElement)) { close(); syncInputs() } }, 120))
    list.addEventListener("mousedown", (e) => e.preventDefault())
    list.addEventListener("click", (e) => {
      const o = e.target.closest("[role=option]")
      if (o) pick(pk.opts[Number(o.dataset.i)])
    })
    list.addEventListener("mousemove", (e) => {
      const o = e.target.closest("[role=option]")
      if (o && Number(o.dataset.i) !== pk.active) setActive(Number(o.dataset.i))
    })
    clear.addEventListener("click", () => { choose(s, ""); input.focus() })
  }

  function syncInputs() {
    for (const s of ["a", "b"]) {
      const pk = pickers[s]
      if (!pk) continue
      const p = D && state[s] ? D.players.get(state[s]) : null
      if (document.activeElement !== pk.input || !pk.open) pk.input.value = p ? p.id : state[s] && !D ? pk.input.value : ""
      pk.clear.hidden = !state[s]
      const r = p && RACE[p.race]
      pk.tile.className = "absolute z-10 left-3 top-1/2 -translate-y-1/2 w-5 h-5 rounded flex items-center justify-center text-[11px] font-black text-base-100 " + (r ? "bg-race-" + r[0] : "bg-base-content/10")
      pk.tile.textContent = r ? r[1] : ""
    }
  }

  // ---- URL state ----------------------------------------------------------------------
  function readUrl() {
    const q = new URLSearchParams(location.search)
    state.a = (q.get("a") || "").trim().toLowerCase()
    state.b = (q.get("b") || "").trim().toLowerCase()
    if (state.a && state.a === state.b) state.b = ""
  }
  function urlFor(a, b) {
    const q = new URLSearchParams()
    if (a) q.set("a", a)
    if (b) q.set("b", b)
    const qs = q.toString()
    return location.pathname + (qs ? "?" + qs : "")
  }
  function choose(s, slug) {
    state[s] = slug
    if (state.a && state.a === state.b) state[s === "a" ? "b" : "a"] = ""
    const url = urlFor(state.a, state.b)
    if (url !== location.pathname + location.search) history.pushState(null, "", url)
    syncInputs()
    render()
    // Move on to the empty picker after the first choice.
    if (slug && s === "a" && !state.b && pickers.b) pickers.b.input.focus()
  }

  // ---- Rendering ----------------------------------------------------------------------
  function announce(msg) { if (status) status.textContent = msg }

  const playerLink = (ref, cls) => {
    if (!ref) return ""
    if (ref[0] === "~") return `<span class="${cls || ""}">${esc(ref.slice(1))}</span>`
    const p = D.players.get(ref)
    return `<a href="${lp}/players/${esc(ref)}/" class="hover:underline hover:text-primary ${cls || ""}">${esc(p ? p.id : ref)}</a>`
  }
  const cmpLink = (a, b, label, cls) => `<a href="${esc(urlFor(a, b))}" data-cmp="${esc(a)}|${esc(b)}" class="${cls || "text-primary hover:underline"}">${label}</a>`
  const wl = (w, l) => `${w}<span class="text-base-content/60">–</span>${l}`

  function rivalList(p, other) {
    const rs = rivals(p, 6).filter(([s]) => s !== other)
    if (!rs.length) return ""
    return `<div class="min-w-0"><h3 class="text-sm font-semibold mb-2">${esc(t("cmp_rivals_of", { name: p.id }))}</h3><ul class="flex flex-wrap gap-2">${rs.map(([s, n]) => {
      const o = D.players.get(s)
      return `<li>${cmpLink(p.slug, s, `${raceTile(o.race, "w-4 h-4")}<span class="font-medium">${esc(o.id)}</span><span class="text-xs text-base-content/70 font-stats">${esc(t("cmp_meetings_n", { n }))}</span>`,
        "inline-flex items-center gap-1.5 rounded-lg border border-primary/20 px-2.5 py-1.5 text-sm text-primary hover:bg-primary/5")}</li>`
    }).join("")}</ul></div>`
  }

  function header(p) {
    const r = RACE[p.race]
    return `<div class="min-w-0 ${r ? "infobox-accent-" + r[0] : ""} rounded-box px-3 py-3 sm:px-5 sm:py-4 text-center">
      <div class="flex justify-center mb-1.5">${raceTile(p.race, "w-7 h-7")}</div>
      <a href="${lp}/players/${esc(p.slug)}/" class="block text-lg sm:text-2xl font-display truncate hover:underline">${esc(p.id)}</a>
      ${p.real ? `<span class="block text-xs sm:text-sm text-base-content/70 truncate">${esc(p.real)}</span>` : ""}
    </div>`
  }

  function summaryRows(pa, pb) {
    const ca = career(pa), cb = career(pb)
    const raceName = (p) => (RACE[p.race] ? `<span class="font-semibold text-race-${RACE[p.race][0]}">${esc(t("player_race_" + RACE[p.race][0]))}</span>` : "–")
    const years = (p, c) => {
      if (p.years) return esc(p.years.replace(/present/g, t("player_present")))
      return c.years.length ? esc(c.years[0] === c.years[c.years.length - 1] ? c.years[0] : c.years[0] + "–" + c.years[c.years.length - 1]) : "–"
    }
    const rec = (w, l) => (w + l ? `<span class="font-stats whitespace-nowrap">${wl(w, l)}</span> <span class="font-stats text-xs text-base-content/70">${pct(w, l)}</span>` : `<span class="text-base-content/60">–</span>`)
    const better = (x, y) => (x > y ? "font-semibold" : "")
    const rate = (w, l) => (w + l ? w / (w + l) : -1)
    const rows = [
      [t("player_race"), raceName(pa), raceName(pb)],
      [t("player_years_active"), years(pa, ca), years(pb, cb)],
      [t("player_titles"), `<span class="font-stats ${pa.titles ? "text-warning font-semibold" : ""}">${pa.titles ? "&#9733; " + pa.titles : "0"}</span>`, `<span class="font-stats ${pb.titles ? "text-warning font-semibold" : ""}">${pb.titles ? "&#9733; " + pb.titles : "0"}</span>`],
      [t("cmp_finals"), rec(ca.fw, ca.fl), rec(cb.fw, cb.fl)],
      [t("cmp_series"), `<span class="${better(rate(ca.sw, ca.sl), rate(cb.sw, cb.sl))}">${rec(ca.sw, ca.sl)}</span>`, `<span class="${better(rate(cb.sw, cb.sl), rate(ca.sw, ca.sl))}">${rec(cb.sw, cb.sl)}</span>`],
      [t("cmp_games"), `<span class="${better(rate(ca.gw, ca.gl), rate(cb.gw, cb.gl))}">${rec(ca.gw, ca.gl)}</span>`, `<span class="${better(rate(cb.gw, cb.gl), rate(ca.gw, ca.gl))}">${rec(cb.gw, cb.gl)}</span>`],
      [t("cmp_tl_sets"), `<span class="${better(rate(ca.tw, ca.tl), rate(cb.tw, cb.tl))}">${rec(ca.tw, ca.tl)}</span>`, `<span class="${better(rate(cb.tw, cb.tl), rate(ca.tw, ca.tl))}">${rec(cb.tw, cb.tl)}</span>`],
    ]
    return rows.map(([label, va, vb]) => `<tr>
      <td class="text-right text-sm py-2 w-[38%]">${va}</td>
      <th scope="row" class="text-center text-[11px] sm:text-xs font-semibold uppercase tracking-wider text-base-content/70 px-2 py-2">${esc(label)}</th>
      <td class="text-left text-sm py-2 w-[38%]">${vb}</td></tr>`).join("")
  }

  function summaryCard(pa, pb) {
    return `<section class="glass-card rounded-box p-3 sm:p-5" aria-labelledby="cmp-summary-h">
      <h2 id="cmp-summary-h" class="sr-only">${esc(t("cmp_summary"))}</h2>
      <div class="grid grid-cols-[1fr_auto_1fr] items-center gap-2 sm:gap-4">
        ${header(pa)}
        <span class="text-xs font-semibold uppercase tracking-wider text-base-content/70">${esc(t("cmp_vs"))}</span>
        ${header(pb)}
      </div>
      <table class="w-full mt-3 border-separate border-spacing-0 [&_tr+tr>*]:border-t [&_tr+tr>*]:border-base-content/10">
        <caption class="sr-only">${esc(t("cmp_summary"))}: ${esc(pa.id)} ${esc(t("cmp_vs"))} ${esc(pb.id)}</caption>
        <tbody>${summaryRows(pa, pb)}</tbody>
      </table>
    </section>`
  }

  function tile(label, w, l, pa, pb) {
    const lead = w > l ? t("cmp_leads", { name: pa.id }) : l > w ? t("cmp_leads", { name: pb.id }) : t("cmp_tied")
    return `<div class="glass-card rounded-box px-3 py-3 sm:px-4 min-w-0">
      <dt class="text-[11px] sm:text-xs font-semibold uppercase tracking-wider text-base-content/70">${esc(label)}</dt>
      <dd class="mt-1 font-stats text-2xl sm:text-3xl leading-tight whitespace-nowrap">${wl(w, l)}</dd>
      <dd class="text-xs text-base-content/70 truncate">${esc(lead)}</dd>
    </div>`
  }

  function meetingRow(ev, pa, pb) {
    const me = side(ev, pa.slug)
    const date = ev.d ? `<time datetime="${esc(ev.d)}">${esc(ev.d)}</time>` : esc(String(ev.s.year))
    let type, score, winner, extra = ""
    if (ev.kind === "m") {
      type = t("cmp_type_series")
      if (ev.wo) score = ev.w ? `<abbr title="${esc(t("rec_walkover"))}" class="no-underline text-xs text-base-content/70">${esc(t("rec_walkover_short"))}</abbr>` : `<span class="text-base-content/60">–</span>`
      else score = wl(me === "a" ? ev.sa : ev.sb, me === "a" ? ev.sb : ev.sa)
      winner = ev.w ? (ev.w === me ? pa : pb) : null
    } else {
      type = ev.two ? t("cmp_type_2v2") : t("cmp_type_set")
      score = wl(ev.w === me ? 1 : 0, ev.w === me ? 0 : 1)
      winner = ev.w === me ? pa : pb
      const myTeam = me === "a" ? ev.ta : ev.tb, opTeam = me === "a" ? ev.tb : ev.ta
      const mapHtml = ev.map ? (ev.ms ? `<a href="${lp}/wiki/maps/${esc(ev.ms)}/" class="hover:underline">${esc(ev.map)}</a>` : esc(ev.map)) : ""
      const mates = ev.two ? ` <span class="text-base-content/70">(${(me === "a" ? ev.sa : ev.sb).map((r) => esc(name(r))).join(" & ")} ${esc(t("cmp_vs"))} ${(me === "a" ? ev.sb : ev.sa).map((r) => esc(name(r))).join(" & ")})</span>` : ""
      extra = `<span class="block text-xs text-base-content/70">${esc(myTeam)} ${esc(t("cmp_vs"))} ${esc(opTeam)}${mapHtml ? " · " + mapHtml : ""}${mates}${ev.ace ? ` <span class="inline-block rounded bg-warning/10 px-1.5 py-0.5 text-[11px] font-semibold text-warning" title="${esc(t("tl_ace"))}">${esc(t("tl_ace_short"))}</span>` : ""}</span>`
    }
    const url = ev.kind === "t" ? ev.url : ev.s.url
    const win = winner ? `<span class="inline-flex items-center gap-1.5 text-sm ${winner === pa ? "font-semibold" : ""}">${raceTile(winner.race, "w-4 h-4")}${esc(winner.id)}</span>` : `<span class="text-base-content/60">–</span>`
    return `<tr class="max-sm:flex max-sm:flex-wrap max-sm:items-baseline max-sm:gap-x-3 max-sm:gap-y-1 max-sm:rounded-box max-sm:border max-sm:border-primary/10 max-sm:p-3">
      <td class="font-stats text-xs text-base-content/70 whitespace-nowrap max-sm:p-0">${date}</td>
      <td class="text-sm max-sm:p-0 max-sm:basis-full max-sm:order-3"><a href="${esc(url)}" class="text-primary hover:underline">${esc(ev.s.title)}</a>${extra}</td>
      <td class="text-xs whitespace-nowrap max-sm:p-0 max-sm:order-2 ${ev.fin ? "font-semibold text-warning" : "text-base-content/70"}">${esc(ev.round || "")}</td>
      <td class="text-xs whitespace-nowrap text-base-content/70 max-sm:p-0 max-sm:order-4">${esc(type)}</td>
      <td class="font-stats text-sm text-right whitespace-nowrap max-sm:p-0 max-sm:order-5">${score}</td>
      <td class="max-sm:p-0 max-sm:order-6 max-sm:ml-auto">${win}</td>
    </tr>`
  }

  function renderPair(pa, pb) {
    const h = headToHead(pa, pb)
    let html = summaryCard(pa, pb)
    html += `<section class="mt-10" aria-labelledby="cmp-h2h-h"><h2 id="cmp-h2h-h" class="text-lg font-semibold mb-3">${esc(t("cmp_h2h"))} <span class="text-sm font-normal text-base-content/70">${esc(pa.id)} ${esc(t("cmp_vs"))} ${esc(pb.id)}</span></h2>`
    if (!h.list.length) {
      html += `<div class="glass-card rounded-box p-5">
        <p class="text-base font-medium">${esc(t("cmp_never_met"))}</p>
        <p class="text-sm text-base-content/70 mt-1 mb-4">${esc(t("cmp_never_met_note"))}</p>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-5">${rivalList(pa, pb.slug)}${rivalList(pb, pa.slug)}</div>
      </div></section>`
      return html
    }
    const tiles = []
    if (h.sw + h.sl || h.gw + h.gl) { tiles.push(tile(t("cmp_h2h_series"), h.sw, h.sl, pa, pb)); tiles.push(tile(t("cmp_h2h_games"), h.gw, h.gl, pa, pb)) }
    if (h.tw + h.tl) tiles.push(tile(t("cmp_h2h_sets"), h.tw, h.tl, pa, pb))
    if (h.t2w + h.t2l) tiles.push(tile(t("cmp_h2h_2v2"), h.t2w, h.t2l, pa, pb))
    html += `<dl class="grid grid-cols-2 lg:grid-cols-4 gap-2 sm:gap-3" data-h2h-totals="${h.sw}-${h.sl} ${h.gw}-${h.gl} ${h.tw}-${h.tl}">${tiles.join("")}</dl>`

    // By league
    const lgs = [...h.leagues.entries()].sort((x, y) => y[1].n - x[1].n || x[0].localeCompare(y[0]))
    const anyTl = h.tw + h.tl + h.t2w + h.t2l > 0, anyInd = h.sw + h.sl + h.gw + h.gl > 0 || h.list.some((e) => e.kind === "m")
    const cell = (w, l, show) => (show && w + l ? `<span class="whitespace-nowrap">${wl(w, l)}</span>` : `<span class="text-base-content/60">–</span>`)
    html += `<div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mt-8">`
    html += `<div class="min-w-0"><h3 class="text-base font-semibold mb-2">${esc(t("cmp_by_league"))}</h3><div class="overflow-x-auto"><table class="table table-sm w-full">
      <thead><tr class="text-xs text-base-content/70"><th scope="col">${esc(t("cmp_col_league"))}</th>${anyInd ? `<th scope="col" class="text-right">${esc(t("cmp_col_series"))}</th><th scope="col" class="text-right">${esc(t("cmp_col_games"))}</th>` : ""}${anyTl ? `<th scope="col" class="text-right">${esc(t("cmp_col_sets"))}</th>` : ""}</tr></thead><tbody>
      ${lgs.map(([lg, r]) => `<tr><th scope="row" class="text-sm font-medium">${esc(lg)}</th>${anyInd ? `<td class="font-stats text-sm text-right">${cell(r.sw, r.sl, true)}</td><td class="font-stats text-sm text-right text-base-content/80">${cell(r.gw, r.gl, true)}</td>` : ""}${anyTl ? `<td class="font-stats text-sm text-right">${cell(r.tw, r.tl, true)}</td>` : ""}</tr>`).join("")}
      </tbody></table></div></div>`
    if (h.maps.size) {
      const maps = [...h.maps.entries()].sort((x, y) => y[1].w + y[1].l - (x[1].w + x[1].l) || x[0].localeCompare(y[0]))
      html += `<div class="min-w-0"><h3 class="text-base font-semibold mb-1">${esc(t("cmp_by_map"))}</h3><p class="text-xs text-base-content/70 mb-2">${esc(t("cmp_by_map_note"))}</p><div class="overflow-x-auto"><table class="table table-sm w-full">
        <thead><tr class="text-xs text-base-content/70"><th scope="col">${esc(t("cmp_col_map"))}</th><th scope="col" class="text-right">${esc(pa.id)}–${esc(pb.id)}</th><th scope="col" class="text-right">${esc(t("rec_win_pct"))}</th></tr></thead><tbody>
        ${maps.map(([m, r]) => `<tr><th scope="row" class="text-sm font-medium">${r.ms ? `<a href="${lp}/wiki/maps/${esc(r.ms)}/" class="text-primary hover:underline">${esc(m)}</a>` : esc(m)}</th><td class="font-stats text-sm text-right">${wl(r.w, r.l)}</td><td class="font-stats text-xs text-right text-base-content/70">${pct(r.w, r.l)}</td></tr>`).join("")}
        </tbody></table></div></div>`
    } else if (anyInd) {
      html += `<div class="min-w-0"><h3 class="text-base font-semibold mb-1">${esc(t("cmp_by_map"))}</h3><p class="text-xs text-base-content/70">${esc(t("cmp_by_map_note"))}</p></div>`
    }
    html += `</div>`

    // Every meeting
    html += `<h3 class="text-base font-semibold mt-8 mb-1">${esc(t("cmp_meetings"))} <span class="text-sm font-normal text-base-content/70 font-stats">(${h.list.length})</span></h3>
      <p class="text-xs text-base-content/70 mb-3">${esc(t("cmp_meetings_note"))}</p>
      <table class="table table-sm w-full max-sm:block" data-cmp-meetings><thead class="max-sm:sr-only"><tr class="text-xs text-base-content/70">
        <th scope="col">${esc(t("rec_col_date"))}</th><th scope="col">${esc(t("rec_col_tournament"))}</th><th scope="col">${esc(t("rec_col_round"))}</th><th scope="col"><span class="sr-only">${esc(t("cmp_type_series"))} / ${esc(t("cmp_type_set"))}</span></th>
        <th scope="col" class="text-right">${esc(pa.id)}–${esc(pb.id)}</th><th scope="col">${esc(t("rec_col_result"))}</th></tr></thead>
        <tbody class="max-sm:block max-sm:space-y-2">${h.list.map((ev) => meetingRow(ev, pa, pb)).join("")}</tbody></table>`
    html += `</section>`
    return html
  }

  function renderSingle(p) {
    return `<div class="grid grid-cols-1 md:grid-cols-[minmax(0,20rem)_1fr] gap-5 items-start">
      <div class="glass-card rounded-box p-1">${header(p)}</div>
      <div class="glass-card rounded-box p-5"><p class="text-sm mb-4">${esc(t("cmp_pick_second", { name: p.id }))}</p>${rivalList(p, "")}</div>
    </div>`
  }

  function renderError() {
    const links = ["a", "b"].filter((s) => state[s]).map((s) => `<a href="${lp}/players/${esc(state[s])}/" class="text-primary hover:underline font-medium">${esc(state[s])}</a>`)
    result.innerHTML = `<div class="glass-card rounded-box p-5 text-sm"><p class="text-error font-medium">${esc(t("cmp_error"))}</p>
      ${links.length ? `<p class="mt-2">${esc(t("cmp_profiles"))} ${links.join(" · ")}</p>` : ""}
      <p class="mt-2"><a href="${lp}/players/" class="text-primary hover:underline">${esc(t("cmp_all_players"))} &rarr;</a></p></div>`
  }

  function render() {
    if (!D) {
      result.innerHTML = state.a || state.b ? `<p class="text-sm text-base-content/70">${esc(t("cmp_loading"))}</p>` : ""
      return
    }
    syncInputs()
    const unknown = ["a", "b"].filter((s) => state[s] && !D.players.has(state[s]))
    const pa = D.players.get(state.a), pb = D.players.get(state.b)
    let html = unknown.map((s) => `<p class="mb-4 rounded-box border border-warning/30 bg-warning/10 px-4 py-2.5 text-sm">${esc(t("cmp_unknown", { slug: state[s] }))}</p>`).join("")
    if (pa && pb) {
      html += renderPair(pa, pb)
      document.title = `${pa.id} ${t("cmp_vs")} ${pb.id} — ${t("cmp_title")} — broodwar.live`
      announce(t("cmp_status", { a: pa.id, b: pb.id }))
    } else {
      const one = pa || pb
      if (one) html += renderSingle(one)
      else html += `<p class="text-sm text-base-content/70">${esc(t("cmp_pick_two"))}</p>`
      document.title = `${t("cmp_title")} — broodwar.live`
    }
    result.innerHTML = html
    if (featured) featured.hidden = !!(pa && pb)
  }

  // ---- Wiring -------------------------------------------------------------------------
  form.hidden = false
  form.addEventListener("submit", (e) => e.preventDefault())
  form.querySelectorAll(".cmp-picker").forEach(setupPicker)
  document.getElementById("cmp-swap").addEventListener("click", () => {
    const a = state.a
    state.a = state.b
    choose("b", a)
  })
  // In-page compare links (rivals, featured): navigate without a reload.
  root.addEventListener("click", (e) => {
    const a = e.target.closest("a[href]")
    if (!a || e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey) return
    const u = new URL(a.href, location.href)
    if (u.origin !== location.origin || u.pathname !== location.pathname) return
    e.preventDefault()
    history.pushState(null, "", u.pathname + u.search)
    readUrl()
    syncInputs()
    render()
    window.scrollTo({ top: root.getBoundingClientRect().top + window.scrollY - 80, behavior: "smooth" })
    const h = document.getElementById("cmp-summary-h") || result
    if (h) { h.setAttribute("tabindex", "-1"); h.focus({ preventScroll: true }) }
  })
  window.addEventListener("popstate", () => { readUrl(); syncInputs(); render() })

  readUrl()
  syncInputs()
  render()
  load()
})()
