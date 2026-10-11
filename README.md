🇰🇷 [한국어](README.ko.md)

<div align="center">

<h1 align="center">
  broodwar.live
</h1>

<p align="center">
  <em>The community platform for StarCraft: Brood War competitive play.</em><br>
  <em>Players. Build orders. Tournaments. Wiki. Replay analysis. Live data coming soon.</em>
</p>

<p align="center">
  <a href="https://www.getzola.org/">
    <img alt="Zola" src="https://img.shields.io/badge/Zola-0.23-F46623?style=for-the-badge">
  </a>
  <a href="https://tailwindcss.com/">
    <img alt="Tailwind CSS" src="https://img.shields.io/badge/Tailwind_CSS-4-06B6D4?logo=tailwindcss&logoColor=white&style=for-the-badge">
  </a>
  <a href="https://pages.cloudflare.com/">
    <img alt="Cloudflare Pages" src="https://img.shields.io/badge/Cloudflare_Pages-F38020?logo=cloudflare&logoColor=white&style=for-the-badge">
  </a>
  <a href="LICENSE">
    <img alt="Code: MIT" src="https://img.shields.io/badge/Code-MIT-c6a0f6?style=for-the-badge">
  </a>
  <a href="https://creativecommons.org/licenses/by-sa/4.0/">
    <img alt="Content: CC BY-SA 4.0" src="https://img.shields.io/badge/Content-CC_BY--SA_4.0-8aadf4?style=for-the-badge">
  </a>
</p>

</div>

---

