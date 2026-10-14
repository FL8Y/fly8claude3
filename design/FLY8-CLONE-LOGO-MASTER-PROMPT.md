# FLY8 Clone — Master Logo Prompt, Design Brief & 5-Star Review Protocol

**Status:** Canonical prompt for brand/icon generation  
**Owner project:** `FL8Y/fly8claude3`  
**Upstream design reference:** [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)  
**Primary deliverable:** One original Android app icon / standalone brand mark  
**Quality objective:** Five-star performance in every category, validated honestly through repeated critique and revision

> This is a project brief and production prompt, not a claim that the upstream skill or logo-generation scripts have been installed or executed. Use the upstream design-brief/style/color workflow if it is available in the active environment. Otherwise, use the documented framework below and be transparent about what was or was not run.

---

## 1. Product brief

### Product
FLY8 Clone is an Android app-cloning utility intended to help users operate separate instances or parallel contexts of applications. The design communicates controlled duplication and separation: one app context can have another distinct instance.

Do not invent product capabilities. The icon must not imply guaranteed anonymity, unbreakable security, root-level power, infinite cloning, or universal compatibility. The visual metaphor is about **separate instances**, not piracy, stealing, spying, or illicit copying.

### Primary audience
Android users who understand the practical need to keep more than one app instance or account context separate. They expect a small, polished, dependable utility rather than a toy, a cloud-storage service, a game cheat panel, or a generic AI product.

### Brand promise
**One app. A separate instance. Deliberate control.**

The mark should feel:
- technically capable, but not intimidating;
- precise, calm, compact, and intentional;
- modern, premium, and distinctive;
- lightweight and practical rather than overloaded;
- recognizable without text or an explanation.

### Existing visual context
The established project palette is:
- `#000001` — almost-black icon background;
- `#010205` — deep neutral surface;
- `#01132A` — deep blue;
- `#176E94` — signature cyan-blue;
- `#01304C` — secondary deep blue;
- `#FCFDFD` — cool white;
- `#F5DADA` — soft blush, inherited from the earlier reference;
- `#626773` — muted neutral.

The original inspiration image included a cyan-haired anime face, a luminous eye, multiple faux desktop dialogs, and dense cyberpunk interface decoration. Treat it as a hint about the user's taste for dark/cyan technology visuals—not an image to reproduce. The final logo must distill the memorable concept and remove the clutter.

### Explicitly rejected direction
A pair of glossy, overlapping, rounded blue squares is too generic. It resembles file management, cloud storage, windows, or multitasking and does not establish a distinctive FLY8 identity. Do not return to that concept with only a different gradient, bevel, lighting treatment, or background.

---

## 2. Design goal and success definition

Create **one original, ownable, product-specific pictorial mark** for FLY8 Clone. The mark should communicate parallel app instances with one clear visual idea—not by depicting every possible technology cue.

The icon should be identifiable as a coherent silhouette before a viewer notices its internal detail. It must survive launcher downscaling, adaptive icon masking, dark-mode surroundings, grayscale conversion, and simplified one-color reproduction.

The final product is not a wallpaper, poster, character illustration, UI screenshot, app-store banner, collage, or concept sheet. It is an icon whose composition is purposeful and whose visual complexity is earned.

### Central creative thesis
Explore the idea of a **forked aperture / echo iris**: one deliberate lens-like core with a single contour that branches or echoes into a second independent path. The duplication is expressed by a controlled split, offset echo, or duplicated negative-space cut—not by stacking a pile of ordinary cards.

The “eye” is an abstract geometric aperture, not a literal anime eye or a face. The central core can imply focus and identity; the echo/fork implies another instance. A slight asymmetry may make the mark recognizable and less template-like, provided it does not look accidental.

This is a strong starting concept, not a license to force bad geometry. If research or an adversarial design review shows that the aperture motif is too familiar, explore a different metaphor and document why it is more ownable before generating.

---

## 3. Mandatory pre-generation process

Before calling an image model, follow these steps:

