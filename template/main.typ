// Starter deck for the GAUG Typst presentation template.
// Compile:  typst compile main.typ
// Docs, fonts and the full component list:
//   https://github.com/andbbus/gaug-typst-presentation-template

#import "@preview/gaug-slides:1.0.0": *

#show: ga-slides.with(
  title: "Your Presentation Title",
  author: "Your Name",
  short-institute: "Institute / Chair / Working Group",
  date: "2026",
)

// ------------------------------------------------------------------ title
#title-slide(
  title: "Your Presentation Title",
  subtitle: "An optional subtitle",
  author: "Your Name",
  institute: "Institute / Chair / Working Group",
  date: "1 January 2026",
)

// ------------------------------------------------------------------ content
#slide(title: "A first slide")[
  #uniblau-block(title: "A block")[
    - A first point
    - A second point, with #hl[an inline highlight]
  ]
  Text can also sit directly on the slide.
]

#slide(title: "A two-column slide")[
  #grid(
    columns: (48fr, 52fr),
    gutter: 8mm,
    [
      - Point one
      - Point two
      - Point three
    ],
    example-block(title: "Side note")[
      A little room for details, an example, or a small figure.
    ],
  )
]

// ------------------------------------------------------------------ closing
#slide[
  #v(1.2cm)
  #align(center)[
    #text(size: 20pt, weight: "bold", fill: colors.uniblau)[Thank you!]
    #v(0.9em)
    #text(size: 11pt, fill: colors.grau60)[your.name\@uni-goettingen.de]
  ]
]
