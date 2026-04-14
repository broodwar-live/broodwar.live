# Cloudflare Pages Deployment

## Build Settings

Configure in the Cloudflare Pages dashboard:

| Setting | Value |
|---------|-------|
| **Framework preset** | None |
| **Build command** | `npm install && npm run build:css && zola build` |
| **Build output directory** | `public` |
| **Root directory** | `/` |
| **Node.js version** | (not needed) |

## Environment Variables

| Variable | Value |
|----------|-------|
| `ZOLA_VERSION` | `0.20.0` (or latest) |

Cloudflare Pages has native Zola support — set the `ZOLA_VERSION` env var and it installs Zola automatically.

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