1. **Confirm the product brief.** Restate the product category, target, brand attributes, palette, output format, and rejected directions. Correct anything contradicted by the actual project.
2. **Consult design guidance.** If the UI/UX Pro Max repo/tooling is present, start from its logo design brief workflow. Search logo style, color palette, and industry guidance, then verify result relevance. The reference lists minimalist, abstract mark, geometric, negative-space, split/fragmented, and responsive/adaptive styles as viable families. Do not use a style solely because it is trendy.
3. **Explore three genuinely different routes in writing.** For example: (A) forked aperture/echo iris, (B) a single monolithic mark with two independent internal counters, (C) a bespoke F/8-inspired abstract monogram that implies distinct instances. Do not render all three as tiny panels in one image. Compare product fit, originality, silhouette, and small-size clarity, then choose one.
4. **Write the full generation prompt.** Specify one logo, the exact symbolic intent, shape hierarchy, palette roles, tile and canvas arrangement, rendering level, scale constraints, and negative prompt.
5. **Audit the prompt before generation.** Ask: Could the same prompt produce a generic cloud-storage logo? Is the central symbol concrete enough to guide shape? Are there incompatible style instructions? Could too many details harm scaling? Are output and background instructions unambiguous? Repair every “yes.”
6. **Run the critique council described below.** Require disagreement and specific changes, not collective praise.
7. **Only then generate a candidate.**

If upstream search is not available, do not claim that the scripts returned a style or score. Mark the search as unavailable and use the design references already documented in this repository.

---

## 4. Selected visual language

### Recommended type
Abstract pictorial mark with geometric construction and negative-space intelligence. The shape should feel like a designed identity, not a stock icon pack. A little controlled depth is acceptable only if the flat silhouette remains strong. Default to crisp, near-flat vector-like artwork rather than photorealistic 3D rendering.

### Shape construction
The mark must have one primary mass and, at most, one supporting echo feature:
- Primary mass: a compact, distinctive aperture, lens, or split-loop shape; rounded only where functionally needed.
- Core: one deliberate central pupil/void or geometric core. It must be optically centered, not mechanically centered if the geometry requires slight adjustment.
- Duplicate cue: a clearly intentional offset contour, split tail, second aperture notch, or internal echo that looks like a second instance emerging from one core.
- Negative space: large and coherent enough to survive reduction; no hairline gaps carrying essential meaning.
- Silhouette: distinguishable even if all internal color details are erased.
- Edge language: consistent radii and stroke/edge weight. Avoid mixing random sharp angles, rounded cards, and thin hairlines.
- Asymmetry: a deliberate offset may help recognition; accidental imbalance is not a style.

Do not add a separate “clone” pictogram as a tiny afterthought. The symbol must integrate the concept rather than glue together unrelated icons.

### Color direction
Use a very restrained palette:
- Main tile: `#000001` or `#010205`.
- Main mark: `#176E94` with a controlled transition toward `#01304C` only when it supports clear shape separation.
- Small highlight: `#FCFDFD`, used for a few optical edges or one crisp highlight.
- Deep negative space: `#01132A` where needed.
- Do not use all palette colors by default. `#F5DADA` and `#626773` are not required in the primary icon.

Cyan must emphasize the core symbol rather than flood every edge. White is for clarity, not decoration. The result should still work in one color and grayscale. Do not use an all-over neon bloom, rainbow gradient, radioactive glow, or purple/pink AI gradient.

### Rendering and texture
Use crisp, precise, vector-like geometry with controlled edge highlights. Flat or lightly dimensional is preferred. If subtle depth is used, keep it subordinate to the silhouette. Any highlight must reinforce form; decorative lighting with no structural purpose is a defect.

No metallic scratches, noisy film grain, plastic/glass over-rendering, realistic reflections, heavy bevels, lens flares, or complicated texture. A launcher icon must look intentionally designed, not like a render of a physical object.

### Presentation canvas
Following the upstream logo reference, present the logo on a **plain white canvas** with one centered, dark rounded-square icon tile. The white space is only the presentation canvas; it is not part of the icon artwork. The dark tile is the actual icon field. The tile should be large enough to inspect but leave a generous, even external white margin. Do not add a drop shadow unless it is nearly invisible and improves separation.

Create one icon only. No grid, no multi-logo sheet, no device mockup, no labels, no title, no watermark, no border around the white page.

---

## 5. Canonical master prompt for the image model

Use the following as the primary generation prompt. Do not shorten away its core shape, anti-generic constraints, output context, or small-size requirements.

