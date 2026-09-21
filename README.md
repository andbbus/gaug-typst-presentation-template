# GAUG Typst Presentation Template

A [Typst](https://typst.app) port of the **Georg-August-Universität Göttingen**
"GAslides" beamer theme (`beamerthemeGA.sty`, v1.0, 2022). Geometry, colours,
fonts and box metrics were matched 1:1 against a `pdflatex` render of the
original template, so a deck built here looks like the LaTeX one — but compiles
in a fraction of the time and with far less markup.

![Preview](docs/preview.png)

## Requirements

- **Typst** ≥ 0.12 (developed on 0.15) — <https://github.com/typst/typst>
- The **Latin Modern Sans** font (the theme's typeface, `lmss`). Without it the
  template falls back to Arial and stops looking like the original.

### Installing Latin Modern Sans

Any of these works; Typst picks up fonts from the OS or from `--font-path`.

- **Have a TeX distribution?** The OTFs already ship with it, e.g.
  `…/texmf-dist/fonts/opentype/public/lm/lmsans10-*.otf`. Copy the four
  `lmsans10-{regular,bold,oblique,boldoblique}.otf` faces into your user font
  folder (`~/Library/Fonts` on macOS, `~/.local/share/fonts` on Linux, the
  Fonts control panel on Windows).
- **No TeX?** Download *Latin Modern Sans* from the
  [GUST font page](https://www.gust.org.pl/projects/e-foundry/latin-modern) and
  install the same faces.
- **Prefer not to install?** Point Typst at a folder of the OTFs at build time:
  `typst compile --font-path ./fonts example.typ`.

## Build

```sh
typst compile example.typ        # -> example.pdf
typst watch   example.typ        # live preview while editing
```

## Usage

Copy `ga-slides.typ` and `assets/` next to your own `.typ` file and start from
`example.typ`:

```typst
#import "ga-slides.typ": *

#show: ga-slides.with(
  title: "My Talk",
  author: "Your Name",
  short-institute: "Institute / Chair",   // shown at the top-right of each slide
  date: "2026",
)

#title-slide(
  title: "My Talk",
  subtitle: "An optional subtitle",
  author: "Your Name",
  institute: "Institute / Chair",
  date: "21 September 2026",
)

#slide(title: "A content slide")[
  #uniblau-block(title: "A block")[
    - some points
    - #hl[a highlighted phrase]
  ]
]
```

## Components

**Wrappers**

| Function | What it is |
|---|---|
| `ga-slides.with(title:, author:, institute:, short-institute:, date:)` | document wrapper (`#show`) — sets page, furniture, typography |
| `title-slide(title:, subtitle:, author:, institute:, date:)` | the title page |
| `slide(title: "…")[ … ]` | a content slide with an optional frame title |

**Blocks** — coloured, rounded boxes (beamer `beamerboxesrounded`). Each takes
`title:` and optional `title-size:` / `body-size:` (default 11 pt — drop to
9–10 pt on dense slides, as beamer's `\small`/`\footnotesize` would):

- `uniblau-block` — the standard dark-blue block
- `alert-block` — light-blue (hellblau) "alert"
- `example-block` — chamois "example"
- `dunkelblau-block`, `grau-block` — extra colours

**Other**

- `hl[…]` — inline highlight in the university blue.
- `colors` — the full GA palette as a dictionary (`colors.uniblau`,
  `colors.hellblau`, `colors.chamois`, `colors.grau80`, …) for tables, figures
  and custom elements.

## Notes & differences from the LaTeX theme

- The beamer footer **navigation-symbol cluster** is intentionally omitted (it
  is a navigation widget most decks suppress anyway).
- Line breaking is Typst's, not TeX's, so long lines may wrap a word earlier or
  later than the LaTeX original. Sizes, colours and layout are matched.

## Credits & licensing

- Original design: **GAslides** beamer theme, © 2022 Georg-August-Universität
  Göttingen, authored/maintained by le-tex publishing services.
- The GA wordmark in `assets/logo-2.pdf` is the property of the
  Georg-August-Universität Göttingen and is included for use by members of the
  university. If you redistribute or use this template outside that context,
  check the university's brand-usage rules and replace the logo as needed.
- The Typst port code (`ga-slides.typ`) is released under the MIT License
  (`LICENSE`). This applies to the port only, not to the university's visual
  identity or the original beamer theme.
