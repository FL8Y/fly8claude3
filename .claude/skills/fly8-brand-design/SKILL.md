---
name: fly8-brand-design
description: Project-specific brand, logo, Android launcher-icon, and visual-design skill for FLY8 Clone. Use before generating, reviewing, or revising FLY8 brand assets or UI direction.
---

# FLY8 Clone Brand & Visual Design Skill

## Mission

Create a recognizable, original visual identity for FLY8 Clone: an Android utility for running app instances/clones and keeping multiple app contexts distinct. The design should feel engineered, light, controlled, dependable, and premium—not like generic cloud storage, a game cheat tool, a random cyberpunk wallpaper, or an AI-generated template.

Read `design/FLY8-CLONE-LOGO-MASTER-PROMPT.md` before starting a logo task. It contains the product brief, canonical image prompt, review council, scorecard, negative prompt, and refinement protocol.

## Source of principles

This project-specific skill is informed by [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill), particularly its structured product/style/palette reasoning, logo design brief workflow, scalability checklist, negative prompts, and pre-delivery review discipline. It is not a vendored copy and does not claim that upstream scripts are installed.

When an environment has the upstream skill available, use its logo search workflow first:
- `scripts/logo/search.py "<brand + product + style intent>" --design-brief -p "FLY8 Clone"`
- Search `--domain style`, `--domain color`, and `--domain industry` as needed.
- Read the logo-style, logo-color-psychology, and logo-prompt-engineering references.
- Inspect result relevance before using it. If the tool cannot be run, say so internally and use this document as the fallback framework; do not invent search results.

## Product truths and assumptions

- Platform: Android, with a launcher icon as the primary small-format brand application.
- Product category: app cloning / separate instances and parallel app contexts.
- Main user need: recognizable, straightforward management of distinct app instances.
- Brand goal: communicate controlled duplication and separate instances, not stealing/copying data or piracy.
- Do not claim features such as stealth, security guarantees, infinite clones, or broad app compatibility unless the repository/application confirms them.
- The final mark must work without a wordmark; the app name can sit separately in launcher labels or marketing materials.
- A supplied anime/cyberpunk reference is mood context, not permission to copy its exact composition or to squeeze a full scene into the icon.

If the current project code contradicts any of these assumptions, inspect the repository and update the brief based on evidence before design.

## Brand strategy

**Attributes:** precise, capable, compact, deliberate, discreet, contemporary, technically literate.

**Personality:** professional technology tool with a distinctive cyan/blue identity. It may retain a very restrained echo of the user's futuristic/anime reference through a lens/iris metaphor, but should not become a character illustration or cyberpunk collage.

**Desired perception:** “A well-designed Android utility that creates separate instances,” not “another app with two blue squares.”

**Avoid:** generic stacked rounded rectangles, a default infinity symbol, cloud-storage metaphors, random circuitry, arbitrary orbit rings, excessive glassmorphism, stock sci-fi HUD decoration, dense glitches, text-heavy marks, and symbols that only make sense after a verbal explanation.

## Design system and color discipline

Use these established palette values as the starting palette:
- Near-black background: `#000001`
- Deep surface: `#010205`
- Deep blue panel: `#01132A`
- Primary cyan-blue: `#176E94`
- Secondary deep blue: `#01304C`
- Cool white: `#FCFDFD`
- Soft pink reference accent: `#F5DADA`
- Muted neutral: `#626773`

For the primary launcher icon, prefer a restricted palette: near-black/deep navy, one signature cyan-blue, and a small amount of cool white. Do not use every palette token just because it exists. Pink should be omitted from the core icon unless it earns a clear semantic role. Avoid rainbow/neon gradients and huge outer glows.

Keep color functional:
- Use cyan for the key idea/active edge, not for every surface.
- Use cool white sparingly for clean contrast.
- Keep dark negative spaces truly dark.
- Check the mark in grayscale and as a single-color silhouette.
- Do not claim formal WCAG contrast compliance for logo artwork; if the mark is used with text or UI, assess those elements separately.

## Logo direction

Default direction: a custom abstract pictorial mark with negative-space intelligence and near-flat vector clarity, plus only a controlled touch of dimensionality if it improves the mark. Do not assume a glossy 3D style just because the product is digital.

For the current concept, explore a **forked aperture / echo-iris** idea:
- One compact, memorable aperture/lens-like core.
- One continuous primary contour with a purposeful split or fork, indicating one app context branching into a separate instance.
- A restrained offset echo/crescent or duplicated internal cut that encodes “another instance.”
- A deliberate central negative-space pupil/core.
- Slight asymmetry is allowed if it improves recognition and makes the mark less template-like.
- Do not let the result collapse into a literal human eye, infinity sign, generic clone icon, or two equal rounded squares.