> **ROLE AND QUALITY BAR**
>
> Act as a senior identity designer specializing in original mobile-app marks, an Android launcher-icon specialist, and a rigorous visual quality director. Design an original, production-minded app icon for FLY8 Clone. Use a deliberate design process informed by the UI/UX Pro Max principles of product-specific style selection, logo scalability, restrained palette, precise negative prompts, and pre-delivery critique. Do not produce a generic technology emblem.
>
> **PRODUCT AND MEANING**
>
> FLY8 Clone is an Android app-cloning utility for distinct app instances and parallel app contexts. Its mark must communicate “one app context can branch into a separate, independently recognizable instance.” The emotional impression is precise, compact, capable, discreet, modern, and premium. The viewer should read a single intelligent symbol before interpreting its details.
>
> The earlier concept of two glossy blue overlapping squares has already been rejected as generic. Do not reproduce it, lightly restyle it, or hide it behind a different gradient. The old reference image's cyan anime eye and dark cyber-tech mood may inform the spirit only. Do not reproduce its character, dialogs, HUD collage, or excessive decoration.
>
> **ORIGINAL SYMBOL CONCEPT**
>
> Create a distinctive abstract pictorial mark based on a “forked aperture / echo iris.” Build one compact lens-like or aperture-like core from a confident, continuous primary form. Let one contour split, fork, or echo into a secondary path, implying that one original context yields a separate instance. Use a small, purposeful negative-space core or pupil to anchor the geometry. The echo should feel structurally integrated into the symbol, not like a second generic card pasted behind it.
>
> Keep the symbol abstract: it may subtly evoke an iris, focus, parallel paths, or duplication, but must not become a literal eyeball, an anime eye, a face, a camera lens stock icon, an infinity symbol, or a simple stack of windows. Favor one ownable silhouette and one clear concept. Slight asymmetry is allowed if it materially improves distinction. Choose shape relationships that could be described and redrawn by a human designer rather than accidental swirls.
>
> The central idea must survive as a flat black silhouette. If the cyan color, shading, and tiny details were removed, viewers should still be able to distinguish the mark from a generic clone-app icon.
>
> **COMPOSITION**
>
> Produce a single centered 1:1 app-icon composition. Use a dark rounded-square/squircle tile as the icon's internal background, on a separate plain white presentation canvas. Keep the tile centered and evenly spaced with generous white margins. Within the tile, center one mark with safe space around every extremity; never let the primary contour sit so close to the edge that Android's rounded/adaptive mask could clip it.
>
> Make the mark occupy approximately 56–68% of the tile's shorter dimension, adjusted optically for balance. Avoid an oversized symbol pressed against the tile. Favor one primary mass and one subordinate echo cue. Use deliberate negative space; no microscopic detail should carry essential meaning. At 24 dp, 32 dp, and 48 dp, the mark should collapse into a coherent, recognizable shape—not a tangle of lines.
>
> **COLOR**
>
> Background tile: almost black `#000001`, subtly supported by `#010205` and/or deep blue `#01132A`. Core signature hue: cyan-blue `#176E94`. Optional secondary depth: `#01304C`. A few cool-white accents may use `#FCFDFD`. Use no more than these 3–4 colors in the primary mark and tile. Do not add pink simply because it appears in the reference palette. No rainbow gradients, random purple, or unlimited neon effects.
>
> Let cyan identify the important contour or duplicated path. Let black/deep navy provide negative space. White should be a precise accent rather than a continuous glowing outline around every surface. The palette must look balanced with all glows turned off and in grayscale.
>
> **FORM, EDGES, AND LIGHT**
>
> Use precise geometry, consistent stroke or contour weight, clean joins, controlled radii, crisp edges, and vector-like clarity. Rendering should be near-flat or subtly dimensional. Light, if used, should explain the symbol's structure and never obscure its silhouette. Keep highlights narrow, local, and restrained. No bloom haze, no excessive reflections, no glossy plastic, no glass slabs, no bevels that imply a physical object, and no complicated textures. The design should feel authored by a top-tier identity designer, not assembled from trendy effects.
>
> **BRAND CHARACTER**
>
> The result should communicate deliberate duplication, independent contexts, control, and precision. It should be distinctive enough to become a recognizable mark after repeated exposure. It should look professional beside serious Android utility applications, yet carry a unique cyan-blue signature. It should not look like a generic AI assistant, cloud drive, VPN, browser, password manager, gaming cheat, or cyberpunk wallpaper.
>
> **SIMPLICITY RULE**
>
> Every visible part must justify itself. If an orbital ring, floating particle, circuit line, extra panel, spark, lens flare, star, glitch fragment, or secondary symbol does not directly strengthen either the silhouette or the meaning of “separate app instances,” remove it. Empty space is a designed element. Avoid the temptation to decorate every empty corner.
>
> **STRICT EXCLUSIONS**
>
> No literal anime character, no human/animal face, no realistic eye illustration, no hair, no faux desktop dialogs, no window title bars, no YES/NO buttons, no screenshots, no floating UI cards, no stacked rounded squares, no generic infinity symbol, no cloud icon, no folder icon, no copied trademark, no letters or words, no “FLY8” text, no typography, no slogan, no watermarks, no device mockup, no collage, no multiple competing logos, no gradients for their own sake, no busy cyberpunk background, no arbitrary circuit pattern, no heavy outer glow, no photorealism, no realistic 3D render, no stock icon aesthetic, no low-resolution edges, no warped or uneven geometry.
>
> **OUTPUT REQUIREMENTS**
>
> One original professional logo/app icon only. Square 1:1 composition. Plain pure-white presentation canvas. One centered dark rounded-square icon tile with a self-contained symbol. Crisp and high resolution. Vector-like form suitable for later SVG/redrawing, Android adaptive-icon extraction, and scaling. No text anywhere. No other objects.
>
> **SELF-CRITIQUE BEFORE FINALIZING**
>
> Before accepting the image, inspect it as a skeptical brand designer. Ask:
> 1. Could this be mistaken for a common cloud-storage or generic clone icon? If yes, redesign the silhouette.
> 2. Does the central shape express one context branching into a distinct second instance without a written explanation?
> 3. Is it ownable, or is it just a camera lens, infinity loop, eye, or pair of cards?
> 4. Does the icon read clearly in one color and at 24/32/48 dp?
> 5. Is there any decoration that does not contribute to meaning? Remove it.
> 6. Are the shapes optically balanced, the safe margins generous, and the palette restricted?
> 7. Does it fit FLY8's black/cyan identity without copying the reference image?
>
> If any answer reveals a clear weakness, revise the composition rather than adding effects. The result should win through concept, geometry, silhouette, and restraint.

