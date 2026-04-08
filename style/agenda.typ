#import "./subject/subject.typ": palette, subject-slide
#import "./shared/base.typ": soft-card

#let agenda-page(
  title: [目录],
  marker: [CONTENT],
  sections: (),
  left-width: 14.2em,
  column-gap: 1.6em,
  left-card-height: 20em,
  right-card-height: 20em,
  left-card-dx: 0pt,
  left-card-dy: 0pt,
  right-card-dx: 0pt,
  right-card-dy: 0pt,
  left-card-fill: none,
  right-card-fill: none,
  title-size: 2.35em,
  title-fill: palette.ink,
  marker-size: 0.96em,
  marker-fill: palette.primary,
  marker-tracking: 0.14em,
  section-size: 1.08em,
  section-fill: palette.ink,
  section-muted-fill: palette.muted,
  section-gap: 0.4em,
  row-inset: (x: 0.2em, y: 0.55em),
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
                      #text(size: title-size, weight: "bold", fill: title-fill)[#title]
                      #v(0.25em)
                      #text(
                        size: marker-size,
                        weight: "bold",
                        fill: marker-fill,
                        tracking: marker-tracking,
                      )[#marker]
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
                    #set text(size: section-size, fill: section-fill)
                    #set par(leading: 0.68em)
                    #for section in sections [
                      #block(width: 100%, inset: row-inset)[
                        #section
                      ]
                      #if section != sections.last() [
                        #v(section-gap)
                        #line(length: 100%, stroke: 1pt + palette.line)
                        #v(section-gap)
                      ]
                    ]
                    #if sections.len() == 0 [
                      #set text(fill: section-muted-fill)
                      [请在 `sections` 中传入目录项。]
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
