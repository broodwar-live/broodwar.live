// Builds list: client-side race / matchup / type filters.
// Progressive enhancement: the form stays hidden and the full list shows without JS.
// Filter state is mirrored in the query string (?race=&matchup=&type=) so build pages
// can link to a filtered list.
(function () {
  "use strict";
  var form = document.getElementById("build-filters");
  var list = document.getElementById("build-list");
  if (!form || !list) return;

  var items = Array.prototype.slice.call(list.children);
  var count = form.querySelector("[data-build-count]");
  var empty = document.getElementById("build-empty");
  var params = new URLSearchParams(window.location.search);

  var seen = {};
  items.forEach(function (li) {
    (li.dataset.tags || "").split(" ").forEach(function (tg) { if (tg) seen[tg] = true; });
  });
  Object.keys(seen).sort().forEach(function (tg) {
    var o = document.createElement("option");
    o.value = tg;
    o.textContent = tg;
    form.elements.type.appendChild(o);
  });

  ["race", "matchup", "type"].forEach(function (name) {
    var v = params.get(name);
    if (v !== null && form.elements[name]) form.elements[name].value = v;
  });

  function apply() {
    var race = form.elements.race.value;
    var mu = form.elements.matchup.value;
    var type = form.elements.type.value;
    var shown = 0;
    items.forEach(function (li) {
      var tags = " " + (li.dataset.tags || "") + " ";
      var ok = (!race || li.dataset.race === race) &&
        (!mu || li.dataset.matchup === mu) &&
        (!type || tags.indexOf(" " + type + " ") !== -1);
      li.hidden = !ok;
      if (ok) shown++;
    });
    if (count) count.textContent = String(shown);
    if (empty) empty.hidden = shown !== 0;

    var q = new URLSearchParams();
    ["race", "matchup", "type"].forEach(function (n) {
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
