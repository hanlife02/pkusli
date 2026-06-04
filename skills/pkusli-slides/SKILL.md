---
name: pkusli-slides
description: Use when creating, editing, or compiling a Typst/Touying presentation based on the pkusli template, especially when the user wants an AI agent to generate slides from a short request, task.md, or config.md with minimal back-and-forth.
---

# pkusli Slides

Use this skill to turn a short presentation request into a compiled `pkusli` Typst/Touying deck with as few user turns as practical.

## Workflow

1. Read `README.md`, `task.md`, `config.md`, and `main.typ` before editing.
2. Read `references/layout-rules.md` before generating or rewriting slide content.
3. If the user request plus `task.md` and `config.md` already provide a clear topic, audience, structure, and content direction, start implementation without asking more questions.
4. If critical information is missing, ask at most one batch of up to 6 questions. Do not ask one question per turn.
5. If the user asks for a draft, says to fill gaps yourself, or leaves non-critical fields blank, choose reasonable defaults for a formal Chinese presentation.
6. Default to editing only `main.typ`, `task.md`, and `config.md`.
7. Do not edit `slides/`, `style/`, or `figures/` unless the user explicitly asks for new page components, theme changes, or asset changes.
8. Apply the layout rules while choosing page types, agenda count, text length, image sizing, and captions.
9. After editing, run `typst compile main.typ`.
10. If compilation succeeds and PDF rendering tools are available, render or visually inspect representative PDF pages before finalizing.
11. If compilation fails, fix the error once and recompile. If it still fails, report the exact blocker.
12. Final response: summarize changed files, compile result, output PDF path, layout assumptions, and any remaining overflow, underfill, or missing-asset risk.

## One-Batch Questions

When the input is too vague to produce a useful deck, ask this compact set and allow blanks:

```text
为了一次完成初稿，请补充下面信息。可以留空，留空的部分我会按正式中文汇报场景补全：

1. 演示主题是什么？
2. 目标受众是谁？
3. 使用场景是什么，例如课程汇报、项目汇报、方案宣讲？
4. 希望目录分为哪 3-6 部分？
5. 每部分有哪些必须出现的要点？
6. 是否有目标页数、汇报时长、图片素材、图片比例、参考文献、排版密度或作者单位日期要求？
```

## Defaults

- Subtitle: use `none` when absent.
- Date: use the current date for a new deck; preserve the existing date for small edits.
- Images: reuse `figures/background.png` as a placeholder when no user image is provided.
- References: preserve the references page when present; replace entries with topic-relevant placeholders if needed.
- Sections: keep 3 to 6 sections. Expand sparse requests to 3 sections, and merge overlong outlines to at most 6 sections.
- Single-topic requests: use an overview, method, results, and summary structure unless a better domain-specific structure is obvious.

## Implementation Rules

- Prefer existing page components imported from `slides/index.typ`.
- Keep content edits in `main.typ`; avoid changing theme internals.
- Keep `task.md` as the task brief and `config.md` as the user-facing content configuration.
- Use `页面模板与用法示例.md` only when you need page parameters or examples.
- Preserve a complete deck shape: cover, agenda, section transitions, content pages, optional references, and end page.
- Prefer splitting dense content into more slides over shrinking font sizes.
- Avoid underfilled pages; if a content page has only a title plus one short sentence or one bullet, add useful detail, merge it, or change the page type.
- Treat minimum bullet counts as necessary but not sufficient; if rendered content visibly occupies only a small corner or thin band of a content page, add concrete examples, constraints, checks, or another content page.
- Apply the bottom-half rule: if a rendered content page leaves the lower 35-40% of the main body as only background or empty card space, the page fails even when bullet counts pass.
- Repair bottom-half failures by adding a second information zone, such as a bottom takeaway, two-column comparison, checklist, example block, constraint/risk block, or by changing to a richer page type.
- Do not let low-information placeholder images stand in for substantive content. If only a placeholder image is available, reduce its visual role and fill the page with useful text.
- Add concise captions for image-text and gallery pages.
- Before the final response, check whether any agenda item, title, summary, body text, image, caption, or low-density page violates `references/layout-rules.md`.

## References

- `references/layout-rules.md`: layout density, agenda count, image ratio, caption, and overflow rules.
