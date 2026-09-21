// Example deck for the GAUG Typst presentation template.
// Build:  typst compile example.typ
// (Requires the "Latin Modern Sans" font — see README.)

#import "ga-slides.typ": *

#show: ga-slides.with(
  title: "GAUG Typst Presentation Template",
  author: "Your Name",
  short-institute: "Institute / Chair / Working Group",
  date: "2026",
)

// ------------------------------------------------------------------ title
#title-slide(
  title: "A Typst Presentation Template",
  subtitle: "In the style of the Georg-August-Universität Göttingen",
  author: "Your Name",
  institute: "Institute / Chair / Working Group",
  date: "21 September 2026",
)

// ------------------------------------------------------------------ blocks
#slide(title: "Coloured blocks")[
  #uniblau-block(title: "Standard block (uniblau)")[
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur *ac lorem*
    vitae velit euismod tincidunt.
    - Nam quis nulla vitae arcu porta luctus.
    - Vivamus #hl[highlighted] sed magna nec sem.
  ]
  #alert-block(title: "Alert block (hellblau)")[
    Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad
    minim veniam, quis nostrud exercitation.
  ]
]

// ------------------------------------------------------------------ more blocks
#slide(title: "The full block palette")[
  #example-block(title: "Example block (chamois)")[
    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.
  ]
  #dunkelblau-block(title: "Dunkelblau block")[
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia.
  ]
  #grau-block(title: "Grau block")[
    Neque porro quisquam est qui dolorem ipsum quia dolor sit amet.
  ]
]

// ------------------------------------------------------------------ lists / text
#slide(title: "Lists, enumerations and inline text")[
  Plain paragraph text sits directly on the slide. Lorem ipsum dolor sit amet,
  consectetur adipiscing elit, sed do eiusmod tempor.

  #uniblau-block(title: "A numbered procedure")[
    + Lorem ipsum dolor sit amet, consectetur adipiscing elit.
    + Sed do eiusmod tempor incididunt ut labore et dolore.
    + Ut enim ad minim veniam, quis nostrud exercitation ullamco.
  ]

  Use #hl[`#hl[...]`] to emphasise a phrase in the university blue.
]

// ------------------------------------------------------------------ two columns
#slide(title: "Two-column layout")[
  #grid(
    columns: (48%, 52%),
    gutter: 8mm,
    align: (horizon, horizon),
    [
      - Lorem ipsum dolor sit amet.
      - Consectetur adipiscing elit.
      - Sed do eiusmod tempor incididunt.
      - Ut labore et dolore magna aliqua.
    ],
    example-block(title: "Side note")[
      Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia
      deserunt mollit anim id est laborum.
    ],
  )
]

// ------------------------------------------------------------------ closing
#slide[
  #v(1.2cm)
  #align(center)[
    #text(size: 20pt, weight: "bold", fill: colors.uniblau)[Thank you for your attention]
    #v(0.9em)
    #text(size: 11pt, fill: colors.grau60)[your.name\@uni-goettingen.de]
  ]
]
