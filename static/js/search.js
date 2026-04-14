// Site search using Zola's elasticlunr index

;(function() {
  const overlay = document.getElementById("search-overlay")
  const backdrop = document.getElementById("search-backdrop")
  const input = document.getElementById("search-input")
  const results = document.getElementById("search-results")
  const toggle = document.getElementById("search-toggle")
  if (!overlay || !input || !results) return

  let index = null
  let loaded = false

  function open() {
    overlay.classList.remove("hidden")
    document.body.style.overflow = "hidden"
    input.focus()
    if (!loaded) loadIndex()
  }

  function close() {
    overlay.classList.add("hidden")
    document.body.style.overflow = ""
    input.value = ""
    results.innerHTML = ""
  }

  // Toggle button
  if (toggle) toggle.addEventListener("click", open)

  // Backdrop click closes
  if (backdrop) backdrop.addEventListener("click", close)

  // Keyboard shortcuts
  document.addEventListener("keydown", (e) => {
    // Cmd/Ctrl+K to open
    if ((e.metaKey || e.ctrlKey) && e.key === "k") {
      e.preventDefault()
      if (overlay.classList.contains("hidden")) open()
      else close()
    }
    // Escape to close
    if (e.key === "Escape" && !overlay.classList.contains("hidden")) {
      close()
    }
  })

  async function loadIndex() {
    if (loaded) return
    try {
      // Load elasticlunr
      const lunrScript = document.createElement("script")
      lunrScript.src = "/elasticlunr.min.js"
      document.head.appendChild(lunrScript)
      await new Promise((resolve, reject) => {
        lunrScript.onload = resolve
        lunrScript.onerror = reject
      })

      // Load the search index
      const indexScript = document.createElement("script")
      indexScript.src = "/search_index.en.js"
      document.head.appendChild(indexScript)
      await new Promise((resolve, reject) => {
        indexScript.onload = resolve
        indexScript.onerror = reject
      })

      // elasticlunr index is exposed as window.searchIndex
      if (window.elasticlunr && window.searchIndex) {
        index = window.elasticlunr.Index.load(window.searchIndex)
        loaded = true
      }
    } catch (e) {
      results.innerHTML = '<p class="text-sm text-error/60">Failed to load search index.</p>'
    }
  }

  // Debounced search
  let timer = null
  input.addEventListener("input", () => {
    clearTimeout(timer)
    timer = setTimeout(doSearch, 150)
  })

  function doSearch() {
    const query = input.value.trim()
    if (!query || !index) {
      results.innerHTML = ""
      return
    }

    const hits = index.search(query, {
      fields: { title: { boost: 3 }, body: { boost: 1 } },
      bool: "OR",
      expand: true,
    })

    if (hits.length === 0) {
      results.innerHTML = '<p class="text-sm text-base-content/30 py-4 text-center">No results found.</p>'
      return
    }

    const html = hits.slice(0, 15).map(hit => {
      const doc = hit.doc
      const title = doc.title || "Untitled"
      const body = doc.body || ""
      // Extract a snippet around the query
      const snippet = getSnippet(body, query)
      const url = doc.id // Zola uses the URL as the doc id

      return `
        <a href="${url}" class="block px-3 py-2.5 rounded-lg hover:bg-primary/5 transition-colors group" onclick="document.getElementById('search-overlay').classList.add('hidden'); document.body.style.overflow=''">
          <div class="text-sm font-medium group-hover:text-primary transition-colors">${escapeHtml(title)}</div>
          ${snippet ? `<div class="text-xs text-base-content/40 mt-0.5 line-clamp-2">${snippet}</div>` : ""}
        </a>
      `
    }).join("")

    results.innerHTML = html
  }

  function getSnippet(body, query) {
    if (!body) return ""
    const lower = body.toLowerCase()
    const qLower = query.toLowerCase()
    const pos = lower.indexOf(qLower)
    if (pos === -1) return body.slice(0, 120) + (body.length > 120 ? "..." : "")
    const start = Math.max(0, pos - 50)
    const end = Math.min(body.length, pos + query.length + 80)
    let snippet = (start > 0 ? "..." : "") + body.slice(start, end) + (end < body.length ? "..." : "")
    // Bold the match
    const regex = new RegExp(`(${escapeRegex(query)})`, "gi")
    snippet = escapeHtml(snippet).replace(regex, '<span class="text-primary font-medium">$1</span>')
    return snippet
  }

  function escapeHtml(str) {
    return str.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;")
  }

  function escapeRegex(str) {
    return str.replace(/[.*+?^${}()|[\]\\]/g, "\\$&")
  }
})()
