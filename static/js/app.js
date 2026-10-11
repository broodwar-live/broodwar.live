// broodwar.live — minimal client-side JS
// No framework. Just fetch() and DOM.

// No service worker: /sw.js is a self-unregistering stub that cleans up
// installs left over from the Phoenix version of the site.

// Theme toggle (exposed globally for onclick handlers in base.html)
window.setTheme = function(theme) {
  if (theme === "system") {
    localStorage.removeItem("bwl:theme")
    document.documentElement.removeAttribute("data-theme")
  } else {
    localStorage.setItem("bwl:theme", theme)
    document.documentElement.setAttribute("data-theme", theme)
  }
}
