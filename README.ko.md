🇺🇸 [English](README.md)

<div align="center">

<h1 align="center">
  broodwar.live
</h1>

<p align="center">
  <em>스타크래프트: 브루드 워 경쟁전을 위한 커뮤니티 플랫폼.</em><br>
  <em>선수. 빌드 오더. 대회. 위키. 리플레이 분석. 실시간 데이터는 준비 중.</em>
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
  <a href="https://creativecommons.org/licenses/by-sa/4.0/deed.ko">
    <img alt="Content: CC BY-SA 4.0" src="https://img.shields.io/badge/Content-CC_BY--SA_4.0-8aadf4?style=for-the-badge">
  </a>
</p>

</div>

---

BW 경쟁 커뮤니티의 통합 플랫폼 — 브루드 워 판
[basketball-reference.com](https://www.basketball-reference.com)을 목표로 합니다.

이 저장소는 **정적 사이트**입니다. Markdown 콘텐츠를 [Zola](https://www.getzola.org/)로 렌더링하고,
Tailwind CSS + daisyUI로 스타일링하며, Cloudflare Pages에서 서비스합니다. 경기 기록, 리플레이 분석,
라이브 스트림, 밸런스 통계 같은 동적 기능은 작은 바닐라 JS 위젯이 별도의 JSON API
[api.broodwar.live](https://github.com/broodwar-live/api.broodwar.live)를 호출하는 방식입니다.

> **상태:** 초기 개발 단계입니다. API가 아직 배포되지 않아 API 기반 페이지는 "준비 중"으로
> 표시됩니다 (`config.toml`의 `extra.api_enabled = false`).

## 기능

| 기능 | 상태 | 설명 |
|------|------|------|
| **선수** | 운영 중 | 프로 선수 150명의 프로필 (영어·한국어) |
| **빌드 오더** | 운영 중 | 모든 종족전의 빌드 오더 가이드 |
| **대회** | 운영 중 | ASL, BSL, KSL, OSL, MSL 및 시즌 페이지 |
| **위키** | 운영 중 | 유닛, 건물, 업그레이드, 기술, 맵, 메커니즘, 패치, 팀, 전략 |
| **뉴스** | 운영 중 | 프로젝트 및 씬 소식 |
| **검색** | 운영 중 | 사이트 전체 검색 (<kbd>Ctrl</kbd>/<kbd>⌘</kbd>+<kbd>K</kbd>) |
| **경기** | API 필요 | 경기 결과 및 상대 전적 |
| **리플레이** | 운영 중 | 브라우저 내 `.rep` 분석(WASM): 빌드 오더, 시간대별 APM, 오프닝 — 업로드 없음 |
| **라이브 스트림** | API 필요 | 한국 방송 추적, ASL/BSL 일정 |
| **밸런스** | API 필요 | 맵·시대별 종족전 승률 |

## 빠른 시작

준비물: [Zola](https://www.getzola.org/documentation/getting-started/installation/) **0.23.6**
(0.22 이하는 동작하지 않음) 및 Node.js 22 이상.

```bash
npm ci                # Tailwind CSS + daisyUI 설치
npm run build:css     # static/css/app.css 빌드
zola serve            # http://127.0.0.1:1111, 라이브 리로드
```

템플릿이나 클래스를 수정할 때는 다른 터미널에서 `npm run dev:css`를 실행하면 CSS가 자동으로
다시 빌드됩니다. `static/css/app.css`는 저장소에 커밋되므로, Tailwind 클래스를 추가했다면 다시 빌드해
함께 커밋하세요.

```bash
zola build                          # public/에 프로덕션 빌드
zola check --skip-external-links    # 내부 링크 검사
```

## 프로젝트 구조

```
content/               Markdown 콘텐츠 (TOML 프런트 매터), 영어 + 한국어 (*.ko.md)
├── players/           선수 프로필
├── builds/            빌드 오더
├── tournaments/       리그 및 시즌
├── wiki/              유닛, 건물, 맵, 메커니즘, 패치, 팀 등
├── news/              뉴스 글
├── matches/ replays/ streams/ balance/   API 기반 페이지
└── credits.md         라이선스 및 저작자 표시
templates/             Tera 템플릿 (base.html, 섹션별 템플릿, partials/)
src/app.css            Tailwind 진입점
static/                빌드된 CSS, 바닐라 JS 위젯, 이미지, _headers, _redirects
config.toml            사이트 설정, 다국어 문자열, 기능 플래그
```

템플릿은 Zola 0.22와 0.23(Tera 1과 Tera 2) 모두에서 빌드되어야 합니다. 매크로/컴포넌트,
`filter`/`map`/`concat` 필터, 위치 기반 테스트 인자는 사용하지 마세요.
[cloudflare-pages.md](cloudflare-pages.md)를 참고하세요.

## 콘텐츠 기여

모든 페이지에 **GitHub에서 수정** 링크가 있습니다. 콘텐츠를 추가하거나 고치려면:

1. `content/` 아래의 Markdown 파일을 수정하거나 추가합니다. 가능하면 영어(`page.md`)와
   한국어(`page.ko.md`) 버전을 함께 맞춰 주세요.
2. 사실과 수치에는 출처(Liquipedia, VOD, 공식 결과)를 남겨 주세요. 통계를 지어내지 마세요.
3. `zola serve`로 미리 본 뒤 풀 리퀘스트를 열어 주세요. CI가 사이트를 빌드하고 링크를 검사합니다.

뉴스 글은 `content/news/`에 `date`, `authors`, 선택적인 `tags`를 프런트 매터에 넣어 작성합니다.

## 배포

Cloudflare Pages가 `main`에 푸시될 때마다 빌드합니다 (PR마다 미리보기 배포). Zola 버전은
빌드 명령에 고정되어 있습니다. [cloudflare-pages.md](cloudflare-pages.md)를 참고하세요.

## 관련 프로젝트

- [api.broodwar.live](https://github.com/broodwar-live/api.broodwar.live) — Phoenix JSON API (리플레이 파싱, 스트림 폴링, 데이터 엔드포인트)
- [bw-engine](https://github.com/broodwar-live/bw-engine) — Rust 리플레이 파서 및 게임 엔진 (NIF + WASM)

## 라이선스

- **코드** — [MIT](LICENSE)
- **콘텐츠** (`content/`) — [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/deed.ko)
- **외부 자료** (예: Liquipedia의 선수 사진)는 원래의 라이선스를 따릅니다 —
  [크레딧 및 라이선스](https://broodwar.live/ko/credits/) 참고

## 법적 고지

이 프로젝트는 Blizzard Entertainment, Inc. 또는 Microsoft Corporation과 제휴, 보증, 관련이 없습니다.
"StarCraft"와 "Brood War"는 Blizzard Entertainment, Inc.의 등록 상표입니다. 이 프로젝트는 팬이 팬을
위해 만든 무료 오픈소스 비상업 커뮤니티 프로젝트입니다.
