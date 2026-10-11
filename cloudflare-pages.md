# Cloudflare Pages Deployment

## Build Settings

Configure in the Cloudflare Pages dashboard:

| Setting | Value |
|---------|-------|
| **Framework preset** | None |
| **Build command** | `npm ci && npm run build:css && zola build` |
| **Build output directory** | `public` |
| **Root directory** | `/` |
| **Node.js version** | `22` (set `NODE_VERSION`, needed for the Tailwind build) |

## Environment Variables

| Variable | Value |
|----------|-------|
| `ZOLA_VERSION` | `0.23.6` |
| `NODE_VERSION` | `22` |

Cloudflare Pages has native Zola support — set the `ZOLA_VERSION` env var and it installs Zola automatically.

**Pin an exact version.** Zola 0.23 moved to Tera 2 (macros removed, stricter undefined-variable
handling), so templates written for one minor version can break on another. The templates are
deliberately written in the subset of Tera that works on both **0.23.6** (pinned, used locally and
in CI) and **0.22.1** (verified fallback). Avoid Tera macros/components, `filter`/`map`/`concat`
filters and positional test arguments unless you drop 0.22 support.

If a Cloudflare build ever fails to install `0.23.6`, set `ZOLA_VERSION` to `0.22.1` — the site
builds identically on it. Keep `.github/workflows/ci.yml` in sync with whatever is set here.

## Custom Domain

1. Add `broodwar.live` as a custom domain in Pages settings
2. Configure DNS: CNAME `broodwar.live` → `broodwar-live.pages.dev`
3. Enable "Always use HTTPS"

## Build Hooks

On every push to `main`, Cloudflare Pages automatically:
1. Pulls the repo
2. Runs `zola build`
3. Deploys `public/` to the edge CDN
4. Purges cache

## Headers & Redirects

- `static/_headers` → security headers + cache control (copied to `public/_headers` by Zola)
- `static/_redirects` → legacy URL redirects (copied to `public/_redirects` by Zola)

## Preview Deployments

Every PR gets a preview deployment at `<hash>.broodwar-live.pages.dev`.
