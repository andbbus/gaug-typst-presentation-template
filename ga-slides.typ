// ga-slides.typ — a high-fidelity Typst port of the Georg-August-Universität
// Göttingen "GAslides" beamer theme (beamerthemeGA.sty, v1.0, 2022).
//
// Geometry, colours, fonts and box metrics are taken 1:1 from the original
// .sty and verified against a pdflatex render of the template (page 160x90 mm,
// true "big point" sizes; 1 bp = 1 pt). Key measured anchors (mm from the top
// of the 160x90 mm page):
//   header gradient rule   y 12.45   (uniblau -> mittelblau, full bleed)
//   hellblau accent        y 13.21   (right 57.6 mm = 0.36 x paperwidth)
//   frametitle cap-top     y 17.7    (LARGE 17 pt bold, uniblau)
//   first block bar-top    y 25.99
//   footer bar             y 83.82   (grau10, 6.1 mm tall)

#let colors = (
  uniblau:       rgb(21, 50, 104),
  hellblau:      rgb(188, 206, 226),
  weiss:         rgb(255, 255, 255),
  schwarz:       rgb(0, 0, 0),
  dunkelblau:    rgb(0, 101, 141),
  mittelblau:    rgb(0, 147, 199),
  himmelblau:    rgb(132, 191, 234),
  chamois:       rgb(234, 226, 216),
  altweiss:      rgb(246, 244, 240),
  grau90:        rgb(59, 59, 58),
  grau80:        rgb(87, 87, 86),
  grau60:        rgb(135, 135, 134),
  grau20:        rgb(217, 218, 218),
  grau10:        rgb(236, 236, 237),
  tablebluedark: rgb(42, 54, 89),
  tableblue:     rgb(167, 195, 221),
)

#let uni-name = "Georg-August-Universität Göttingen"
// GA wordmark, rendered at width 35 mm in the beamer headline.
#let logo = image("assets/logo-2.pdf", width: 35mm)

// Page furniture (headline rules + logo + short institute, footline bar +
// texts). Absolutely placed in mm from the page origin so it matches the
// beamer templates exactly; used as the page `background`.
#let ga-furniture(short-institute: none, date: none) = context {
  let pw = 160mm
  place(top + left, dx: 0mm, dy: 0mm, box(width: pw, height: 90mm)[
    // --- headline ---
    // upperheadrule: uniblau -> mittelblau gradient hairline, full bleed
    #place(top + left, dx: 0mm, dy: 12.45mm,
      rect(width: pw, height: 0.30mm,
        fill: gradient.linear(colors.uniblau, colors.mittelblau)))
    // hellblau accent, right 0.36 x paperwidth
    #place(top + left, dx: pw - 57.6mm, dy: 13.21mm,
      rect(width: 57.6mm, height: 0.32mm, fill: colors.hellblau))
    // GA wordmark
    #place(top + left, dx: 5.3mm, dy: 2.8mm, logo)
    // short institute (institute in head/foot = grau60)
    #if short-institute != none {
      place(top + right, dx: -8mm, dy: 5.0mm,
        text(font: ("Latin Modern Sans", "Arial"), size: 9pt,
             fill: colors.grau60, short-institute))
    }
    // --- footline ---
    #place(top + left, dx: 0mm, dy: 83.82mm,
      rect(width: pw, height: 6.18mm, fill: colors.grau10))
    #place(top + left, dx: 0mm, dy: 85.9mm, box(width: pw, {
      set text(font: ("Latin Modern Sans", "Arial"), size: 6pt)
      grid(
        columns: (1fr, auto, 1fr),
        align: (left + horizon, center + horizon, right + horizon),
        pad(left: 3.65mm, text(fill: colors.grau60)[#date]),
        text(fill: colors.uniblau)[#uni-name],
        pad(right: 3.65mm, text(fill: colors.grau60)[#counter(page).display()]),
      )
    }))
  ])
}

// The main wrapper: 16:9 page at the beamer paper size, furniture, typography.
#let ga-slides(
  title: none,
  subtitle: none,
  author: none,
  institute: none,
  date: none,
  short-institute: none,
  body,
) = {
  let si = if short-institute != none { short-institute } else { institute }
  set page(
    width: 160mm,
    height: 90mm,
    margin: (left: 12.6mm, right: 12.6mm, top: 15.9mm, bottom: 6.6mm),
    background: ga-furniture(short-institute: si, date: date),
  )

  // Beamer bp sizes: normalsize 11 bp / 13.6 bp lead.
  set text(font: ("Latin Modern Sans", "Arial"), size: 11pt, fill: colors.grau80, lang: "en")
  set par(justify: false, leading: 0.5em, spacing: 0.6em)
  // itemize item: round $\bullet$ (drawn; LM Sans U+2022 is squarish) in the
  // structure colour (grau80).
  let ga-bullet = box(baseline: -0.16em, circle(radius: 1.3pt, fill: colors.grau80))
  set list(marker: ga-bullet, indent: 0.65em, body-indent: 0.6em, spacing: 0.53em)
  set enum(numbering: "1.", indent: 0.65em, body-indent: 0.6em, spacing: 0.53em)

  body
}