---

## 6. Prompt verification log

The prompt was deliberately refined through separate audits. These are prompt-quality checks, not claims that an image has already passed them.

### Draft 0 — initial direction
“Create a sleek cyan-blue app icon with a cloning symbol on a dark rounded square.”

**Audit finding:** Too vague. It invites the exact generic overlapping squares already rejected. It does not establish product context, symbol logic, output canvas, small-size constraints, palette limits, or a meaningful negative prompt.

**Repair:** Define the product, explicitly ban the rejected idea, and give the symbol a specific conceptual architecture.

### Draft 1 — concept and brand context added
“Create a professional FLY8 Clone icon with an abstract symbol for separate instances, in a black/cyan palette. Keep it simple, distinctive, and appropriate for Android.”

**Audit finding:** Better brand fit but still too subjective. “Abstract,” “simple,” and “distinctive” can generate nearly anything. It fails to describe how duplication should be encoded and offers no output or downscale constraints.

**Repair:** Specify a forked aperture/echo-iris concept, a core/negative-space relationship, one primary contour plus one echo cue, and adaptive-icon safe margins.

### Draft 2 — geometry, palette, and output specified
“Design a forked aperture icon on a dark tile, using cyan-blue and deep navy, with one central core and one echo contour. Keep it vector-like and readable when small.”

**Audit finding:** Better construction, but the word “aperture” may drift into a stock camera lens; color effects might dominate; the presentation canvas could be ambiguous; a detailed cyberpunk treatment could creep back in.

**Repair:** Prohibit literal camera-lens clichés, cap the palette, prefer near-flat rendering, define pure-white outer presentation canvas plus separate dark icon tile, and add a strict exclusion list.

### Draft 3 — scale and production constraints added
The canonical prompt above specifies one 1:1 icon, white presentation canvas, centered dark icon tile, defined relative mark size, safe margins, clean joins, minimal colors, grayscale/silhouette validation, and exclusions.

**Audit finding:** Technically clearer. Still requires a contrarian review to challenge the central concept and make sure all reviewers are not merely endorsing the same idea.

**Repair:** Apply the five-role critique council and use a scorecard that forces each reviewer to identify a real risk and a change.

### Council review

