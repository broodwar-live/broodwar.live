// Site search over the custom JSON index (templates/search.json → /search.json,
// /ko/search.json). Entries: [type, title, path, "alt|names|", description].
//
// Ranking (per entry, best name wins; "names" = title + alt names, which carry
// the other language's title, Korean/English names, real names and aliases):
//   exact name match > name prefix > every query word starts a word in a name
//   > every query word appears in a name > every query word starts a word in
//   the description. Ties: entity types (player/unit/map…) before reference
//   pages, then shorter titles. Results are grouped by type.
;(function () {
  const dialog = document.getElementById("search-overlay")
  const input = document.getElementById("search-input")
  const results = document.getElementById("search-results")
  const status = document.getElementById("search-status")
  if (!dialog || !input || !results) return

  const lang = document.documentElement.lang === "ko" ? "ko" : "en"
  let labels = {}
  try { labels = JSON.parse(document.getElementById("search-labels").textContent) } catch (e) {}
  const L = (k, fb) => labels[k] || fb

  const TYPE_ORDER = ["section", "player", "unit", "building", "map", "league", "season", "strategy", "build",
    "ability", "upgrade", "race", "techtree", "team", "mechanic", "patch", "news", "wiki"]
  const typeRank = (t) => { const i = TYPE_ORDER.indexOf(t); return i < 0 ? 99 : i }

  let entries = null
  let loading = null
  let active = -1
  let flat = []

  const norm = (s) => (s || "").normalize("NFKC").toLowerCase().replace(/[^\p{L}\p{N}]+/gu, " ").trim()
  const compact = (s) => s.replace(/ /g, "")

  function load() {
    if (loading) return loading
    loading = fetch(lang === "ko" ? "/ko/search.json" : "/search.json")
      .then((r) => { if (!r.ok) throw new Error(r.status); return r.json() })
      .then((data) => {
        entries = data.map(([type, title, url, alt, desc]) => {
          const raw = [title, ...(alt || "").split("|")].filter((n) => norm(n))
          const names = raw.map(norm)
          return { type, title, url, desc, raw, names, namesC: names.map(compact), nameText: " " + names.join(" "), descText: " " + norm(desc) }
        })
        if (input.value.trim()) run()
      })
      .catch(() => {
        loading = null
        setStatus(L("error", "Failed to load search index."), true)
      })
    return loading
  }

  function score(e, qn, qc, tokens) {
    let best = 0
    for (let i = 0; i < e.names.length; i++) {
      const n = e.names[i], nc = e.namesC[i], titleBonus = i === 0 ? 50 : 0
      if (n === qn || nc === qc) best = Math.max(best, 1000 + titleBonus)
      else if (n.startsWith(qn) || nc.startsWith(qc)) best = Math.max(best, 600 + titleBonus)
    }
    if (best) return best
    if (tokens.every((t) => e.nameText.includes(" " + t))) return 400
    if (tokens.every((t) => e.nameText.includes(t))) return 250
    if (tokens.every((t) => e.nameText.includes(" " + t) || e.descText.includes(" " + t))) return 80
    return 0
  }

  function setStatus(msg, isError) {
    results.innerHTML = msg
      ? `<p class="px-3 py-4 text-sm text-center ${isError ? "text-error" : "text-base-content/70"}">${escapeHtml(msg)}</p>`
      : ""
    flat = []
    active = -1
    input.removeAttribute("aria-activedescendant")
    input.setAttribute("aria-expanded", "false")
  }

  function run() {
    const qn = norm(input.value)
    if (!qn) { setStatus(L("hint", "")); announce(""); return }
    if (!entries) { setStatus(L("loading", "Loading…")); load(); return }
    const qc = compact(qn)
    const tokens = qn.split(" ")
    const hits = []
    for (const e of entries) {
      const s = score(e, qn, qc, tokens)
      if (s) hits.push([s, e])
    }
    hits.sort((a, b) => b[0] - a[0] || typeRank(a[1].type) - typeRank(b[1].type) || a[1].title.length - b[1].title.length)
    if (!hits.length) { setStatus(L("none", "No results found.")); announce(L("none", "")); return }

    // Group by type, ordered by each group's best hit; cap per group and total.
    const groups = new Map()
    for (const [, e] of hits) {
      if (!groups.has(e.type)) groups.set(e.type, [])
      const g = groups.get(e.type)
      if (g.length < 6) g.push(e)
    }
    flat = []
    let html = ""
    let shown = 0
    for (const [type, list] of groups) {
      if (shown >= 30) break
      const label = L("type_" + type, type)
      html += `<div role="group" aria-labelledby="sg-${type}" class="mb-2">`
      html += `<div id="sg-${type}" class="px-3 pt-2 pb-1 text-[11px] font-semibold uppercase tracking-wider text-base-content/70">${escapeHtml(label)}</div>`
      for (const e of list) {
        const i = flat.length
        flat.push(e)
        shown++
        const alt = e.names.length > 1 ? altLine(e) : ""
        html += `<a id="sr-${i}" role="option" aria-selected="false" href="${escapeHtml(e.url)}" data-i="${i}"
          class="search-hit flex items-start gap-3 px-3 py-2 rounded-lg">
          <span class="mt-0.5 shrink-0 min-w-[4.5rem] text-center rounded border border-base-content/15 px-1.5 py-px text-[11px] font-medium text-base-content/75">${escapeHtml(label)}</span>
          <span class="min-w-0">
            <span class="block text-sm font-medium text-base-content">${escapeHtml(e.title)}${alt}</span>
            ${e.desc ? `<span class="block text-xs text-base-content/70 truncate">${escapeHtml(e.desc)}</span>` : ""}
          </span>
        </a>`
      }
      html += `</div>`
    }
    results.innerHTML = html
    input.setAttribute("aria-expanded", "true")
    setActive(0)
    announce(`${flat.length} ${L("results", "results")}`)
  }

  // Show the first alternate name that differs from the title (e.g. 이제동, Lurker).
  function altLine(e) {
    const i = e.names.findIndex((n, j) => j > 0 && n !== e.names[0])
    return i > 0 ? ` <span class="font-normal text-base-content/70">· ${escapeHtml(e.raw[i])}</span>` : ""
  }

  function setActive(i) {
    if (!flat.length) return
    active = (i + flat.length) % flat.length
    results.querySelectorAll("[role=option]").forEach((el) => {
      const on = Number(el.dataset.i) === active
      el.setAttribute("aria-selected", on ? "true" : "false")
      if (on) el.scrollIntoView({ block: "nearest" })
    })
    input.setAttribute("aria-activedescendant", "sr-" + active)
  }

  function announce(msg) { if (status) status.textContent = msg }

  function open() {
    if (dialog.open) return
    if (typeof dialog.showModal === "function") dialog.showModal()
    else dialog.setAttribute("open", "")
    document.body.style.overflow = "hidden"
    input.focus()
    load()
    run()
  }

  function close() {
    if (dialog.open && typeof dialog.close === "function") dialog.close()
    else dialog.removeAttribute("open")
  }

  dialog.addEventListener("close", () => {
    document.body.style.overflow = ""
    input.value = ""
    setStatus("")
  })
  // Click on the dialog's own box (the backdrop area) closes it.
  dialog.addEventListener("click", (e) => { if (e.target === dialog || e.target.hasAttribute("data-search-close")) close() })
  results.addEventListener("mousemove", (e) => {
    const a = e.target.closest("[role=option]")
    if (a && Number(a.dataset.i) !== active) setActive(Number(a.dataset.i))
  })
  results.addEventListener("click", (e) => { if (e.target.closest("a")) close() })

  document.querySelectorAll("[data-search-open]").forEach((b) => b.addEventListener("click", (e) => {
    e.preventDefault()
    const menu = document.getElementById("mobile-menu")
    if (menu && menu.open) menu.close()
    open()
  }))

  document.addEventListener("keydown", (e) => {
    if ((e.metaKey || e.ctrlKey) && e.key.toLowerCase() === "k") {
      e.preventDefault()
      dialog.open ? close() : open()
    } else if (e.key === "/" && !dialog.open && !/^(INPUT|TEXTAREA|SELECT)$/.test(document.activeElement.tagName) && !document.activeElement.isContentEditable) {
      e.preventDefault()
      open()
    }
  })

  input.addEventListener("keydown", (e) => {
    if (e.key === "ArrowDown") { e.preventDefault(); setActive(active + 1) }
    else if (e.key === "ArrowUp") { e.preventDefault(); setActive(active - 1) }
    else if (e.key === "Enter") {
      const target = flat[active >= 0 ? active : 0]
      if (target) { e.preventDefault(); window.location.href = target.url }
    }
  })

  let timer = null
  input.addEventListener("input", () => { clearTimeout(timer); timer = setTimeout(run, 80) })

  function escapeHtml(str) {
    return String(str).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;")
  }
})()
