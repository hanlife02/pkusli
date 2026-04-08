#import "../../style/subject/subject.typ": palette, soft-card, subject-slide

#let subject-icon-card(
  icon: [01],
  width: 2.9em,
  height: 2.9em,
) = soft-card(
  inset: 0pt,
  width: width,
  height: height,
)[
  #set align(center + horizon)
  #text(size: 0.88em, weight: "bold", fill: palette.primary)[#icon]
]

#let subject-title-card(
  title: none,
  subtitle: none,
) = soft-card(
  inset: (x: 0.8em, y: 0.6em),
  height: 2.9em,
)[
  #set align(left + horizon)
  #if title != none [
    #text(size: 0.84em, weight: "bold", fill: palette.ink)[#title]
  ]
  #if subtitle != none [
    #if title != none [
      #v(0.08em)
    ]
    #text(size: 0.58em, fill: palette.muted)[#subtitle]
  ]
]

#let subject-content-card(body) = soft-card(
  inset: 0.95em,
  width: 100%,
  height: 100%,
)[
  #body
]

#let subject-shell(
  icon: [01],
  title: none,
  subtitle: none,
  body: [],
  header-gap: 0.6em,
  body-gap: 0.58em,
) = subject-slide(
  title: auto,
  content: [
    #block(width: 100%, height: 100%)[
      #grid(
        rows: (auto, 1fr),
        row-gutter: body-gap,
        [
          #if title == none and subtitle == none [
            #subject-icon-card(icon: icon)
          ] else [
            #grid(
              columns: (auto, 1fr),
              column-gutter: header-gap,
              [#subject-icon-card(icon: icon)],
              [#subject-title-card(title: title, subtitle: subtitle)],
            )
          ]
        ],
        [
          #subject-content-card[#body]
        ],
      )
    ]
  ],
)

#let subject-content-page(
  icon: [TXT],
  title: none,
  subtitle: none,
  content: [],
) = subject-shell(
  icon: icon,
  title: title,
  subtitle: subtitle,
  body: [
    #content
  ],
)
