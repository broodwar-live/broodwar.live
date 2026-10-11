// Sortable tables + horizontal-scroll cues. Progressive enhancement: without JS the
// tables render in their authored order and simply scroll.
//
// Sorting: <table data-sortable> with <th data-sort="text|num"> header cells. Each such
// header gets a <button> (keyboard accessible: Tab + Enter/Space) and aria-sort.
// A cell may carry data-sort-value to sort by something other than its text.
// A header that already has aria-sort="ascending|descending" in the markup is applied
// on load. Rows that tie keep their original relative order (stable sort).
// A header with data-sort-key="x" can be selected from the URL with ?sort=x
// (numeric columns sort descending, text ascending); this overrides the markup default.
//
// Scroll cue: [data-scroll-cue] wraps an .overflow-x-auto element; when the content is
// wider than the box, the wrapper gets data-overflowing and its [data-scroll-hint]
// children are shown until the user reaches the right edge.
(function () {
  "use strict";

  function cellValue(row, idx, type) {
    var cell = row.cells[idx];
    if (!cell) return type === "num" ? -Infinity : "";
    var raw = cell.hasAttribute("data-sort-value") ? cell.getAttribute("data-sort-value") : cell.textContent;
    raw = raw.trim();
    if (type === "num") {
      var n = parseFloat(raw.replace(/[^0-9.\-]/g, ""));
      return isNaN(n) ? -Infinity : n;
    }
    return raw.toLowerCase();
  }

  function sortTable(table, th, dir) {
    var tbody = table.tBodies[0];
    if (!tbody) return;
    var idx = th.cellIndex;
    var type = th.getAttribute("data-sort") || "text";
    var rows = Array.prototype.slice.call(tbody.rows);
    rows.forEach(function (r, i) { if (!r.hasAttribute("data-order")) r.setAttribute("data-order", i); });
    var sign = dir === "descending" ? -1 : 1;
    rows.sort(function (a, b) {
      var va = cellValue(a, idx, type), vb = cellValue(b, idx, type);
      var c = type === "num" ? va - vb : String(va).localeCompare(String(vb), undefined, { numeric: true });
      if (c) return c * sign;
      return Number(a.getAttribute("data-order")) - Number(b.getAttribute("data-order"));
    });
    rows.forEach(function (r) { tbody.appendChild(r); });

    Array.prototype.forEach.call(table.querySelectorAll("th[data-sort]"), function (h) {
      var icon = h.querySelector("[data-sort-icon]");
      if (h === th) {
        h.setAttribute("aria-sort", dir);
        if (icon) icon.textContent = dir === "ascending" ? "▲" : "▼";
      } else {
        h.removeAttribute("aria-sort");
        if (icon) icon.textContent = "↕";
      }
    });
  }

  var urlSort = new URLSearchParams(window.location.search).get("sort");

  Array.prototype.forEach.call(document.querySelectorAll("table[data-sortable]"), function (table) {
    var initial = null;
    var fromUrl = null;
    Array.prototype.forEach.call(table.querySelectorAll("th[data-sort]"), function (th) {
      var btn = document.createElement("button");
      btn.type = "button";
      btn.className = "inline-flex items-center gap-1 hover:text-primary focus-visible:outline-2 focus-visible:outline-primary rounded-sm cursor-pointer";
      while (th.firstChild) btn.appendChild(th.firstChild);
      var icon = document.createElement("span");
      icon.setAttribute("aria-hidden", "true");
      icon.setAttribute("data-sort-icon", "");
      icon.className = "text-[11px] opacity-70";
      icon.textContent = "↕";
      btn.appendChild(icon);
      th.appendChild(btn);
      if (th.hasAttribute("aria-sort")) initial = th;
      if (urlSort && th.getAttribute("data-sort-key") === urlSort) fromUrl = th;
      btn.addEventListener("click", function () {
        var cur = th.getAttribute("aria-sort");
        var dir = cur === "ascending" ? "descending" : cur === "descending" ? "ascending"
          : (th.getAttribute("data-sort") === "num" ? "descending" : "ascending");
        sortTable(table, th, dir);
      });
    });
    if (fromUrl) {
      sortTable(table, fromUrl, fromUrl.getAttribute("data-sort") === "num" ? "descending" : "ascending");
    } else if (initial) {
      sortTable(table, initial, initial.getAttribute("aria-sort"));
    }
  });

  Array.prototype.forEach.call(document.querySelectorAll("[data-scroll-cue]"), function (wrap) {
    var box = wrap.querySelector(".overflow-x-auto");
    if (!box) return;
    function update() {
      var over = box.scrollWidth > box.clientWidth + 2;
      var atEnd = box.scrollLeft + box.clientWidth >= box.scrollWidth - 2;
      if (over && !atEnd) wrap.setAttribute("data-overflowing", "");
      else wrap.removeAttribute("data-overflowing");
      Array.prototype.forEach.call(wrap.querySelectorAll("[data-scroll-hint]"), function (h) {
        h.hidden = !(over && !atEnd);
      });
    }
    box.addEventListener("scroll", update, { passive: true });
    window.addEventListener("resize", update);
    update();
  });
})();