// Title page — GA `title page` template: vfill, huge uniblau title, large bold
// uniblau subtitle (0.25em below), then author / (institute) / date in the
// normal grey, all left-aligned and vertically centred.
#let title-slide(
  title: none,
  subtitle: none,
  author: none,
  institute: none,
  date: none,
) = {
  pagebreak(weak: true)
  v(1fr)
  text(size: 20pt, weight: "bold", fill: colors.uniblau, title)
  if subtitle != none {
    v(0.25em)
    text(size: 12pt, weight: "bold", fill: colors.uniblau, subtitle)
  }
  v(1em)
  text(size: 11pt, fill: colors.grau80, author)
  if institute != none {
    linebreak()
    text(size: 11pt, fill: colors.grau80, institute)
  }
  if date != none {
    v(0.5em)
    text(size: 11pt, fill: colors.grau80, date)
  }
  v(1fr)
}

// A content slide with an optional frame title (LARGE 17 pt bold uniblau).
#let slide(title: none, body) = {
  pagebreak(weak: true)
  if title != none {
    text(size: 17pt, weight: "bold", fill: colors.uniblau, title)
    v(2.7mm, weak: false)
  }
  body
}

// GA block = beamer `beamerboxesrounded`: rounded (~4 bp) box, coloured title
// bar, soft transition band, tinted body. No shadow (theme uses shadow=false).
// Default `body-fill` is a 15% tint of the bar colour (uniblau!15 / hellblau!15);
// coloured blocks pass 30% (chamois!30, dunkelblau!30, …).
#let ga-block(
  fill: colors.uniblau,
  textcolor: colors.weiss,
  body-fill: auto,
  title-size: 11pt,
  body-size: 11pt,
  title: none,
  body,
) = {
  let tint = if body-fill == auto { fill.transparentize(85%) } else { body-fill }
  // Outer block owns the inter-block spacing and keeps the box atomic; the
  // inner pad bleeds the coloured box 4 bp (1.41 mm) past the text width on
  // each side, exactly as beamerboxesrounded does, while the body text keeps
  // the full text width so line breaks match the LaTeX template.
  // The parts are stacked (not laid out as markup) so no paragraph leading
  // creeps in between the title bar, the transition line and the body.
  let parts = ()
  if title != none {
    parts.push(box(
      width: 100%,
      fill: fill,
      inset: (x: 1.41mm, top: 0.5mm, bottom: 0.5mm),
    )[#text(fill: textcolor, size: title-size, title)])
    // soft title -> body transition (bmb@transition)
    parts.push(box(width: 100%, height: 0.2mm,
      fill: gradient.linear(fill, tint, angle: 90deg)))
  }
  parts.push(box(
    width: 100%,
    fill: tint,
    inset: (x: 1.41mm, top: 1.2mm, bottom: 1.2mm),
  )[#text(size: body-size)[#body]])
  block(above: 3.3mm, below: 0mm, breakable: false, width: 100%,
    pad(x: -1.41mm, block(
      width: 100%,
      radius: 1.4mm,
      clip: true,
      stroke: none,
      stack(dir: ttb, spacing: 0mm, ..parts),
    )))
}

#let uniblau-block(title: none, title-size: 11pt, body-size: 11pt, body) = ga-block(fill: colors.uniblau, title-size: title-size, body-size: body-size, title: title, body)
#let dunkelblau-block(title: none, title-size: 11pt, body-size: 11pt, body) = ga-block(fill: colors.dunkelblau, body-fill: colors.dunkelblau.transparentize(70%), title-size: title-size, body-size: body-size, title: title, body)
#let alert-block(title: none, title-size: 11pt, body-size: 11pt, body) = ga-block(fill: colors.hellblau, textcolor: colors.grau80, title-size: title-size, body-size: body-size, title: title, body)
#let example-block(title: none, title-size: 11pt, body-size: 11pt, body) = ga-block(fill: colors.chamois, textcolor: colors.grau80, body-fill: colors.chamois.transparentize(70%), title-size: title-size, body-size: body-size, title: title, body)
#let grau-block(title: none, title-size: 11pt, body-size: 11pt, body) = ga-block(fill: colors.grau80, body-fill: colors.grau80.transparentize(70%), title-size: title-size, body-size: body-size, title: title, body)

// Inline highlight in the university blue.
#let hl(body) = text(fill: colors.uniblau, weight: "bold", body)
