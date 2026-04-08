#import "style/index.typ": presentation-theme
#import "slides/index.typ": (
  agenda-page,
  cover-page,
  end-page,
  references-pages,
  subject-content-page,
  subject-text-image-page,
  subject-triple-gallery-page,
  transition-page,
)
#import "references-display.typ": reference-items

#let report-title = [数智校园建设项目汇报]
#let report-subtitle = [Touying 演示模板示例]
#let report-author = [Ethan]
#let report-institution = [Peking University]
#let report-date = [2026-04-09]
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
    [01 / 项目背景与建设目标],
    [02 / 总体方案与架构思路],
    [03 / 阶段成果与示例展示],
    [04 / 参考资料与总结],
  ),
)

#transition-page(
  number: [01],
  marker: [PART],
  left-card-dx: 0pt,
  left-card-dy: 1.5em,
  right-card-dx: 0pt,
  right-card-dy: 1.5em,
  title: [项目背景与建设目标],
  description: [先交代建设背景、目标边界和本次汇报的核心判断，让后续页面有明确落点。],
)

#subject-content-page(
  title: [建设背景与核心目标],
  header-left-offset: 10em,
  top-content: [一句话结论：项目建设的目标不是“做系统”，而是形成可持续迭代的校园数据服务能力。],
  content: [
    当前项目可以先按三条主线来组织：

    - 业务目标：打通教学、管理、服务三类场景，避免“只做数据大屏”的空转建设。
    - 建设原则：统一入口、统一数据口径、统一权限模型，减少后期系统割裂。
    - 交付方式：优先做可见成果，再逐步补齐底层平台能力，控制试点风险。

    如果只是写文字、列表、表格或阶段总结，这一页就足够覆盖大多数正文场景。
  ],
)

#subject-text-image-page(
  demo-image,
  title: [总体方案与架构思路],
  header-left-offset: 10em,
  top-content: [一句话结论：先明确数据链路和服务对象，再决定平台拆分方式。],
  image-caption: [图 1. 校园数智化平台总体方案示意图。],
  text-body: [
    这一页适合放“左文右图”或“左图右文”的方案说明：

    - 左侧写架构说明、模块职责、实施要点。
    - 右侧放系统架构图、流程图或原型图。
    - 如果想改成左图右文，直接加 `swap-sides: true`。
    - 如果文字更多，可以把 `text-width` 调大一些。

    当前这里用背景图做占位，实际使用时只需要替换成你的业务图即可。
  ],
)

#transition-page(
  number: [02],
  marker: [PART],
  left-card-dy: 1.5em,
  right-card-dy: 1.5em,
  title: [阶段成果与示例展示],
  description: [这一部分适合放原型截图、阶段成果、模块对比图或并列案例。],
)

#subject-triple-gallery-page(
  title: [阶段成果展示],
  header-left-offset: 10em,
  body-gap: 1.1em,
  image-one: demo-image,
  image-one-caption: [模块一：统一门户或首页工作台。],
  image-two: demo-image,
  image-two-caption: [模块二：业务专题页面或可视化看板。],
  image-three: demo-image,
  image-three-caption: [模块三：移动端或流程服务入口。],
  text-body: [
    三图页更适合展示同一主题下的三类成果、三个阶段、或三组对比案例。实际使用时，把三张占位图替换成真实截图，再把下方说明改成统一结论即可。
  ],
)

#references-pages(
  entries: reference-items,
  per-page: 3,
)

#end-page(
  title: [谢谢聆听],
  author: report-author,
  institution: report-institution,
  date: report-date,
)
