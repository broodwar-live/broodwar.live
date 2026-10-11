# Cloudflare Pages Deployment

## Build Settings

Configured in the Cloudflare Pages dashboard (Workers & Pages → broodwar-live → Settings → Build):

| Setting | Value |
|---------|-------|
| **Framework preset** | None |
| **Build command** | `curl -sL https://github.com/getzola/zola/releases/download/v0.23.6/zola-v0.23.6-x86_64-unknown-linux-gnu.tar.gz \| tar xz && ./zola build` |
| **Build output directory** | `public` |
| **Root directory** | `/` |

The build command downloads a pinned Zola release itself; the `ZOLA_VERSION` environment variable
is **not** used. `static/css/app.css` is committed, so Cloudflare does not run the Tailwind build —
run `npm run build:css` locally and commit the result whenever templates or `src/app.css` change.

**Pin an exact version.** The templates need Zola **0.23.x** (Tera 2: `load_data(literal=…)`,
parenthesised filter expressions, `resize_image` as used here); they do not build on 0.22 or older.
When upgrading Zola, change the version in the Cloudflare build command and `ZOLA_VERSION` in
`.github/workflows/ci.yml` together.

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
