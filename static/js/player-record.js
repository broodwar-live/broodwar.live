// Player page, playoff record: /players/<slug>/?vs=<opponent-slug> narrows the match list to
// that opponent and highlights the head-to-head row. Progressive enhancement: without JS
// (or without ?vs=) the full list renders as authored. Strings come from data-* attributes
// on the section (config.toml rec_vs_*).
(function () {
  "use strict";
  var section = document.getElementById("player-record-section");
  if (!section) return;
  var vs = new URLSearchParams(window.location.search).get("vs");
  if (!vs) return;

  var matches = section.querySelector("table[data-rec-matches]");
  var h2h = section.querySelector("table[data-rec-h2h]");
  var banner = section.querySelector("[data-vs-banner]");
  if (!matches || !banner) return;

  var name = vs;
  if (h2h) {
    Array.prototype.forEach.call(h2h.tBodies[0].rows, function (tr) {
      if (tr.getAttribute("data-opp") === vs) {
        tr.setAttribute("data-vs-current", "");
        tr.setAttribute("aria-current", "true");
        var link = tr.cells[0].querySelector("a");
        name = (link || tr.cells[0]).textContent.trim();
        // On phones the row may sit in the collapsed part of the table: expand it.
        var moreH2h = document.getElementById("rec-more-h2h");
        if (moreH2h && !tr.offsetParent) moreH2h.checked = true;
      }
    });
  }

  var n = 0;
  Array.prototype.forEach.call(matches.tBodies[0].rows, function (tr) {
    var hit = tr.getAttribute("data-opp") === vs;
    tr.hidden = !hit;
    if (hit) n++;
  });
  if (n === 0) {
    // Unknown opponent: keep the full list and say so.
    Array.prototype.forEach.call(matches.tBodies[0].rows, function (tr) { tr.hidden = false; });
  }
  // Show every matching row on phones too (the 10-row collapse counts hidden rows).
  var more = document.getElementById("rec-more");
  if (more && n > 0) {
    more.checked = true;
    var label = section.querySelector("label[for=rec-more]");
    if (label) label.hidden = true;
  }

  var text = (n > 0 ? section.getAttribute("data-vs-filter") : section.getAttribute("data-vs-none")) || "";
  banner.textContent = text.replace("{n}", String(n)).replace("{name}", name) + " ";
  var clear = document.createElement("a");
  clear.href = window.location.pathname + "#player-matches";
  clear.className = "text-primary hover:underline font-medium";
  clear.textContent = section.getAttribute("data-vs-clear") || "";
  banner.appendChild(clear);
  banner.hidden = false;

  if (!window.location.hash) {
    var target = document.getElementById("player-matches");
    if (target) target.scrollIntoView();
  }
})();
