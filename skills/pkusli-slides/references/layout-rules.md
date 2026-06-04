# pkusli Layout Rules

Use these rules when generating or editing `main.typ`. They are practical layout constraints for the current Typst/Touying template, not general presentation advice.

## Deck Structure

- Keep agenda sections between 3 and 6 items; default to 4.
- Expand 1-2 user-provided sections to 3-4 sections.
- Merge 7+ user-provided sections down to at most 6.
- Use `NN / 标题` section labels, starting at `01`.
- Keep each agenda title to 4-10 Chinese characters when possible.
- Default draft length: 8-12 slides.
- Short talk: 6-8 slides.
- Formal defense or complete proposal: 12-18 slides.
- Preserve this shape unless the user asks otherwise: cover, agenda, transition pages, content pages, optional references, end page.
- For normal decks, substantive content pages should outnumber transition pages. Avoid decks where cover, agenda, transitions, references, and end pages dominate the PDF.

## Text Density

- One slide should carry one main idea.
- Page titles: 6-14 Chinese characters, no long sentence.
- `top-content`: one conclusion sentence, ideally 22-42 Chinese characters.
- Content slides: 3-5 bullets, each 12-28 Chinese characters.
- Paragraph-only slides: at most 2-3 short paragraphs, each 40-70 Chinese characters.
- If content exceeds 6 bullets or one long paragraph, split into multiple slides before reducing font size.
- Avoid underfilled slides. A normal content slide should not contain only a title plus one short sentence.
- If a generated slide looks sparse, add concrete examples, implications, next actions, or a second supporting block before accepting it.
- Do not put explanation paragraphs in captions.
- Minimum counts are lower bounds, not final acceptance. A page can still fail if rendered content occupies only a small corner or narrow band of the available content area.

## Minimum Content Density

Use these lower bounds to avoid pages with large empty areas:

- `subject-content-page`: at least 3 bullets, or 2 short paragraphs, plus a meaningful `top-content`.
- `subject-text-image-page`: at least 3 bullets in `text-body`, one image, and one caption.
- `subject-triple-gallery-page`: exactly 3 image/content slots, 3 captions, and a 30-70 Chinese character bottom summary.
- `transition-page`: one short title plus a 24-48 Chinese character `description`; do not leave description empty.
- `references-manual-page`: at least 2 entries when shown.

Visual density expectations:

- `subject-content-page`: content should visually fill the body area, not sit only in the upper-left corner. The lower 35-40% of the body must contain information, not just background or empty card space.
- For `subject-content-page`, prefer one of these filled structures:
  - 2 short paragraphs plus 4-5 developed bullets.
  - 4-5 bullets plus a bottom takeaway, implication, or action block.
  - Two compact columns, such as "适用场景 / 修改入口", "优势 / 注意事项", or "问题 / 修复方式".
- `subject-text-image-page`: if the image is only a placeholder, keep it secondary and make the text column carry the useful information.
- `subject-triple-gallery-page`: when real images are unavailable, use text/content cards or richer captions instead of repeating low-information placeholder images.

If a page falls below these lower bounds, do one of the following before finalizing:

1. Add useful concrete details that support the slide's main idea.
2. Merge it with an adjacent page covering the same section.
3. Convert the page to a better-fitting template, such as from `subject-content-page` to `subject-text-image-page`.
4. Remove the page if it does not add a distinct idea.
5. Add another substantive content page in the same section if transition pages are dominating the deck.

## Page-Specific Rules

### `agenda-page`

- Use 3-6 sections.
- Prefer 4 sections for normal decks.
- Compress long section names before changing style parameters.

### `transition-page`

- Use one per agenda section.
- `title`: 4-10 Chinese characters.
- `description`: 24-48 Chinese characters.
- Do not include lists or detailed arguments.

### `subject-content-page`

- Use for conclusions, steps, methods, tradeoffs, and key points.
- `title`: 6-14 Chinese characters.
- `top-content`: one sentence.
- `content`: 3-5 bullets or 2-3 short paragraphs.
- Split into two slides if the content becomes dense.

### `subject-text-image-page`

- Use exactly one main image.
- Include `image-caption` unless the image is purely decorative.
- Text body should have 3-4 bullets.
- Default widths: `text-width: 1fr`, `image-width: 1fr`.
- Image-first page: `text-width: 0.85fr`, `image-width: 1.15fr`.
- Text-first page: `text-width: 1.15fr`, `image-width: 0.85fr`.
- Keep the default `contain` behavior; do not crop by default.
- Prefer 16:9, 4:3, or 3:2 images for main diagrams and screenshots.
- For vertical images, reduce text and consider `swap-sides` only when it improves reading.
- For ultra-wide images, suggest cropping or splitting across slides instead of forcing them into one page.

### `subject-triple-gallery-page`