This is a concept direction, not a mandatory icon geometry. If research or critique shows it is too familiar, invent and test a different product-specific concept before generation.

## Workflow (required)

### 1. Inspect context
- Read this skill and the master prompt.
- Inspect user-provided reference images and the current repository/product UI when available.
- Separate durable requirements (palette, product, platform) from one-off preferences.
- Never claim to have executed an upstream script or inspected source files that were not actually accessed.

### 2. Build a short design brief
Write down product, user, use case, desired impression, symbol logic, palette, style, deliverable, and non-goals. If a critical requirement is unknown, make the smallest safe assumption or ask one focused question.

### 3. Explore before generating
- Consider at least three distinct conceptual routes in text.
- Compare them for product-fit, originality, silhouette, and small-scale performance.
- Pick one direction and explain its trade-off in one or two sentences.
- Use upstream style/color/industry search if available; otherwise do not fake it.

### 4. Create one focused image prompt
- Specify one logo/icon only, centered, without wordmark unless explicitly requested.
- State the internal icon tile/background, canvas/background, palette, silhouette, negative-space logic, shape hierarchy, edge treatment, and intended rendering style.
- Apply technical constraints: square 1:1 composition, crisp edges, generous safe margins, scalable shapes, and legibility at 24/32/48 dp.
- Add a specific negative prompt.
- The upstream logo reference says to present output logos on a white background. For this project, interpret that as a plain white presentation canvas containing a centered dark app-icon tile; the icon artwork itself remains dark. Do not confuse the presentation canvas with the actual launcher asset.

### 5. Adversarial review council
Review the prompt and each generated candidate through five independent lenses:
1. **Brand strategist:** Is the icon specific to FLY8 Clone and does it communicate controlled duplication?
2. **Logo designer:** Is the mark ownable, coherent, balanced, and free of clichés?
3. **Android launcher specialist:** Is it legible and distinguishable at 24, 32, and 48 dp, including adaptive masks?
4. **Visual systems/color reviewer:** Are palette, contrast, negative space, edges, and effects disciplined?
5. **Skeptical end user:** Can a person remember and distinguish it after a quick glance, without an explanation?

Each reviewer must state one strength, one failure risk, and one concrete change. Do not allow reviewers to simply agree with one another. At least one reviewer must argue against the favored concept.

### 6. Score honestly
Use the scorecard in the master prompt. Score every category from 1 to 5 and give one evidence-based sentence for each. Do not inflate scores to satisfy the target. Prioritize:
- brand fit and distinctiveness,
- small-size recognition,
- silhouette,
- production readiness.

The target is five stars in every category. A candidate is not “perfect” merely because the average is high. If any core dimension is below 5, name the failure and revise.

### 7. Refine through explicit cycles
For every revision:
1. List the top three observable weaknesses.
2. Change only the aspects needed to fix them.
3. Preserve the successful features.
4. Generate the new candidate.
5. Re-score from scratch rather than carrying forward the previous score.
6. Compare the new candidate against the previous best at small sizes and in grayscale.

Continue purposeful review/refinement cycles while each cycle has a concrete hypothesis, can plausibly improve a scored weakness, and the tools permit the work. Stop when the five-star quality gate is met on verified evidence, or when a real limitation prevents further useful validation. Never use an arbitrary cycle count to declare success; never loop without a meaningful change. If constraints prevent the gate from being met, state the remaining limitation and the next useful test instead of pretending the result is perfect.

### 8. Pre-delivery checklist
- [ ] One logo/icon; no collage or multiple alternatives in the final image.
- [ ] Distinctive silhouette with no tiny essential detail.
- [ ] Reads at 24/32/48 dp; still recognizable in grayscale.
- [ ] Not just overlapping blue squares, an infinity symbol, or generic glass panels.
- [ ] No accidental text, misspellings, watermark, UI screenshot, or fake system dialogs.
- [ ] No photorealism, heavy 3D texture, bloom, noisy glitch detail, or arbitrary decoration.
- [ ] Palette is controlled and matches established FLY8 colors.
- [ ] Plain white presentation canvas around a centered dark icon tile, unless asset export constraints explicitly require full-bleed.
- [ ] Safe margins; the symbol is not clipped by a rounded-square/adaptive icon mask.
- [ ] Critique scores and remaining caveats reported honestly.

## Delivery behavior

When asked to create an image, generate the image; don't replace it with a long explanation. After generation, provide only what the platform requires. In a design-planning or repository-editing task, show the brief/prompt, review findings, and file links.

The user values original, polished, product-specific work and has explicitly rejected generic blue overlapping panels. Do not default back to that solution.
