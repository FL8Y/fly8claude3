---
name: fly8-brand-design
description: Project-specific brand, logo, Android launcher-icon, and visual-design skill for FLY8 Clone. Use before generating, reviewing, or revising FLY8 brand assets or UI direction.
---

# FLY8 Clone Brand & Visual Design Skill

## Mission

Create a recognizable, original visual identity for FLY8 Clone: an Android utility for running app instances/clones and keeping multiple app contexts distinct. The design should feel engineered, light, controlled, dependable, and premium—not like generic cloud storage, a game cheat tool, a random cyberpunk wallpaper, or an AI-generated template.

Read `design/FLY8-CLONE-LOGO-MASTER-PROMPT.md` before starting a logo task. It contains the product brief, canonical image prompt, review council, scorecard, negative prompt, and refinement protocol.

Also read `design/FLY8-PROMPT-QA-COUNCIL.md` before generation. Run its prompt-only completeness, ambiguity, and adversarial-council checks before using the image model. Keep prompt scores separate from scores for the actual generated image.

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

Default direction: a custom abstract pictorial mark with negative-space intelligence and near-flat vector clarity, plus only a controlled touch of dimensionality if it materially improves the mark. Do not assume a glossy 3D style just because the product is digital.

Current preferred concept: a **forked-core / dual-channel mark**. One compact asymmetrical core has a continuous primary path that deliberately branches into two offset, independently readable channels. The path geometry—not a second pasted-on card—must encode one app context becoming a separate instance. Use a central negative-space core to anchor the shape. An aperture/iris hint may exist only as subordinate negative space if it helps; it must not read primarily as an eye, camera, or biometric scanner.

Before committing, compare at least three structurally distinct routes, including the current route, an F/8-derived abstract monogram, and another distinct negative-space/parallel-path concept. Score each for product fit, ownability, silhouette, small-size potential, and likely category confusion. The forked-core concept is preferred, not sacred: if it fails the cliché or silhouette test, replace it before generation. Never combine all routes into a cluttered mark.

Do not let the result collapse into a literal human eye, infinity sign, generic clone icon, cloud/file icon, or two equal rounded squares.

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


### Concept challenger gate (required for logos)

Before locking a concept, compare at least three distinct routes and score product fit, ownability, silhouette, and small-size potential. The preferred forked-core/dual-channel concept is not sacred: challenge it against a custom FLY8 split-core sigil and a parallel-path negative-space mark. Do not default to an iris/camera construction. If another route wins, rewrite the master prompt's geometry rather than forcing the preferred concept. Never combine all routes into one cluttered mark.

Before generation, run a completeness pass, cliché pass, contradiction pass, downscale pass, and skeptical usefulness pass. Record concise findings and resulting edits. Long prompts need useful constraints, not repeated adjectives.

### Android asset handoff

Treat the white-canvas composition as a presentation proof, not a launcher-ready asset. When tools allow, crop the dark tile, check multiple pixel sizes and adaptive masks, and prepare foreground/background layers only if they can be exported accurately. Never claim SVG, vector, adaptive-icon, or small-size testing unless those outputs or tests actually exist.

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

Use up to eight purposeful review/refinement cycles per deliverable, or stop earlier only when the five-star target is met. If all scores are not 5/5 after eight cycles or generation limitations prevent more iterations, do not pretend otherwise: deliver the strongest candidate, list the remaining limitation, and identify the next meaningful experiment. Avoid meaningless regenerate-only loops.

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


## Extra production safeguards

- Before committing to the forked-aperture idea, compare it with a custom forked-core/dual-channel mark and a restrained F/8-inspired negative-space mark. Do not keep an aperture if it reads primarily as a camera, eye-tracking tool, or biometric scanner.
- A role-based critique council is not the same as independent human user testing or multiple independent model evaluations. Describe it accurately.
- Image-model output is raster artwork unless a separate vector-production step creates an actual SVG. “Vector-like” describes visual style, not file format.
- Do not claim 24/32/48 dp testing, grayscale export testing, adaptive-mask validation, or Android device testing unless those checks were actually performed. A conceptual review must be labelled as such.
- A high aggregate rating cannot hide a critical failure in originality, product fit, silhouette, or small-size recognition.


## Evidence and review integrity (required)

Follow the expanded procedures in `design/FLY8-CLONE-LOGO-MASTER-PROMPT.md`, especially its calibrated rubric, prompt-integrity audit, critique passes, candidate ledger, and production validation.

### Do not confuse a simulated council with independent validation
- Use the brand strategist, logo designer, Android launcher specialist, color/production reviewer, and skeptical-user lenses as separate review passes.
- If the same model/operator performs all passes, label the result a **simulated multi-lens council**. Claim an independent panel only when distinct human or model reviewers actually reviewed the candidate independently.
- Keep the first-glance pass blind to the intended metaphor where practical. Require a contrarian pass that tries to reject the favored concept.
- Persist actionable findings and evidence; do not expose hidden chain-of-thought.

### Calibrated scoring
Use the 1–5 anchors in the master prompt: 1 fails, 2 weak, 3 acceptable, 4 strong with a material weakness, 5 excellent with evidence and no material defect within the tests performed. Do not raise scores simply because the user requested five stars. Product fit, originality, 24 dp legibility, and silhouette are critical gates that cannot be hidden by a high average.

Label claims as **observed**, **checked**, **inferred**, or **unknown**. If an icon has not actually been downscaled and inspected, its small-size legibility is not tested. If no user study was run, memorability is a design judgment rather than a measured user outcome.

### Practical output checks
When the actual image file and tools are available:
1. Inspect the full-resolution candidate for artifacts, accidental text, unwanted elements, and geometric defects.
2. Create and inspect 24 px, 32 px, and 48 px previews at actual display size.
3. Check grayscale and a single-color silhouette.
4. Test rounded-square and circular crops or adaptive-mask safe margins where practical.
5. Compare each candidate against the current best at matched size and conditions.
6. Record what was checked and what remains untested.

Re-open the generated previews after export; a successful file write is not visual verification. If tools are unavailable, document the validation as pending rather than inventing a result.

### Upstream reference integrity
Relevant upstream sources include the [core UI/UX Pro Max skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/blob/main/.claude/skills/ui-ux-pro-max/SKILL.md), [logo design workflow](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/blob/main/cli/assets/skills/design/references/logo-design.md), [logo style guide](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/blob/main/cli/assets/skills/design/references/logo-style-guide.md), [logo color psychology](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/blob/main/cli/assets/skills/design/references/logo-color-psychology.md), and [logo prompt engineering](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill/blob/main/cli/assets/skills/design/references/logo-prompt-engineering.md).

Read relevant guidance and verify it fits the product before using it. Do not claim an upstream CLI query, script run, or installation unless it actually happened. The FLY8-specific skill is informed by the upstream project; it is not a vendored copy.
