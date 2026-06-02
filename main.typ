#import "style/index.typ": presentation-theme
#import "slides/index.typ": (
  agenda-page, cover-page, end-page, references-manual-page, subject-content-page, subject-text-image-page,
  subject-triple-gallery-page, transition-page,
)

#let report-title = [pkusli]
#let report-subtitle = none
#let report-author = [Ethan]
#let report-institution = [Peking University]
#let report-date = [2026-06-02]
#let demo-image = "figures/background.png"

#show: presentation-theme

#cover-page(
  title: report-title,
  subtitle: report-subtitle,
  author: report-author,
  institution: report-institution,
  date: report-date,
)

#agenda-page(
  left-card-dy: 1.5em,
  right-card-dy: 1.5em,
  sections: (
    [01 / 模板概览],
    [02 / 快速上手],
    [03 / 常见修改入口],
    [04 / 构建导出与协作],
  ),
)

#transition-page(
  number: [01],
  marker: [PART],
  left-card-dx: 0pt,
  left-card-dy: 1.5em,
  right-card-dx: 0pt,
  right-card-dy: 1.5em,
  title: [模板概览],
  description: [先让用户知道这个仓库能做什么、适合什么场景，以及它已经替你准备好了哪些页面能力。],
)

#subject-content-page(
  title: [这个模板能帮你什么],
  header-left-offset: 10em,
  top-content: [一句话结论：`pkusli` 已经提供了一套适合中文正式汇报的 Touying 演示结构，你只需要替换内容，而不必从零搭版。],
  content: [
    从用户视角看，这个项目最有价值的是三件事：

    - 开箱即用：仓库里已经带有 `main.typ`、示例页面、示例图片和导出的 `main.pdf`，适合直接改造。
    - 页面齐全：默认包含封面页、目录页、过渡页、正文页、图文页、三图页、参考文献页和结束页。
    - 场景明确：更适合正式汇报、项目总结、方案宣讲和院校或机构内部展示，不需要自己重新搭建整体视觉风格。

    如果你的目标是“尽快做出一份看起来完整、结构稳定的中文 PPT”，这个模板已经覆盖了大多数常见需求。
  ],
)

#subject-text-image-page(
  demo-image,
  title: [仓库结构与文件职责],
  header-left-offset: 10em,
  top-content: [一句话结论：真正需要频繁接触的入口并不多，先理解 `main.typ`、`slides/`、`style/` 和 `figures/` 的分工即可。],
  image-caption: [图 1. 仓库内置示例背景图，可作为图片占位与布局预览素材。],
  text-body: [
    使用时可以按下面的方式理解项目结构：

    - `main.typ`：整套演示的总入口，负责定义封面信息、目录和每一页的调用顺序。
    - `slides/`：页面级封装入口，按页面类型组织调用方式，方便你直接挑选现成页面。
    - `style/`：主题样式和版式实现，如果只是写自己的汇报，通常不需要先改这里。
    - `figures/`：存放封面图、正文配图、截图或图标素材；替换图片时优先改这里的文件路径。

    推荐先改内容层，再决定是否需要动样式层。这样更稳，也更容易控制改动范围。
  ],
)

#transition-page(
  number: [02],
  marker: [PART],
  left-card-dy: 1.5em,
  right-card-dy: 1.5em,
  title: [快速上手],
  description: [这一部分只讲最短路径，让第一次接触 Typst 模板的用户也能快速产出自己的演示稿。],
)

#subject-content-page(
  title: [从零开始的最短路径],
  header-left-offset: 10em,
  top-content: [一句话结论：先改封面信息，再改目录和正文，最后替换图片并导出 PDF，是上手成本最低的方式。],
  content: [
    如果你第一次使用这个模板，可以按照这个顺序操作：

    - 第一步：打开 `main.typ`，修改标题、作者、单位、日期等基础信息。
    - 第二步：调整目录页 `sections`，让整体结构先和你的汇报提纲对齐。
    - 第三步：按页面类型替换正文内容，把示例文本改成你的项目背景、方案、结果或结论。
    - 第四步：把 `figures/` 中的占位图换成你的截图、架构图或配图，再检查说明文字。

    这个顺序的好处是：你总能先得到一份“完整但未精修”的初稿，然后再逐页补细节。
  ],
)

