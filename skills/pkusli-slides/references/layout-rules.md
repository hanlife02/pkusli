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

## Text Density

- One slide should carry one main idea.
- Page titles: 6-14 Chinese characters, no long sentence.
- `top-content`: one conclusion sentence, ideally 22-42 Chinese characters.
- Content slides: 3-5 bullets, each 12-28 Chinese characters.
- Paragraph-only slides: at most 2-3 short paragraphs, each 40-70 Chinese characters.
- If content exceeds 6 bullets or one long paragraph, split into multiple slides before reducing font size.
- Do not put explanation paragraphs in captions.

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

## Overflow Handling

When content is too dense, apply this order:

1. Shorten title and `top-content`.
2. Convert paragraphs to bullets.
3. Split 6+ bullets into multiple slides.
4. Reduce text on image-text pages to 3-4 bullets.
5. Preserve default font sizes.
6. Report remaining layout risk in the final response.

Do not solve overflow by shrinking text aggressively, overloading captions, or adding more than three images to a triple-gallery page.