| Role | Main challenge | Required prompt safeguard |
|---|---|---|
| Brand strategist | “An abstract iris can still be generic unless duplication is integrated into the contour.” | One branch/echo must visibly communicate a separate instance; reject symbols that need explanation. |
| Senior logo designer | “Too much geometry can become a trendy tech mark with no memory hook.” | Primary silhouette must survive a single-color test; one primary mass and one subordinate cue only. |
| Android launcher specialist | “Thin lines and small counters die at 24 dp and may be clipped by masks.” | Define safe space; test 24/32/48 dp conceptually; no essential hairlines. |
| Color/production reviewer | “Cyan glow and multi-blue gradients can hide poor geometry and create an AI-generated look.” | Restrict colors; judge with glow disabled and in grayscale; prefer clean vector-like form. |
| Skeptical user / adversarial reviewer | “If the icon looks like a camera, eye-tracking tool, or cloud app, the clone meaning is too weak.” | Require visible one-to-two branching logic; compare the result against common category clichés; consider a new concept if it fails. |

### Final prompt verification result

The prompt now contains:
- product and audience context;
- clear meaning and emotional attributes;
- a concrete symbol concept;
- color values and their roles;
- composition and safe-area guidance;
- rendering and edge guidance;
- explicit negative prompts;
- a defined output format;
- downscale and monochrome requirements;
- independent reviewers and honest scoring criteria;
- a revision process that fixes observable weaknesses instead of regenerating randomly.

This verifies the **prompt specification**. It does not certify a future generated image. The actual image must be examined and scored after generation.

---

## 7. Five-star design review council

Run this after every generated candidate. Each role reviews independently before the scores are combined. The council should be adversarial and specific; agreement is not a goal by itself.

### Reviewer A — Brand strategist
- Is the app-cloning purpose encoded in the form?
- Is the symbol ownable for FLY8 rather than interchangeable with other app utilities?
- Is the message controlled duplication, not generic “technology”?
- What single change would improve product recognition?

### Reviewer B — Senior identity designer
- Is there one memorable silhouette?
- Are geometry, spacing, negative space, and contour weight coherent?
- Can the mark survive a one-color rendering?
- What familiar cliché is it closest to, and how must the design diverge?

### Reviewer C — Android launcher specialist
- Will the symbol survive 24, 32, and 48 dp?
- Does the mark remain visible within common rounded-square/circle adaptive masks?
- Does the external shape appear balanced beside unrelated app icons?
- Which details must be removed or thickened?

### Reviewer D — Art director and palette critic
- Are the colors disciplined and consistent with the brand?
- Does the mark remain strong without glow or gradient?
- Is any lighting decorative rather than structural?
- What should be removed to increase focus?

### Reviewer E — Adversarial end user
- After a one-second glance, what shape is remembered?
- Can the icon be mistaken for a camera, cloud, VPN, file manager, AI tool, or generic clone app?
- Does it feel polished or obviously generated?
- What would make it more memorable without adding complexity?

Every role must return:
1. One concrete strength.
2. One concrete weakness/risk.
3. One actionable revision.
4. A score for its relevant categories.
5. An explicit statement when evidence is insufficient.

No reviewer may use only generic praise. At least one role must argue against the current favorite concept. The council may reject the central concept itself if it cannot become distinctive after a serious revision.

---

## 8. Five-star scorecard

Score each dimension from 1 to 5. A score describes subjective design judgment, not laboratory measurement or user research. Give evidence for every score.

| Dimension | A 5/5 result means |
|---|---|
| Product fit | The mark clearly supports the idea of distinct/parallel app instances, not generic technology. |
| Originality / ownability | It has a specific silhouette and is not a stock icon, cliché, or near-copy of the reference. |
| Instant recognition | The primary shape is remembered after a brief glance. |
| 24 dp legibility | The concept remains coherent at the smallest intended launcher size. |
| 32–48 dp legibility | Main and secondary forms remain distinct without visual tangles. |
| Silhouette | It can be recognized as a single-color shape without gradients or texture. |
| Composition | Weight, balance, margins, and negative space feel intentional and optically centered. |
| Color discipline | Restricted FLY8 palette supports the concept without overpowering it. |
| Professional finish | Crisp edges, consistent geometry, no obvious image-model artifacts, no accidental clutter. |
| Platform readiness | One self-contained icon, mask-safe spacing, practical square composition, no baked-in text. |

**Target: 5/5 for all ten dimensions. Do not fabricate or inflate scores.** If a generated image cannot honestly reach all 5s, report the actual scores and the remaining weakness. “All five stars” is the design objective, not permission to claim a perfect result without evidence.

### Acceptance gate
A candidate can be called the current best only after:
- all five council roles have reviewed it;
- every score has a specific justification;
- the 1-color/silhouette and small-size thought experiments have been performed;
- the top three defects have either been fixed or explicitly documented;
- no unresolved critical failure remains in originality, small-scale recognition, or product fit.

