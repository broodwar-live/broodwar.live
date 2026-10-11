// Players table: client-side filters (race, status, country). Column sorting is
// handled by table-sort.js.
// Progressive enhancement: the form stays hidden and the full list shows without JS.
(function () {
  "use strict";
  var form = document.getElementById("player-filters");
  var list = document.getElementById("player-list");
  if (!form || !list) return;

  var items = Array.prototype.slice.call(list.rows || list.children);
  var count = form.querySelector("[data-player-count]");
  var empty = document.getElementById("player-empty");
  var params = new URLSearchParams(window.location.search);

  var seen = {};
  items.forEach(function (li) { if (li.dataset.country) seen[li.dataset.country] = true; });
  Object.keys(seen).sort(function (a, b) { return a.localeCompare(b); }).forEach(function (c) {
    var o = document.createElement("option");
    o.value = c;
    o.textContent = c;
    form.elements.country.appendChild(o);
  });

  ["race", "status", "country"].forEach(function (name) {
    var v = params.get(name);
    if (v !== null && form.elements[name]) form.elements[name].value = v;
  });

  function apply() {
    var race = form.elements.race.value;
    var status = form.elements.status.value;
    var country = form.elements.country.value;
    var shown = 0;

    items.forEach(function (li) {
      var ok =
        (!race || li.dataset.race === race) &&
        (!status || li.dataset.status === status) &&
        (!country || li.dataset.country === country);
      li.hidden = !ok;
      if (ok) shown++;
    });

    if (count) count.textContent = String(shown);
    if (empty) empty.hidden = shown !== 0;

    var q = new URLSearchParams();
    ["race", "status", "country"].forEach(function (n) {
      if (form.elements[n].value) q.set(n, form.elements[n].value);
    });
    var qs = q.toString();
    history.replaceState(null, "", window.location.pathname + (qs ? "?" + qs : ""));
  }

  form.addEventListener("change", apply);
  form.addEventListener("submit", function (e) { e.preventDefault(); });
  form.hidden = false;
  apply();
})();
