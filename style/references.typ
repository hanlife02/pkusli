#import "./subject/subject.typ": palette, soft-card, subject-slide

#let references-side-panel(
  title: [参考文献],
  marker: [REFERENCES],
  icon-path: "../figures/reference-icon.svg",
) = block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #image(icon-path, width: 4.4em)
    #v(0.58em)
    #align(center)[
      #text(size: 0.94em, weight: "bold", fill: palette.ink)[#title]
    ]
    #v(0.16em)
    #align(center)[
      #text(size: 0.58em, weight: "bold", fill: palette.muted, tracking: 0.08em)[#marker]
    ]
  ]
]

#let references-list-card(
  sources: none,
  style: "gb-7714-2015-numeric",
  full: true,
  title: none,
  text-size: 0.64em,
) = soft-card(
  inset: (x: 1.05em, y: 0.86em),
  width: 100%,
  height: 100%,
)[
  #block(width: 100%, height: 100%)[
    #set text(size: text-size, fill: palette.ink)
    #set par(leading: 0.52em)
    #bibliography(
      sources,
      title: title,
      style: style,
      full: full,
    )
  ]
]

#let references-page(
  sources: none,
  style: "gb-7714-2015-numeric",
  full: true,
  title: [参考文献],
  marker: [REFERENCES],
  icon-path: "../figures/reference-icon.svg",
  left-width: 10em,
  column-gap: 1.15em,
  text-size: 0.64em,
) = subject-slide(
  title: auto,
  content: [
    #block(width: 100%, height: 100%)[
      #grid(
        columns: (left-width, 1fr),
        column-gutter: column-gap,
        [
          #references-side-panel(
            title: title,
            marker: marker,
            icon-path: icon-path,
          )
        ],
        [
          #references-list-card(
            sources: sources,
            style: style,
            full: full,
            title: none,
            text-size: text-size,
          )
        ],
      )
    ]
  ],
)
