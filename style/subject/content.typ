#import "./subject.typ": palette, soft-card, subject-slide

#let subject-title-card(
  title: none,
  subtitle: none,
) = soft-card(
  inset: (x: 0.72em, y: 0.38em),
  height: 2.8em,
)[
  #if title != none [
    #block(width: 100%, height: 100%)[
      #align(center + horizon)[
        #set text(top-edge: "bounds", bottom-edge: "bounds")
        #text(size: 1.48em, weight: "bold", fill: palette.ink)[#title]
      ]
    ]
  ]
]

#let subject-content-card(body) = soft-card(
  inset: 0.95em,
  width: 100%,
  height: 100%,
)[
  #body
]

#let subject-summary-card(
  body: [],
  height: 2.35em,
) = soft-card(
  inset: (x: 0.95em, y: 0.58em),
  width: 100%,
  height: height,
)[
  #align(center + horizon)[
    #block(width: 100%)[
      #set align(center)
      #set text(size: 0.78em, fill: palette.muted)
      #body
    ]
  ]
]

#let subject-shell(
  title: none,
  subtitle: none,
  top-content: [],
  body: [],
  header-left-offset: 0pt,
  body-gap: 0.58em,
  inner-gap: 0.58em,
  top-card-height: 2.35em,
) = subject-slide(
  title: auto,
  content: [
    #block(width: 100%, height: 100%)[
      #grid(
        rows: (auto, 1fr),
        row-gutter: body-gap,
        [
          #if title != none or subtitle != none [
            #block(width: 100%, inset: (left: header-left-offset))[
              #subject-title-card(title: title, subtitle: subtitle)
            ]
          ]
        ],
        [
          #grid(
            rows: (top-card-height, 1fr),
            row-gutter: inner-gap,
            [
              #subject-summary-card(
                body: top-content,
                height: top-card-height,
              )
            ],
            [
              #subject-content-card[#body]
            ],
          )
        ],
      )
    ]
  ],
)

#let subject-content-page(
  title: none,
  subtitle: none,
  top-content: [],
  content: [],
  header-left-offset: 0pt,
) = subject-shell(
  title: title,
  subtitle: subtitle,
  top-content: top-content,
  header-left-offset: header-left-offset,
  body: [
    #content
  ],
)
