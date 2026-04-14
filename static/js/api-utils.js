// Shared API fetch utilities for all widgets.
// Provides retry logic, loading states, and error handling.

window.BwApi = {
  /**
   * Fetch JSON from the API with retry logic.
   * @param {string} url - Full API URL
   * @param {object} opts - Options: { retries: 2, retryDelay: 1000 }
   * @returns {Promise<object>} Parsed JSON response
   */
  async fetchJson(url, opts = {}) {
    const retries = opts.retries ?? 2
    const retryDelay = opts.retryDelay ?? 1000
    let lastError

    for (let attempt = 0; attempt <= retries; attempt++) {
      try {
        const res = await fetch(url)
        if (!res.ok) throw new Error(`HTTP ${res.status}`)
        return await res.json()
      } catch (e) {
        lastError = e
        if (attempt < retries) {
          await new Promise(r => setTimeout(r, retryDelay * (attempt + 1)))
        }
      }
    }
    throw lastError
  },

  /**
   * Show a loading spinner in a mount element.
   */
  showLoading(mount) {
    mount.innerHTML = `
      <div class="flex items-center gap-2 text-sm text-base-content/30 py-4">
        <span class="loading loading-spinner loading-sm"></span>
        Loading...
      </div>
    `
  },

  /**
   * Show an error message with optional retry button.
   */
  showError(mount, message, onRetry) {
    mount.innerHTML = `
      <div class="text-sm text-base-content/20 py-4">
        <p>${message}</p>
        ${onRetry ? '<button class="btn btn-xs btn-ghost mt-2" data-retry>Retry</button>' : ''}
      </div>
    `
    if (onRetry) {
      const btn = mount.querySelector('[data-retry]')
      if (btn) btn.addEventListener('click', onRetry)
    }
  },

  /**
   * Show an empty state message.
   */
  showEmpty(mount, message) {
    mount.innerHTML = `<p class="text-sm text-base-content/30 py-4">${message}</p>`
  }
}