The unified home for the BW competitive community — think
[basketball-reference.com](https://www.basketball-reference.com) for Brood War.

This repository is the **static site**: Markdown content rendered by [Zola](https://www.getzola.org/),
styled with Tailwind CSS + daisyUI, and served from Cloudflare Pages. Dynamic features (match
history, replay analysis, live streams, balance stats) call a separate JSON API,
[api.broodwar.live](https://github.com/broodwar-live/api.broodwar.live), with small vanilla-JS widgets.

> **Status:** early development. The API is not deployed yet, so API-backed pages show a
> "coming soon" state (`extra.api_enabled = false` in `config.toml`).

## Features

| Feature | Status | Description |
|---------|--------|-------------|
| **Players** | Live | Profiles for 150 pro players, in English and Korean |
| **Build Orders** | Live | Build order guides for every matchup |
| **Tournaments** | Live | ASL, BSL, KSL, OSL, MSL, the Proleague (team league) and season pages |
| **Wiki** | Live | Units, buildings, upgrades, abilities, maps, mechanics, patches, teams, strategies |
| **News** | Live | Project and scene announcements |
| **Search** | Live | Site-wide search (<kbd>Ctrl</kbd>/<kbd>⌘</kbd>+<kbd>K</kbd>) |
| **Matches** | Needs API | Match results and head-to-head records |
| **Replays** | Live | In-browser `.rep` analysis (WASM): build orders, APM over time, openings — nothing is uploaded |
| **Live Streams** | Needs API | Korean stream tracking and ASL/BSL schedules |
| **Balance** | Needs API | Matchup winrates by map and era |

## Quick Start

Prerequisites: [Zola](https://www.getzola.org/documentation/getting-started/installation/) **0.23.6**
(0.22 and older don't work) and Node.js 22+.

```bash
npm ci                # Tailwind CSS + daisyUI
npm run build:css     # Build static/css/app.css
zola serve            # http://127.0.0.1:1111, live reload
```

While editing templates or classes, run `npm run dev:css` in a second terminal to rebuild CSS on
change. `static/css/app.css` is committed — rebuild and commit it when you add Tailwind classes.

```bash
zola build                          # Production build into public/
zola check --skip-external-links    # Validate internal links
```

## Project Structure

```
content/               Markdown content (TOML front matter), English + Korean (*.ko.md)
├── players/           Player profiles
├── builds/            Build orders
├── tournaments/       Leagues and seasons
├── wiki/              Units, buildings, maps, mechanics, patches, teams, ...
├── news/              News articles
├── matches/ replays/ streams/ balance/   API-backed pages
└── credits.md         Licensing and attribution
templates/             Tera templates (base.html, per-section templates, partials/)
src/app.css            Tailwind entry point
static/                Built CSS, vanilla JS widgets, images, _headers, _redirects
config.toml            Site config, i18n strings, feature flags
```

Templates target Zola 0.23 (Tera 2), pinned in CI and in the Cloudflare build command. Tera 2 has
no macros, so shared markup lives in `templates/partials/` and is pulled in with `include`. See
[cloudflare-pages.md](cloudflare-pages.md).

## Contributing Content

Every page has an **Edit on GitHub** link. To add or fix content:

1. Edit or add a Markdown file under `content/` — keep the English (`page.md`) and Korean
   (`page.ko.md`) versions in sync where you can.
2. Cite sources for facts and numbers (Liquipedia, VODs, official results). Don't invent stats.
3. Run `zola serve` to preview, then open a pull request. CI builds the site and checks links.

News posts go in `content/news/` with `date`, `authors` and optional `tags` in the front matter.

### Team leagues

Team leagues (the Proleague so far) use the same series/season layout as the individual
leagues, with team-specific keys; the full schema is documented at the top of
`templates/tournaments/team-season.html`.

- **Series page** (`content/tournaments/proleague.md`, `template = "tournaments/series.html"`,
  `format = "Team"`): one `[[extra.seasons]]` row per season, round final or grand final with
  `season`, `year`, `winner` / `winner_team`, `runner_up` / `runner_up_team` (team name used at
  the time + slug of `content/wiki/teams/<slug>.md`), `score` (`"4–3"`, en dash; for a final
  decided over several team matches, the matches won, with the match scores in
  `score_detail`), `final_date` and `prize_pool`. Team pages list their titles and finals from
  these rows.
- **Season page** (`template = "tournaments/team-season.html"`, `series_slug` + `season`
  matching a series row): `teams`, `maps`, `awards`, optional `standings`, and
  `[[extra.team_bracket]]` rounds of team matches. Each match has `a` / `a_team`, `b` /
  `b_team`, `score_a`, `score_b`, `date` and a `sets` list
  (`{ map, map_slug, a, a_slug, a_race, b, b_slug, b_race, winner = "a" | "b", ace = true }`,
  plus `a2` / `b2` fields for 2v2 sets); ties played over several team matches use
  `[[extra.team_bracket.matches.legs]]`. Only playoffs are recorded, not every regular-season
  match.
- Team-league sets appear on player pages as a separate "Team league playoff sets" section and
  a column in the head-to-head table; the individual playoff record is not affected.
  `scripts/check-team-leagues.py` (run in CI) checks that set winners add up to every score,
  that finals match the series rows, and that every team, player and map slug resolves.

## Deployment

Cloudflare Pages builds every push to `main` (preview deployments for PRs) with Zola pinned in
the build command. See [cloudflare-pages.md](cloudflare-pages.md).

## Related Projects

- [api.broodwar.live](https://github.com/broodwar-live/api.broodwar.live) — Phoenix JSON API (replay parsing, stream polling, data endpoints)
- [bw-engine](https://github.com/broodwar-live/bw-engine) — Rust replay parser and game engine (NIF + WASM)

## License

- **Code** — [MIT](LICENSE)
- **Content** (`content/`) — [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
- **Third-party material** (e.g. player photos from Liquipedia) keeps its original license — see
  [Credits & Licensing](https://broodwar.live/credits/)

## Legal Disclaimer

This project is not affiliated with, endorsed by, or associated with Blizzard Entertainment, Inc.
or Microsoft Corporation. "StarCraft" and "Brood War" are registered trademarks of Blizzard
Entertainment, Inc. This is a free, open-source, non-commercial community project built by fans
for fans.
