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
  image("template3-background-small-logo.png", width: 100%, height: 100%),
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

#let slide-heading(title, kicker: none) = block(width: 100%)[
  #soft-card(inset: (x: 0.9em, y: 0.58em), radius: 12pt)[
    #if kicker != none [
      #text(size: 0.56em, weight: "bold", fill: palette.primary, tracking: 0.12em)[#kicker]
      #v(0.1em)
    ]
    #text(size: 1.04em, weight: "bold", fill: palette.ink)[#title]
  ]
]

#let top-info-panel(title, kicker: none) = grid(
  columns: (18em, 1fr),
  column-gutter: 0.7em,
  [],
  [#slide-heading(title, kicker: kicker)],
)

#let top-visual-slot(height: 9em) = block(
  width: 100%,
  height: height,
)[]

#let top-side-panel(
  title,
  kicker: none,
  body: none,
) = soft-card(
  inset: (x: 1em, y: 0.86em),
  radius: 18pt,
  width: 100%,
  height: 100%,
  fill: white.transparentize(8%),
)[
  #if kicker != none [
    #text(size: 0.56em, weight: "bold", fill: palette.primary, tracking: 0.12em)[#kicker]
    #v(0.12em)
  ]
  #text(size: 1.08em, weight: "bold", fill: palette.ink)[#title]
  #if body != none [
    #v(0.3em)
    #line(length: 100%, stroke: 1pt + palette.line)
    #v(0.26em)
    #set text(size: 0.62em, fill: palette.muted)
    #set par(leading: 0.5em)
    #body
  ]
]

#let main-stage(body) = block(width: 100%, height: 100%)[
  #soft-card(inset: 0.95em, radius: 16pt, height: 100%)[
    #body
  ]
]

#let tag-badge(label) = block(
  inset: (x: 0.7em, y: 0.28em),
  radius: 999pt,
  fill: palette.primary-soft,
)[
  #text(size: 0.64em, weight: "bold", fill: palette.primary, tracking: 0.08em)[#label]
]

#let point-card(title, body) = soft-card[
  #text(size: 0.76em, weight: "bold", fill: palette.ink)[#title]
  #v(0.16em)
  #set text(size: 0.66em, fill: palette.muted)
  #set par(leading: 0.5em)
  #body
]

#let visual-placeholder(
  title: [图片占位区],
  subtitle: [替换为 16:9 图片、图表或流程图],
  height: 9.8em,
) = block(
  width: 100%,
  height: height,
  inset: 0.95em,
  radius: 16pt,
  clip: true,
  fill: gradient.linear(rgb("#F8EEEE"), rgb("#FBF8F3"), angle: 35deg),
  stroke: 1pt + rgb("#D7C0BB"),
)[
  #set align(center + horizon)
  #text(size: 0.84em, weight: "bold", fill: palette.primary)[#title]
  #v(0.14em)
  #text(size: 0.6em, fill: palette.muted)[#subtitle]
]

#let toc-entry(index, title, note) = soft-card(inset: (x: 0.7em, y: 0.52em), radius: 12pt)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.55em,
    [
      #block(
        width: 1.45em,
        height: 1.45em,
        radius: 999pt,
        fill: palette.primary,
      )[
        #set align(center + horizon)
        #text(size: 0.64em, weight: "bold", fill: white)[#index]
      ]
    ],
    [
      #text(size: 0.76em, weight: "bold", fill: palette.ink)[#title]
      #v(0.06em)
      #text(size: 0.6em, fill: palette.muted)[#note]
    ],
  )
]

#let reference-item(index, title, detail) = block(width: 100%)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.7em,
    [
      #text(size: 0.68em, weight: "bold", fill: palette.primary)[#index]
    ],
    [
      #text(size: 0.66em, weight: "bold", fill: palette.ink)[#title]
      #v(0.05em)
      #text(size: 0.58em, fill: palette.muted)[#detail]
    ],
  )
]

#let content-slide(title: auto, kicker: none, side-panel: auto, content: []) = touying-slide-wrapper(self => {
  if title != auto {
    self.store.title = title
  }

  let panel-body = if side-panel == auto { none } else { side-panel }

  self = utils.merge-dicts(
    self,
    config-page(
      background: page-background(),
      margin: (top: 2.1em, bottom: 1.25em, x: 1.35em),
      header: self => [],
      footer: self => page-footer(self),
    ),
  )

  touying-slide(
    self: self,
    block(width: 100%)[
      #if title != auto [
        #grid(
          rows: (9em, 1fr),
          row-gutter: 0.78em,
          [
            #grid(
              columns: (1fr, 18.4em),
              column-gutter: 0.78em,
              [#top-visual-slot()],
              [#top-side-panel(title, kicker: kicker, body: panel-body)],
            )
          ],
          [#main-stage(content)],
        )
      ] else [
        #main-stage(content)
      ]
    ],
  )
})

