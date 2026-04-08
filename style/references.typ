#import "./subject/subject.typ": palette, soft-card, subject-slide
#import "./subject/content.typ": subject-title-card

#let references-side-panel(
  title: [参考文献],
  marker: [REFERENCES],
  icon-path: "../figures/reference-icon.svg",
  icon-width: 4.4em,
  title-size: 0.94em,
  title-fill: palette.ink,
  marker-size: 0.58em,
  marker-fill: palette.muted,
  marker-tracking: 0.08em,
) = block(width: 100%, height: 100%)[
  #align(center + horizon)[
    #image(icon-path, width: icon-width)
    #v(0.58em)
    #align(center)[
      #text(size: title-size, weight: "bold", fill: title-fill)[#title]
    ]
    #v(0.16em)
    #align(center)[
      #text(size: marker-size, weight: "bold", fill: marker-fill, tracking: marker-tracking)[#marker]
    ]
  ]
]

#let references-list-card(
  sources: none,
  style: "gb-7714-2015-numeric",
  full: true,
  title: none,
  text-size: 0.64em,
  text-fill: palette.ink,
  text-leading: 0.52em,
  inset-x: 1.05em,
  inset-top: 0.86em,
  inset-bottom: 0.86em,
) = soft-card(
  inset: (x: inset-x, top: inset-top, bottom: inset-bottom),
  width: 100%,
  height: 100%,
)[
  #block(width: 100%, height: 100%)[
    #set text(size: text-size, fill: text-fill)
    #set par(leading: text-leading)
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
  header-left-offset: 10em,
  body-gap: 0em,
  text-size: 0.64em,
  text-fill: palette.ink,
  text-leading: 0.52em,
  list-card-inset-x: 1.05em,
  list-card-inset-top: 0.86em,
  list-card-inset-bottom: 0em,
  title-card-fill: none,
  title-card-stroke: none,
  title-card-inset: (x: 0.72em, y: 0.38em),
  title-card-height: 3.8em,
  title-size: 1.48em,
  title-weight: "bold",
  title-fill: palette.ink,
) = subject-slide(
  title: auto,
  content: [
    #block(width: 100%, height: 100%)[
      #grid(
        rows: (auto, 1fr),
        row-gutter: body-gap,
        [
          #block(width: 100%, inset: (left: header-left-offset))[
            #subject-title-card(
              title: title,
              fill: title-card-fill,
              stroke: title-card-stroke,
              inset: title-card-inset,
              height: title-card-height,
              title-size: title-size,
              title-weight: title-weight,
              title-fill: title-fill,
              page-center-offset: header-left-offset,
            )
          ]
        ],
        [
          #soft-card(
            inset: 0.95em,
            width: 100%,
            height: 100%,
            fill: none,
            stroke: none,
          )[
            #references-list-card(
              sources: sources,
              style: style,
              full: full,
              title: none,
              text-size: text-size,
              text-fill: text-fill,
              text-leading: text-leading,
              inset-x: list-card-inset-x,
              inset-top: list-card-inset-top,
              inset-bottom: list-card-inset-bottom,
            )
          ]
        ],
      )
    ]
  ],
)
