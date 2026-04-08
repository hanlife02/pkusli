#import "@preview/touying:0.6.1": *
#import "../shared/base.typ": page-background, palette

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
      #block(width: 88%, inset: (x: 0.4em, y: 0.2em))[
        #set align(center + horizon)
        #text(size: 2.5em, weight: "bold", fill: palette.ink)[#info.title]
        #if info.subtitle != none [
          #v(0.32em)
          #text(size: 1.28em, fill: palette.primary)[#info.subtitle]
        ]
        #v(0.1em)
        #line(length: 38%, stroke: 1.1pt + palette.line)
        #v(0.2em)
        #if info.author != none [
          #text(size: 1.2em, weight: "bold", fill: palette.primary)[#info.author]
        ]
        #if info.institution != none [
          #v(0.16em)
          #text(size: 1.0em, fill: palette.muted)[#info.institution]
        ]
        #if info.date != none [
          #v(0.16em)
          #text(size: 1.0em, fill: palette.muted)[#info.date]
        ]
      ]
    ],
  )
})
