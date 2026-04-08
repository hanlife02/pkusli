#import "../presentation-theme.typ": reference-slide, soft-card, tag-badge, palette, reference-item

#let references-page(
  summary-title: [建议保持同一引用风格],
  summary-body: [],
  items: (),
) = reference-slide(
  content: [
    #soft-card[
      #tag-badge([FORMAT])
      #v(0.32em)
      #text(size: 0.78em, weight: "bold", fill: palette.ink)[#summary-title]
      #v(0.12em)
      #text(size: 0.64em, fill: palette.muted)[#summary-body]
      #v(0.42em)
      #for item in items [
        #reference-item(item.at("index"), item.at("title"), item.at("detail"))
        #v(0.24em)
      ]
    ]
  ],
)
