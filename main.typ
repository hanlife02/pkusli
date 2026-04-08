#import "style/index.typ": presentation-theme
#import "slides/index.typ": cover-page, subject-content-page

#show: presentation-theme

#cover-page(
  title: [数智校园项目汇报模板],
  subtitle: [PPT 模板 3 背景改造为 Touying 演示文稿模板],
  author: [杨晗],
  institution: [Peking University],
  date: [2026-04-09],
)

#subject-content-page(
  icon: [01],
  title: [内容页模板],
  subtitle: [Subject Template],
  content: [
    #set text(size: 0.82em, fill: rgb("#2D2523"))
    #set par(leading: 0.62em)

    这一页保留了 subject 模板的基础结构：

    - 上方左侧是图标卡片。
    - 上方右侧是标题区域，可以选择显示或留空。
    - 下方是一整块主体内容区域，目前先用白色 card 标出边界。

    后续可以继续在这个骨架下细分目录页、内容页、章节页等不同模板，而不需要重复调整整体版式。
  ],
)
