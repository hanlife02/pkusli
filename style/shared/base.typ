#import "@preview/touying:0.6.1": *

#let palette = (
  primary: rgb("#8F1D22"),
  primary-soft: rgb("#F4E6E7"),
  accent: rgb("#C98F5A"),
  ink: rgb("#2D2523"),
  muted: rgb("#6C5E58"),
  line: rgb("#D8C9C1"),
  card: white.transparentize(1%),
)

#let page-background() = place(
  left + top,
  dx: 0pt,
  dy: 0pt,
  image("../../figures/background.png", width: 100%, height: 100%),
)

#let page-footer(self) = context align(right + bottom)[
  #block(
    inset: (x: 0.6em, y: 0.22em),
    radius: 999pt,
    fill: white.transparentize(15%),
    stroke: 0.8pt + palette.line,
  )[
    #text(size: 0.62em, weight: "bold", fill: palette.primary)[
      #counter(page).display()
    ]
  ]
]

#let soft-card(
  body,
  fill: palette.card,
  inset: 0.82em,
  radius: 14pt,
  width: 100%,
  height: auto,
) = block(
  width: width,
  height: height,
  inset: inset,
  radius: radius,
  fill: fill,
  stroke: 0.9pt + palette.line,
)[#body]
