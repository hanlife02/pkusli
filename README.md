# pkusli

一个基于 Typst 与 [Touying](https://typst.app/universe/package/touying/) 的演示模板。

> **先看这里**
>
> 如果你想先快速了解使用方式，建议优先阅读本文档中的快速上手、页面模板说明和 AI 协作说明。

仓库里已经包含一份可直接打开的示例源文件 [`main.typ`](main.typ) 和导出的 [`main.pdf`](main.pdf)。如果你要把它改成自己的汇报，通常只需要替换封面信息、正文内容、图片素材和参考文献。

## 这个模板提供什么

- 一套可直接改写的中文正式汇报版式，而不是从零搭建 PPT。
- 一份完整示例工程，包含源文件、导出 PDF、图片素材和参考文献入口。
- 按页面类型封装好的调用方式，方便你先改内容，再决定是否调整样式。

## 技术栈

- Typst
- Touying `0.6.1`
- 自定义主题与页面组件

## 项目结构

```text
.
├── main.typ                 # 演示入口文件
├── main.pdf                 # 当前导出结果
├── references.bib           # BibTeX 参考文献
├── references-display.typ   # 参考文献展示条目
├── figures/                 # 图片与图形素材
├── slides/                  # 页面级封装与导出入口
└── style/                   # 主题样式、封面、正文布局组件
```

最常接触的几个入口：

- [`main.typ`](main.typ)：整套演示的总入口，负责封面信息、目录和页面调用顺序。
- [`slides/`](slides)：按页面类型组织的调用入口。
- [`style/`](style)：主题样式和版式实现；如果只是替换自己的汇报内容，通常不需要先改这里。
- [`figures/`](figures)：封面图、正文配图、截图和图标素材。
- [`页面模板与用法示例.md`](页面模板与用法示例.md)：当前项目的页面模板说明、常用参数和可复制示例。

## 快速上手

1. 打开 [`main.typ`](main.typ)，修改标题、作者、机构、日期等基础信息。
2. 调整目录页 `sections`，传入 3 到 6 个目录项，让演示结构和你的汇报提纲对齐。
3. 按页面类型替换正文内容，把示例文案改成你的项目背景、方案、结果或结论。
4. 把配图放进 [`figures/`](figures) 并更新图片路径。
5. 最后执行构建命令导出 PDF。

如果你只是想尽快做出一份可用的初稿，优先修改内容层，不要一开始就改底层样式。

## 构建

本机当前已安装 `typst 0.13.1`。在项目根目录执行：

```bash
typst compile main.typ
```

如果需要指定输出文件：

```bash
typst compile main.typ main.pdf
```

## 当前模板包含的页面类型

- 封面页
- 目录页
- 分节过渡页
- 通用正文页
- 图文混排页
- 三图展示页
- 参考文献页
- 结束页

> 页面模板说明：[页面模板与用法示例.md](页面模板与用法示例.md)

## AI Agent 快速使用

只按这一套流程走：

1. Clone 本项目。

   ```bash
   git clone git@github.com:hanlife02/pkusli.git
   cd pkusli
   ```

2. 在项目根目录打开 AI Agent，例如 Codex 或 Claude Code。

3. 让 Agent 安装本项目 Skill 到本地。

   ```text
   帮我安装本项目的 Skill 到本地。
   ```

   本项目的 Skill 源文件位于 `.agents/skills/pkusli-slides`。

4. 使用 Skill 完成演示稿。

   ```text
   $pkusli-slides 把这个项目改成一份关于「你的主题」的演示稿。如果信息不够，请一次性问完需要的问题，然后更新 task.md、config.md 和 main.typ，并运行 typst compile main.typ 验证。
   ```

如果 Codex 没有识别 `$pkusli-slides`，请让 Agent 检查本地 Skill 安装位置，然后重启 Codex 再试。

## 适用场景

这个模板更适合正式汇报、项目阶段总结、方案宣讲和院校或机构内部展示。默认文案和字体风格偏中文正式汇报场景；如果要改成英文演示或产品发布型风格，建议同步调整字体、字号和页面留白。

## 相关资料

- 页面模板说明：[页面模板与用法示例.md](页面模板与用法示例.md)
- AI 协作说明：[AI_README.md](AI_README.md)
