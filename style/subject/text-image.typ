#import "./subject.typ": palette
#import "./content.typ": subject-shell

#let text-image-layout(
  ..image-args,
  text-body: [],
  text-width: 1fr,
  image-width: 1fr,
  swap-sides: false,
  column-gap: 1.05em,
  image-max-width: 96%,
  image-max-height: 88%,
) = block(width: 100%, height: 100%)[
  #let text-column = [
    #block(width: 100%, height: 100%)[
      #align(left + horizon)[
        #set text(size: 0.82em, fill: palette.ink)
        #set par(leading: 0.62em)
        #text-body
      ]
    ]
  ]

  #let image-column = [
    #block(width: 100%, height: 100%)[
      #align(center + horizon)[
        #image(
          ..image-args,
          width: image-max-width,
          height: image-max-height,
          fit: "contain",
        )
      ]
    ]
  ]

  #grid(
    columns: if swap-sides {
      (image-width, text-width)
    } else {
      (text-width, image-width)
    },
    column-gutter: column-gap,
    if swap-sides { image-column } else { text-column },
    if swap-sides { text-column } else { image-column },
  )
]

#let subject-text-image-page(
  ..image-args,
  title: none,
  subtitle: none,
  top-content: [],
  text-body: [],
  header-left-offset: 0pt,
  swap-sides: false,
  column-gap: 1.05em,
  text-width: 1fr,
  image-width: 1fr,
  image-max-width: 96%,
  image-max-height: 88%,
) = subject-shell(
  title: title,
  subtitle: subtitle,
  top-content: top-content,
  header-left-offset: header-left-offset,
  body: [
    #text-image-layout(
      ..image-args,
      text-body: text-body,
      text-width: text-width,
      image-width: image-width,
      swap-sides: swap-sides,
      column-gap: column-gap,
      image-max-width: image-max-width,
      image-max-height: image-max-height,
    )
  ],
)
