#import "./subject.typ": palette, soft-card, subject-slide
#import "./content.typ": subject-title-card

#let normalize-gallery-image-path(path) = if (
  type(path) == str and not path.starts-with("/") and not path.starts-with(".")
) {
  "../../" + path
} else {
  path
}

#let gallery-image-slot(
  body,
  caption: none,
  max-height: 8.6em,
) = block(width: 100%)[
  #grid(
    rows: if caption == none { (auto,) } else { (auto, auto) },
    row-gutter: if caption == none { 0pt } else { 0.4em },
    [
      #block(width: 100%, height: max-height)[
        #align(center + horizon)[
          #block(width: 100%, height: 100%)[
            #if type(body) == str or type(body) == bytes [
              #image(
                normalize-gallery-image-path(body),
                width: 100%,
                height: 100%,
                fit: "contain",
              )
            ] else [
              #body
            ]
          ]
        ]
      ]
    ],
    if caption != none [
      #set text(size: 0.58em, fill: palette.muted)
      #set par(leading: 0.52em)
      #align(center + top)[#caption]
    ],
  )
]

#let subject-triple-gallery-page(
  image-one: [],
  image-two: [],
  image-three: [],
  image-one-caption: none,
  image-two-caption: none,
  image-three-caption: none,
  title: none,
  subtitle: none,
  text-body: [],
  header-left-offset: 0pt,
  body-gap: 0.58em,
  image-gap: 0em,
  image-height: 8.6em,
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
              #subject-title-card(title: title, subtitle: subtitle, fill: none, stroke: none)
            ]
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
            #block(width: 100%, height: 100%)[
              #align(center + horizon)[
                #block(width: 100%)[
                  #grid(
                    rows: (auto, auto),
                    row-gutter: 1.8em,
                    [
                      #grid(
                        columns: (1fr, 1fr, 1fr),
                        column-gutter: image-gap,
                        [#gallery-image-slot(image-one, caption: image-one-caption, max-height: image-height)],
                        [#gallery-image-slot(image-two, caption: image-two-caption, max-height: image-height)],
                        [#gallery-image-slot(image-three, caption: image-three-caption, max-height: image-height)],
                      )
                    ],
                    [
                      #align(center + top)[
                        #block(width: 94%)[
                          #set text(size: 0.82em, fill: palette.ink)
                          #set par(leading: 0.62em)
                          #set align(center)
                          #text-body
                        ]
                      ]
                    ],
                  )
                ]
              ]
            ]
          ]
        ],
      )
    ]
  ],
)
