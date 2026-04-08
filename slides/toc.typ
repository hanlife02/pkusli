#import "../presentation-theme.typ": toc-slide, palette, soft-card

#let compact-toc-entry(index, title, note) = soft-card(inset: (x: 0.58em, y: 0.28em), radius: 10pt)[
  #grid(
    columns: (auto, 1fr),
    column-gutter: 0.42em,
    [
      #block(
        width: 1.12em,
        height: 1.12em,
        radius: 999pt,
        fill: palette.primary,
      )[
        #set align(center + horizon)
        #text(size: 0.5em, weight: "bold", fill: white)[#index]
      ]
    ],
    [
      #text(size: 0.66em, weight: "bold", fill: palette.ink)[#title]
      #v(0.01em)
      #text(size: 0.5em, fill: palette.muted)[#note]
    ],
  )
]

#let toc-page(left-entries: (), right-entries: (), title: [目录]) = toc-slide(
  title: title,
  content: [
    #let entries = left-entries + right-entries
    #grid(
      columns: (0.62fr, 1.38fr),
      column-gutter: 0.9em,
      [
        #set align(left + top)
        #text(size: 1.48em, weight: "bold", fill: palette.ink)[目录]
        #v(0.22em)
        #text(size: 0.72em, fill: palette.primary)[Contents]
      ],
      [
        #grid(
          columns: (1fr, 1fr),
          column-gutter: 0.34em,
          row-gutter: 0.18em,
          ..entries.map(entry => [
            #compact-toc-entry(entry.at("index"), entry.at("title"), entry.at("note"))
          ]),
        )
      ],
    )
  ],
)
