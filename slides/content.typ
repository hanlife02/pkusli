#import "../presentation-theme.typ": content-slide, image-right-slide, image-left-slide, visual-top-slide, palette, visual-placeholder, tag-badge, point-card, soft-card

#let bullets(items) = {
  set text(size: 0.66em, fill: palette.muted)
  list(..items.map(item => [#item]))
}

#let top-summary(
  badge: none,
  heading: [],
  body: [],
) = [
  #if badge != none [
    #tag-badge(badge)
    #v(0.3em)
  ]
  #text(size: 0.76em, weight: "bold", fill: palette.ink)[#heading]
  #v(0.14em)
  #body
]

#let style-a(
  title: auto,
  badge: [SCENARIO],
  heading: [适用场景],
  bullets-list: (),
  note-title: [页面提示],
  note-body: [],
  image-title: [图片占位区],
  image-subtitle: [替换为图片、图表或流程图],
) = image-right-slide(
  title: title,
  kicker: [STYLE A],
  side-panel: top-summary(
    badge: badge,
    heading: heading,
  ),
  image: visual-placeholder(
    title: image-title,
    subtitle: image-subtitle,
    height: 9.4em,
  ),
  content: [
    #tag-badge(badge)
    #v(0.32em)
    #text(size: 0.78em, weight: "bold", fill: palette.ink)[#heading]
    #v(0.12em)
    #bullets(bullets-list)
    #v(0.38em)
    #point-card(note-title, [#note-body])
  ],
)

#let style-b(
  title: auto,
  badge: [CASE STUDY],
  heading: [讲述方式],
  bullets-list: (),
  note-title: [页面提示],
  note-body: [],
  image-title: [图片占位区],
  image-subtitle: [替换为图片、图表或流程图],
) = image-left-slide(
  title: title,
  kicker: [STYLE B],
  side-panel: top-summary(
    badge: badge,
    heading: heading,
  ),
  image: visual-placeholder(
    title: image-title,
    subtitle: image-subtitle,
    height: 9.4em,
  ),
  content: [
    #tag-badge(badge)
    #v(0.32em)
    #text(size: 0.78em, weight: "bold", fill: palette.ink)[#heading]
    #v(0.12em)
    #bullets(bullets-list)
    #v(0.38em)
    #point-card(note-title, [#note-body])
  ],
)

#let style-c(
  title: auto,
  image-title: [图片占位区],
  image-subtitle: [替换为图片、图表或流程图],
  cards: (),
) = visual-top-slide(
  title: title,
  kicker: [STYLE C],
  side-panel: top-summary(
    badge: [KEY INSIGHTS],
    heading: [图上结论拆解],
  ),
  image: visual-placeholder(
    title: image-title,
    subtitle: image-subtitle,
    height: 8.6em,
  ),
  content: [
    #grid(
      columns: (1fr, 1fr, 1fr),
      column-gutter: 0.48em,
      ..cards.map(card => [#point-card(card.at("title"), [#card.at("body")])]),
    )
  ],
)

#let style-d(
  title: auto,
  left-badge: [VERSION A],
  left-title: [方案 A],
  left-subtitle: [左侧对比图说明],
  right-badge: [VERSION B],
  right-title: [方案 B],
  right-subtitle: [右侧对比图说明],
  note-title: [对比说明],
  note-body: [],
) = content-slide(
  title: title,
  kicker: [STYLE D],
  side-panel: top-summary(
    badge: [COMPARISON],
    heading: note-title,
  ),
  content: [
    #grid(
      rows: (auto, auto),
      row-gutter: 0.42em,
      [
        #grid(
          columns: (1fr, 1fr),
          column-gutter: 0.58em,
          [
            #soft-card[
              #tag-badge(left-badge)
              #v(0.28em)
              #visual-placeholder(
                title: left-title,
                subtitle: left-subtitle,
                height: 7.8em,
              )
            ]
          ],
          [
            #soft-card[
              #tag-badge(right-badge)
              #v(0.28em)
              #visual-placeholder(
                title: right-title,
                subtitle: right-subtitle,
                height: 7.8em,
              )
            ]
          ],
        )
      ],
      [
        #point-card(note-title, [#note-body])
      ],
    )
  ],
)