- Use only when there are exactly 3 comparable objects.
- Use three same-type images when possible.
- Captions should be 8-18 Chinese characters.
- Bottom `text-body`: 1-2 sentences, 30-70 Chinese characters.
- If the user gives 2 images, prefer `subject-text-image-page` or two image-text pages.
- If the user gives 4+ images, select the key 3 or split across multiple gallery pages.

### References

- Use `references-manual-page` for fewer than 5 manual entries.
- Use `references-page` when a `.bib` file is intended.
- Keep each manual entry to 1-2 lines.

## Captions

- Main image caption format: `图 N. 图片内容。`
- Main image captions: 12-24 Chinese characters.
- Triple-gallery captions: 8-18 Chinese characters.
- Captions describe the image, not the conclusion.
- Increment image numbers across image-text pages when practical.

Good:

```text
图 2. 数据处理流程示意图。
```

Bad:

```text
图 2. 这张图展示了我们如何从原始数据出发，经过清洗、建模、推理和结果展示得到最终判断。
```

## Image Defaults

- Image priority: user-provided assets, then `figures/`, then `figures/background.png`.
- Recommend user assets at least 1280x720 for landscape images.
- Keep gallery images similar in aspect ratio and visual weight.
- Do not edit image files unless the user asks.
- Tune only page parameters by default: `image-width`, `text-width`, `image-max-width`, `image-max-height`, `swap-sides`, `image-height`.
- Reusing `figures/background.png` is acceptable for preview, but it must not be treated as evidence or substantive visual content.

## Overflow Handling

When content is too dense, apply this order:

1. Shorten title and `top-content`.
2. Convert paragraphs to bullets.
3. Split 6+ bullets into multiple slides.
4. Reduce text on image-text pages to 3-4 bullets.
5. Preserve default font sizes.
6. Report remaining layout risk in the final response.

Do not solve overflow by shrinking text aggressively, overloading captions, or adding more than three images to a triple-gallery page.

## Underfill Handling

When content is too sparse, apply this order:

1. Check the rendered page, not just the source text. If the lower 35-40% of a content page has no information-bearing text, image, table, or content card, treat it as underfilled.
2. Add a second information zone near the lower half: bottom takeaway, checklist, example, constraint, risk, next action, or two-column comparison.
3. Increase information density through content, not font-size tricks. Prefer developed bullets, short supporting paragraphs, or a second compact block.
4. Add a supporting image with a concise caption only when it carries information. Placeholder images do not count as filling the page.
5. Merge the slide with the previous or next slide if they share the same purpose.
6. Replace a low-density content page with a richer page type, such as text-image or triple-gallery with text cards.
7. Report remaining underfill risk in the final response if the user did not provide enough content.

Do not leave content pages with only one bullet, only one short sentence, an empty-looking image area, or a visibly empty lower half.

After compiling, render or inspect representative PDF pages when possible. If a content page still shows large blank areas despite meeting the bullet-count rules, revise the content or page type before finalizing.

## Filled Content Patterns

Use these patterns when a normal text page would leave the bottom half empty:

- "观点 + 证据 + 行动": one conclusion sentence, 3 evidence bullets, then a bottom action/checklist block.
- "分工双栏": two columns comparing files, roles, risks, or decisions; each column should have 2-3 short bullets.
- "问题修复": top explains the problem, bottom lists specific repairs or acceptance checks.
- "示例驱动": top gives the rule, bottom gives a concrete example, command, or expected output.
- "图文降权": when the only image is `figures/background.png`, use a smaller image area and make text carry at least five concrete points.

Avoid a page whose only content is a title, one summary card, and a short list near the upper-left.

## Validation Prompt

Use this prompt for a quick end-to-end layout test in a temporary copy of the project:

```text
$pkusli-slides 把这个项目改成一份关于「北京大学新生课程介绍」的 10 分钟演示稿。你可以自行补全内容，要求版面不要拥挤，图片用现有素材占位，完成后编译验证。
```

The generated deck should pass these checks:

- Agenda has 3-6 sections.
- Page titles are short and specific.
- `top-content` entries are one concise conclusion sentence.
- Content pages use 3-5 bullets or short paragraphs.
- Content pages are not underfilled; no page has only a title plus one short sentence.
- Rendered content pages do not leave the main body area mostly empty.
- Rendered content pages do not leave the lower 35-40% as only background or empty card space.
- Image-text pages have exactly one main image and a concise caption.
- Image-text pages have at least 3 bullets or equivalent explanatory text.
- Placeholder images are not used as the main source of information.
- Triple-gallery pages have exactly 3 comparable objects.
- Triple-gallery pages have 3 captions and a meaningful bottom summary.
- Captions describe image content instead of explaining the whole argument.
- `typst compile main.typ` succeeds.
- Final response reports any layout assumptions, overflow risk, or underfill risk.