#subject-text-image-page(
  demo-image,
  title: [你最常改的几个地方],
  header-left-offset: 10em,
  top-content: [一句话结论：大多数用户只需要改变量、目录和页面文本，不需要一开始就碰底层样式。],
  image-caption: [图 2. 当前模板可直接复用示意图位，后续再替换为你的业务图片或截图。],
  text-body: [
    日常制作自己的 PPT 时，最常见的修改入口通常是这些：

    - 封面信息：`report-title`、`report-author`、`report-institution`、`report-date`。
    - 目录页：`agenda-page` 里的 `sections`，决定整套演示的章节结构。
    - 页面内容：正文页里的 `title`、`top-content`、`content` 或 `text-body`。
    - 图片区域：图文页和三图页中的图片路径与图注说明。

    只要先把这几类内容替换掉，你就已经从“模板示例”切换成“自己的汇报”了。
  ],
)

#transition-page(
  number: [03],
  marker: [PART],
  left-card-dy: 1.5em,
  right-card-dy: 1.5em,
  title: [常见修改入口],
  description: [这里把模板里最常用的三种正文页面放在一起，帮助用户按内容类型挑选合适版式。],
)

#subject-triple-gallery-page(
  title: [三类常用页面怎么选],
  header-left-offset: 10em,
  body-gap: 1.1em,
  image-one: demo-image,
  image-one-caption: [正文页：适合结论、列表、步骤、表格说明。],
  image-two: demo-image,
  image-two-caption: [图文页：适合“左文右图”或“左图右文”的方案说明。],
  image-three: demo-image,
  image-three-caption: [三图页：适合展示三组成果、三类模块或三个阶段。],
  text-body: [
    选页的原则很简单：纯信息密集型内容优先用正文页，需要讲解图示时用图文页，要并列展示多个结果时用三图页。先按内容组织页面，再决定是否扩展样式，通常能得到更稳定的成稿效果。
  ],
)

#transition-page(
  number: [04],
  marker: [PART],
  left-card-dy: 1.5em,
  right-card-dy: 1.5em,
  title: [构建导出与协作],
  description: [完成内容替换后，最后只需要导出 PDF，并在需要时借助 `task.md` 和 `config.md` 与 AI 协作。],
)

#subject-content-page(
  title: [导出方式与 AI 协作建议],
  header-left-offset: 10em,
  top-content: [一句话结论：日常导出只需要一条 Typst 命令；如果你希望 AI 稳定修改模板，优先把任务要求写进 `task.md` 和 `config.md`。],
  content: [
    实际使用时，建议把“构建”和“协作”分开理解：

    - 导出 PDF：在项目根目录执行 `typst compile main.typ`，默认会生成或覆盖 `main.pdf`。
    - 指定输出：如果你想显式指定文件名，也可以执行 `typst compile main.typ main.pdf`。
    - AI 协作：先写 `task.md` 说明目标、背景、约束和验收标准，再写 `config.md` 提供标题、目录、正文和图片配置。
    - `ulw` 模式：如果你还没准备好这两个文件，可以像这次一样先给出需求，让 AI 逐步追问并代为生成。

    这样做的核心价值是减少反复沟通，让模板修改更可控，也更接近“按配置产出内容”的工作流。
  ],
)

#references-manual-page(
  entries: (
    [Touying package documentation. Typst Universe. 用于说明本模板所基于的演示框架与调用方式。],
    [Typst documentation. Typst 官方文档. 用于说明 `typst compile` 构建方式和 Typst 文档编写基础。],
    [项目仓库 `README.md`. 用于说明仓库结构、模板页面类型、`ulw` 模式和推荐协作流程。],
  ),
)

#end-page(
  title: [谢谢聆听],
  author: report-author,
  institution: report-institution,
  date: report-date,
)
