#import "style/index.typ": presentation-theme
#import "slides/index.typ": (
  cover-page, end-page, references-page, subject-content-page, subject-text-image-page, subject-triple-gallery-page,
  transition-page,
)

#show: presentation-theme

#cover-page(
  title: [数智校园项目汇报模板],
  subtitle: [PPT 模板 3 背景改造为 Touying 演示文稿模板],
  author: [Ethan],
  institution: [Peking University],
  date: [2026-04-09],
)

#transition-page(
  part-label: [第一部分],
  number: [01],
  marker: [PART],
  // 过渡页左右 card 可分别通过 dx / dy 单独微调位置。
  // 例如：left-card-dx: -0.4em, right-card-dy: 0.6em
  left-card-dx: 0pt,
  left-card-dy: 1.5em,
  right-card-dx: 0pt,
  right-card-dy: 1.5em,
  title: [项目背景与建设目标],
  description: [用于各个章节开始前的过渡页。左侧放章节标志和序号，右侧放章节标题与一句简短说明。],
)

#subject-content-page(
  title: [内容页模板],
  subtitle: [Subject Template],
  header-left-offset: 10em,
  top-content: [这里可以放一行概述、章节标签或当前页的关键结论。],
  content: [
    这一页保留了 subject 模板的基础结构：

    - 第一行只保留标题 card。
    - 标题 card 可以单独调整左侧偏移。
    - 主体区域拆成了上下两个 card。
    - 上面是一条适合放一行文字的小 card。
    - 下面是主要内容使用的大矩形区域。

    后续可以继续在这个骨架下细分目录页、内容页、章节页等不同模板，而不需要重复调整整体版式。
  ],
)

#subject-text-image-page(
  "figures/background.png",
  title: [内容页模板],
  subtitle: [Text + Image Template],
  header-left-offset: 10em,
  top-content: [这里可以放一行概述、章节标签或当前页的关键结论。],
  text-body: [
    这一页将下方的大矩形拆成了左右两个区域：

    - 左侧是文字区域，整体保持上下居中。
    - 右侧是图片区域，默认居中显示。
    - 图片会在限定的最大宽高内尽量放大。
    - 宽图、长图和接近正方形的图都不会被拉伸。
    - 如果后续需要，也可以单独调节左右比例和图片上限。

    这样后续只需要替换文字和图片，就能快速复用这类图文并排版式。
  ],
)

#subject-triple-gallery-page(
  title: [三图内容页模板],
  subtitle: [Triple Gallery Template],
  header-left-offset: 10em,
  body-gap: 1.1em,
  image-one: [
    #image("figures/background.png", width: 100%, height: 100%, fit: "contain")
  ],
  image-one-caption: [示意图一：用于展示第一个模块或阶段成果。],
  image-two: [
    #image("figures/background.png", width: 100%, height: 100%, fit: "contain")
  ],
  image-two-caption: [示意图二：用于展示第二个模块或并列案例。],
  image-three: [
    #image("figures/background.png", width: 100%, height: 100%, fit: "contain")
  ],
  image-three-caption: [示意图三：用于展示第三个模块或对比结果。],
  text-body: [
    这一页保留了右上角标题区域，并去掉了原本的描述卡片。

    下方主体改成上方三张连续图片、下方一段文字说明的结构，适合展示同一主题下的多张示意图、阶段对比图或并列案例图。

    后续只需要替换三张图片和下方说明文字，就可以快速复用这个版式。
  ],
)

#references-page(
  sources: read("references.bib", encoding: none),
  style: "gb-7714-2015-numeric",
)

#end-page(
  author: [Ethan],
  institution: [Peking University],
  date: [2026-04-09],
)
