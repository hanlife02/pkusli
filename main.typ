#import "@preview/touying:0.6.1": *
#import "presentation-theme.typ": presentation-theme
#import "slides/index.typ": *

#let toc-left = (
  (
    index: [01],
    title: [首页封面],
    note: [右侧标题卡片，适合项目名、副标题、汇报人信息],
  ),
  (
    index: [02],
    title: [目录页面],
    note: [双列目录或目录加摘要，适合汇报结构总览],
  ),
  (
    index: [03],
    title: [内容页样式 A],
    note: [左文右图，适合背景、问题定义和方法概览],
  ),
)

#let toc-right = (
  (
    index: [04],
    title: [内容页样式 B],
    note: [左图右文，适合案例展示、产品界面和结果说明],
  ),
  (
    index: [05],
    title: [内容页样式 C],
    note: [上图下三卡，适合图表解读与重点提炼],
  ),
  (
    index: [06],
    title: [内容页样式 D],
    note: [双图对比，适合前后版本、方案 A/B 或实验对照],
  ),
)

#let style-c-cards = (
  (
    title: [结论一],
    body: [下方第一张卡总结图表里的核心发现或关键趋势。],
  ),
  (
    title: [结论二],
    body: [第二张卡放原因分析、变量变化或用户行为解释。],
  ),
  (
    title: [结论三],
    body: [第三张卡放行动建议、策略启发或下一步安排。],
  ),
)

#let reference-items = (
  (
    index: [1],
    title: [李明, 王磊. 数智校园平台建设研究],
    detail: [中国教育信息化, 2025, 31(4): 12-19.],
  ),
  (
    index: [2],
    title: [Zhang Y, Chen H. Visual Communication in Academic Presentations],
    detail: [Design Studies, 2024, 88: 101210.],
  ),
)

#show: presentation-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: [数智校园项目汇报模板],
    subtitle: [PPT 模板 3 背景改造为 Touying 演示文稿模板],
    author: [杨晗],
    institution: [Peking University],
    date: [2026-04-09],
  ),
)

#cover-page()

#toc-page(
  left-entries: toc-left,
  right-entries: toc-right,
)

#style-a(
  title: [内容页样式 A：左文右图],
  badge: [SCENARIO],
  heading: [适用场景],
  bullets-list: (
    [用一段背景说明建立上下文。],
    [用三到四个 bullet 讲清问题、目标和价值。],
    [右侧配一张信息密度高的图，减少整页纯文字。],
  ),
  note-title: [页面提示],
  note-body: [右侧图片建议使用 4:3 或 16:9，避免过细长图像；左侧正文可以加一条高亮结论作为收束。],
  image-title: [主视觉 / 示意图],
  image-subtitle: [适合放实验场景、产品界面或结构图],
)

#style-b(
  title: [内容页样式 B：左图右文],
  badge: [CASE STUDY],
  heading: [讲述方式],
  bullets-list: (
    [先用一句话定义这张图在说明什么。],
    [再按“观察现象 / 原因分析 / 结论建议”展开。],
    [如果是产品页，可把右侧改为三段卡片式说明。],
  ),
  note-title: [页面提示],
  note-body: [左图右文适合“看图说话”型页面，图片承担证据，右侧承担解释，不要让二者重复表达。],
  image-title: [案例截图 / 实验结果],
  image-subtitle: [适合放网页截图、设备照片、界面演示],
)

#style-c(
  title: [内容页样式 C：上图下三卡],
  image-title: [宽幅图表 / 地图 / 时间线],
  image-subtitle: [适合放一张横向主图，再在下方拆出三条核心结论],
  cards: style-c-cards,
)

#style-d(
  title: [内容页样式 D：双图对比],
  left-badge: [VERSION A],
  left-title: [方案 A / 改造前],
  left-subtitle: [适合放旧版页面、基线结果或原始方案],
  right-badge: [VERSION B],
  right-title: [方案 B / 改造后],
  right-subtitle: [适合放新版页面、优化结果或实验提升],
  note-title: [对比说明],
  note-body: [双图对比页适合强调前后变化、方案差异或实验效果。标题里写清楚比较维度，结论写成一句完整判断。],
)

#references-page(
  summary-title: [建议保持同一引用风格],
  summary-body: [可以使用 GB/T 7714、APA 或项目内部统一格式。下面给出适合汇报页的简洁排版示例。],
  items: reference-items,
)