#let cover-slide(..args) = touying-slide-wrapper(self => {
  let info = self.info + args.named()

  self = utils.merge-dicts(
    self,
    config-page(
      background: page-background(),
      margin: (top: 1.5em, bottom: 1.5em, x: 1.45em),
      header: self => [],
      footer: self => [],
    ),
  )

  touying-slide(
    self: self,
    align(center + horizon)[
      #block(width: 52%, inset: (x: 0.4em, y: 0.2em))[
        #set align(center + horizon)
        #text(size: 2.02em, weight: "bold", fill: palette.ink)[#info.title]
        #if info.subtitle != none [
          #v(0.32em)
          #text(size: 0.92em, fill: palette.primary)[#info.subtitle]
        ]
        #v(0.9em)
        #line(length: 38%, stroke: 1.1pt + palette.line)
        #v(0.62em)
        #if info.author != none [
          #text(size: 0.9em, weight: "bold", fill: palette.primary)[#info.author]
        ]
        #if info.institution != none [
          #v(0.16em)
          #text(size: 0.78em, fill: palette.muted)[#info.institution]
        ]
        #if info.date != none [
          #v(0.16em)
          #text(size: 0.76em, fill: palette.muted)[#utils.display-info-date(self)]
        ]
      ]
    ],
  )
})

#let toc-slide(title: [目录], kicker: [CONTENTS], content: []) = content-slide(title: title, kicker: kicker, content: content)

#let image-right-slide(
  title: auto,
  kicker: none,
  side-panel: auto,
  image: visual-placeholder(),
  image-width: 42%,
  content: [],
) = content-slide(
  title: title,
  kicker: kicker,
  side-panel: side-panel,
  content: [
    #grid(
      columns: (1fr, image-width),
      column-gutter: 0.58em,
      [
        #soft-card[#content]
      ],
      [
        #image
      ],
    )
  ],
)

#let image-left-slide(
  title: auto,
  kicker: none,
  side-panel: auto,
  image: visual-placeholder(),
  image-width: 42%,
  content: [],
) = content-slide(
  title: title,
  kicker: kicker,
  side-panel: side-panel,
  content: [
    #grid(
      columns: (image-width, 1fr),
      column-gutter: 0.58em,
      [
        #image
      ],
      [
        #soft-card[#content]
      ],
    )
  ],
)

#let visual-top-slide(
  title: auto,
  kicker: none,
  side-panel: auto,
  image: visual-placeholder(height: 9.2em),
  content: [],
) = content-slide(
  title: title,
  kicker: kicker,
  side-panel: side-panel,
  content: [
    #grid(
      rows: (auto, auto),
      row-gutter: 0.42em,
      [
        #image
      ],
      [
        #content
      ],
    )
  ],
)

#let reference-slide(title: [参考文献], kicker: [REFERENCES], content: []) = content-slide(title: title, kicker: kicker, content: content)

#let presentation-theme(
  aspect-ratio: "16-9",
  footer: none,
  ..args,
  body,
) = {
  set text(font: ("Avenir Next", "PingFang SC", "Noto Sans CJK SC", "Helvetica Neue"), size: 15.5pt)
  set par(justify: false, leading: 0.5em)
  set list(marker: ([•], [◦], [▪]))
  show strong: it => text(weight: "bold", fill: palette.primary)[#it.body]

  show: touying-slides.with(
    config-page(
      paper: "presentation-" + aspect-ratio,
      margin: (top: 1.4em, bottom: 1.2em, x: 1.35em),
    ),
    config-common(
      slide-fn: content-slide,
    ),
    config-methods(
      alert: utils.alert-with-primary-color,
    ),
    config-colors(
      primary: palette.primary,
      secondary: palette.accent,
      neutral-lightest: white,
      neutral-darkest: palette.ink,
    ),
    config-store(
      title: none,
      subtitle: none,
      footer: footer,
      date: none,
      institution: none,
    ),
    ..args,
  )

  body
}