A final report should separate *visual judgment* from *tested facts*. If no rendered-size preview was actually made, state that small-size legibility has been conceptually reviewed, not empirically tested.

---

## 9. Refinement loop: no random regeneration

For each cycle, write a short private production note and a user-shareable summary of visible findings. Do not expose hidden internal chain-of-thought; record the actionable conclusion and evidence.

### Per-cycle steps
1. Preserve the best candidate as `best-so-far`.
2. List the three most important visible problems, ranked by impact.
3. For each problem, point to an actual shape, contrast, proportion, artifact, or semantic ambiguity.
4. Choose the smallest set of edits that addresses those problems.
5. Rewrite the generation prompt with precise constraints; remove conflicting instructions.
6. Generate the next candidate.
7. Have the five roles assess the new candidate independently.
8. Score all ten dimensions anew.
9. Compare against the best-so-far candidate at the same displayed size and in grayscale.
10. Keep the better candidate; do not keep a weaker image merely because it is newer.
11. Repeat until every dimension genuinely scores 5/5 or eight useful cycles have been completed.

### Stop rule
Do not stop because the latest image looks flashy or because several iterations have occurred. Stop early only when the 5/5 target is honestly met. If it remains unmet after eight purposeful iterations, explain which scores remain below five and what evidence or design alternative would be needed next. Do not claim perfection just to satisfy a request.

A cycle must change a meaningful design variable—symbol construction, silhouette, negative space, proportion, palette hierarchy, or detail density. A minor gradient shuffle is not a useful iteration.

---

## 10. Adversarial rejection checklist

Reject a candidate immediately and revise if any of these apply:
- It is essentially two overlapping squares/cards/windows.
- It can be described only as “a cool blue technology logo.”
- The eye/aperture is literal, stock-like, or more dominant than the duplication idea.
- It needs text to explain what it means.
- It uses glow to hide a weak silhouette.
- The central shape becomes an infinity logo by accident.
- It resembles a camera app or biometric scanner more than a cloning utility.
- The secondary echo becomes visually equal to the core and the icon loses hierarchy.
- It has tiny lines, specks, particles, or HUD elements that disappear when downscaled.
- It looks like a miniature poster or screenshot instead of an app icon.
- It has fake letters, accidental symbols, watermarks, or image-model artifacts.
- The tile, symbol, and white presentation field have ambiguous boundaries.
- It feels visually busy, generic, over-polished, or trend-chasing.
- It copies the original reference rather than extracting its useful mood.

When a failure occurs, identify what should be removed or structurally changed. Do not “fix” every rejected design by adding more effects.

---

## 11. Final pre-delivery checklist

- [ ] One icon only—no variant grid and no typography.
- [ ] Distinctive primary silhouette and clear instance-branching metaphor.
- [ ] Not a generic overlap, infinity, camera lens, folder, cloud, or assistant glyph.
- [ ] Near-black/cyan identity is consistent with FLY8.
- [ ] No essential detail depends on glow, texture, or a tiny gap.
- [ ] Flat silhouette and grayscale checks are clean.
- [ ] Small-size behavior at 24/32/48 dp has been reviewed.
- [ ] Adaptive-mask safe margins are respected.
- [ ] White presentation canvas, centered dark tile, and symbol hierarchy are unambiguous.
- [ ] No visual artifacts, watermark, fake text, unwanted UI, or character illustration.
- [ ] Council critique and revision history are complete.
- [ ] Ratings are honest; limitations are named.
- [ ] Final asset is described as generated, inspected, and tested only to the extent those steps really happened.

## 12. Delivery note template

Use this concise evidence-based summary after reviewing the actual generated image:

```
FLY8 Clone logo review
Candidate: [identifier]
Current decision: [accept / revise / reject]

Scores:
- Product fit: X/5 — [evidence]
- Originality: X/5 — [evidence]
- Instant recognition: X/5 — [evidence]
- 24 dp legibility: X/5 — [evidence and whether actually previewed]
- 32–48 dp legibility: X/5 — [evidence]
- Silhouette: X/5 — [evidence]
- Composition: X/5 — [evidence]
- Color discipline: X/5 — [evidence]
- Professional finish: X/5 — [evidence]
- Platform readiness: X/5 — [evidence]

Council's top concerns: [...]
Changes made: [...]
Remaining limitations: [...]
```

The objective is not to manufacture a perfect rating. The objective is to do the work required for an exceptional design and honestly distinguish a strong concept from a verified final asset.
