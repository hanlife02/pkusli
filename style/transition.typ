#import "./subject/subject.typ": palette, subject-slide
#import "./shared/base.typ": soft-card

#let transition-page(
  title: none,
  description: none,
  part-label: [第一部分],
  number: [01],
  marker: [PART],
  left-width: 14.2em,
  column-gap: 1.6em,
  left-card-height: 20em,
  right-card-height: 20em,
  left-card-dx: 0pt,
  left-card-dy: 0pt,
  right-card-dx: 0pt,
  right-card-dy: 0pt,
  left-card-fill: white.transparentize(6%),
  right-card-fill: white.transparentize(6%),
) = subject-slide(
  title: auto,
  content: [
    #block(width: 100%, height: 100%)[
      #align(center + horizon)[
        #grid(
          columns: (left-width, 1fr),
          column-gutter: column-gap,
          [
            #block(width: 100%, height: left-card-height)[
              #place(
                center + horizon,
                dx: left-card-dx,
                dy: left-card-dy,
                soft-card(
                  inset: (x: 0.9em, y: 0.85em),
                  width: 100%,
                  height: left-card-height,
                  fill: left-card-fill,
                )[
                  #block(width: 100%, height: 100%)[
                    #align(center + horizon)[
                      #set align(center + horizon)
                      #text(size: 4.2em, weight: "bold", fill: palette.ink.transparentize(28%))[#marker]
                      #v(-0.02em)
                      #text(size: 3.1em, weight: "bold", fill: palette.primary)[#number]
                    ]
                  ]
                ],
              )
            ]
          ],
          [
            #block(width: 100%, height: right-card-height)[
              #place(
                center + horizon,
                dx: right-card-dx,
                dy: right-card-dy,
                soft-card(
                  inset: (x: 1.35em, y: 1.1em),
                  width: 100%,
                  height: right-card-height,
                  fill: right-card-fill,
                )[
                  #block(width: 100%, height: 100%)[
                    #align(left + horizon)[
                      #set par(leading: 0.72em)
                      #text(size: 2.45em, weight: "bold", fill: palette.ink)[#title]
                      #if description != none [
                        #v(0.38em)
                        #block(width: 84%)[
                          #set text(size: 1.02em, fill: palette.muted)
                          #description
                        ]
                      ]
                    ]
                  ]
                ],
              )
            ]
          ],
        )
      ]
    ]
  ],
)
