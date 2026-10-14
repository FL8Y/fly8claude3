# FLY8 Clone — Prompt QA, Red-Team Council, and Iteration Record

**Purpose:** Verify the master image prompt *before* generating another FLY8 logo.  
**Canonical prompt:** [`FLY8-CLONE-LOGO-MASTER-PROMPT.md`](./FLY8-CLONE-LOGO-MASTER-PROMPT.md)  
**Project skill:** [`fly8-brand-design`](../.claude/skills/fly8-brand-design/SKILL.md)  
**Upstream foundation:** [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)

This file reviews the wording and design process—not an image that has not yet been generated. Prompt quality and image quality are separate gates.

---

## 1. The plan before image generation

The image should not be generated until the following sequence has been completed for the current request.

1. **Read project context.** Inspect this file, the canonical master prompt, the design skill, relevant user-provided references, and the actual app/repository if functionality claims matter.
2. **Write a compact brief.** Product, audience, purpose, visual attributes, deliverable, chosen palette, non-goals, and success criteria.
3. **Review upstream guidance.** Consult the relevant UI/UX Pro Max documentation. Use its logo/style/color/industry search scripts only when installed and available. Never invent search results.
4. **Compare concept routes.** Develop at least three meaningfully different constructions in writing; score them for product meaning, originality, silhouette, launcher-size viability, and confusion risk.
5. **Write the literal image prompt.** Specify shape construction, hierarchy, color roles, output canvas versus icon tile, framing, scale, rendering style, exclusions, and expected output.
6. **Verify the prompt in three passes.** First for completeness, second for ambiguity/contradictions, and third through the adversarial council below.
7. **Patch every concrete weakness.** Each patch must close an identifiable gap, not merely add impressive-sounding adjectives.
8. **Re-read the whole prompt.** Look for contradictions introduced by the patches. Score the final prompt against the prompt-quality rubric.
9. **Generate one chosen direction.** Do not ask the model to render a concept grid when a single final icon is required.
10. **Review the real output.** Inspect the generated image, then run actual downscale/grayscale/mask checks where tools allow. Do not award image-stage scores based on prompt-stage scores.

If a step cannot be performed, record that as a limitation. A missing tool is not permission to pretend the step happened.

## 2. Fixed product brief and reference hierarchy

### Product truth

FLY8 Clone is being designed as an Android utility for separate app instances and parallel app contexts. The mark should imply distinct instances under deliberate control. It must not imply stealth, guaranteed privacy/security, root access, unlimited cloning, or universal compatibility without evidence in the app itself.

### Durable visual direction

- Almost-black and deep navy icon field.
- A controlled cyan-blue signature.
- Cool white only for purposeful contrast.
- Original abstract geometry with a strong silhouette.
- Clean enough to function at small Android launcher sizes.
- Distinctive enough to own as a visual identity, not simply a generic category pictogram.

Use the established palette from the canonical prompt. Do not force every palette token into the logo.

### Reference hierarchy

When visual inputs conflict, prioritize in this order:

1. Explicit current user requirements.
2. Verified product facts and practical Android icon constraints.
3. Durable FLY8 brand decisions documented in this repository.
4. The useful mood/visual cues from the reference art.
5. Aesthetic preferences of the designer or the image model.

The reference image is a mood and concept source. Its anime eye and cyberpunk interface should not become a miniature character poster. The previous plain cyan overlapping-panel concept was rejected as generic; the highly decorated eye/windows concept was rejected as too cluttered for a launcher icon. The current goal is a new symbol that combines identity with restraint.

## 3. Prompt-quality scorecard

Score the actual prompt text, from 1–5, before generation. The scale means:

- **1 — Missing or contradictory.**
- **2 — Present only as vague adjectives.**
- **3 — Mostly clear, but a model could plausibly misread it.**
- **4 — Specific, but one material ambiguity remains.**
- **5 — Explicit, consistent, observable, and tied to an acceptance test.**

| Dimension | Evidence required for 5/5 |
|---|---|
| Product grounding | The prompt names Android cloning and separate app instances; no unsupported app claims. |
| Concept clarity | The symbol's visual construction is specified and the meaning is not dependent on text. |
| Concept flexibility | A preferred direction is given, but the brief allows a route change if the first idea is cliché or confusing. |
| Anti-generic protection | Known failed ideas and likely category clichés are explicitly excluded. |
| Visual hierarchy | Primary shape, core/negative space, secondary echo, and detail budget are described. |
| Palette specificity | Exact colors and their roles are stated; effects cannot overrule the geometry. |
| Framing and output | One centered icon, square composition, white presentation canvas, separate dark tile, safe margins. |
| Small-size constraints | 24/32/48 dp checks are required; tiny details are not essential to the meaning. |
| Style coherence | Vector-like/crisp styling takes priority over optional depth/glow; no conflicting visual directions. |
| Negative prompt | Text, characters, fake UI, watermarks, clutter, common clichés, and artifacts are covered. |
| Production honesty | A rendered PNG is not called an SVG, app package, trademark-cleared asset, or device-tested icon without that work. |
| Revision protocol | The prompt has a council, evidence-based scoring, concrete edits, and a transparent stop rule. |

**Hard gate:** do not generate while a category is below 5/5. If the evidence is unavailable, use “not verified,” not a convenient 5. Prompt scores never transfer to the generated image.

## 4. Three-pass prompt verification

### Pass A — Requirement traceability

For every requirement, identify the literal prompt instruction that implements it.

| Requirement | Prompt evidence to locate | Pass condition |
|---|---|---|
| App cloning | Product and meaning sections | Distinct instances/parallel contexts are stated directly. |
| FLY8 identity | Brand and palette sections | Near-black/cyan palette is explicit and limited. |
| Non-generic symbol | Original symbol construction | The form is more precise than “blue clone icon.” |
| Single-icon output | Composition and output | No concept grid, UI screenshot, or wordmark is requested. |
| Android practicality | Safe margins and scale requirements | The prompt addresses launcher masks and small-size behavior. |
| Clean result | Exclusions and simplicity rule | All distracting extras are removed or have a clear semantic role. |
| Originality | Exclusions and concept gate | No character copy, known logo copy, or cliché-only construction. |
| Honest validation | Self-critique and delivery rules | Unperformed tests are not described as passed. |

When one requirement lacks a clear instruction, add it where the image model can use it—not only in a planning note.

### Pass B — Ambiguity and contradiction sweep

Ask a deliberately hostile set of questions:

- Could the same prompt still produce two ordinary overlapping squares?
- Could “iris” dominate until it looks like a camera lens or biometric scanner?
- Could “futuristic” cause orbital rings, circuitry, random particles, and HUD clutter?
- Could “premium 3D” overpower the vector-like silhouette?
- Could “white background” cause the actual icon tile to become white?
- Could text or pseudo-lettering appear despite the no-text requirement?
- Could the prompt ask for one logo and a multi-concept sheet at the same time?
- Could tiny internal lines become essential to the intended meaning?
- Could an attractive glow hide a weak one-color silhouette?
- Could the wording imply that the raster image itself is an SVG or production-ready Android adaptive asset?

For every “yes” or “possibly,” point to the exact phrase and patch it. Then reread the full prompt in context; fixing a sentence can introduce a contradiction elsewhere.

### Pass C — adversarial council

Do not let the favored concept defend itself. Each lens must return one strength, one serious risk, one plausible bad output, and one exact instruction that would prevent or expose the failure.

1. **Brand strategist:** challenge whether the product meaning survives without explanation.
2. **Senior logo designer:** challenge originality, silhouette, category clichés, and form hierarchy.
3. **Android launcher specialist:** challenge scale, padding, counters, and adaptive-mask survival.
4. **Art director / production reviewer:** challenge palette drift, false depth, inconsistent effects, and canvas/tile confusion.
5. **Skeptical end user:** challenge the most likely misreading after a one-second glance.

The council must include a contrarian position. If all five voices only praise the proposed concept, the review has failed. When one model simulates the five roles, label the result a **simulated multi-lens council**, not independent external validation.

## 5. Concept gate: do not overcommit to the first metaphor

Before generation, compare at least three different routes in writing. Start with these candidates, but allow a fourth idea when all three are weak:

### Route A — Forked aperture / echo iris
One compact core with a purposeful branch or offset echo. This can combine focus and duplication in one shape. **Risk:** may look like a camera or biometric reader.

### Route B — One core, two independent channels
A unique outer form contains two visibly separate inner paths or counters. It can communicate parallel instances without literal app windows. **Risk:** may become a generic abstract technology blob.

### Route C — FLY8-derived structural monogram
A bespoke F/8-inspired geometry in which two separate paths share a structural core. Use letterform influence subtly; do not simply write “F8.” **Risk:** may look like a generic lettermark or camera aperture.

For each route, record:
- what a user should infer;
- the unique feature that could make it ownable;
- the likeliest wrong interpretation;
- its strongest disadvantage;
- expected 24 dp behavior;
- why it beats or loses to the other routes.

Select the strongest concept rather than automatically selecting Route A. If all three have serious failures, create another route. Palette changes do not rescue a weak silhouette.

## 6. Council findings and prompt patches

This section records prompt-level risks found during the audit and the required response.

| Review lens | Potential failure | Required patch/acceptance check |
|---|---|---|
| Brand strategy | “Looks techy” but does not communicate separate app instances. | Require a visible branch/echo/dual-channel relationship; reject if meaning requires a caption. |
| Identity design | The iris/aperture becomes a stock camera lens. | Compare alternatives before generation; prohibit camera/biometric interpretation and switch concept if needed. |
| Launcher production | Counters or hairlines disappear when reduced. | Require 24/32/48 dp previews and no essential micro-details; label unrendered checks as inferred. |
| Art direction | Glow, reflections, glass, and cyberpunk fragments mask poor geometry. | Judge in flat silhouette and grayscale; let geometry lead, effects remain optional. |
| Skeptical user | Too many motifs compete, so the mark is not remembered. | One primary mass and one subordinate echo; remove all non-semantic decoration. |
| Technical honesty | A prompt requests “vector-like,” and the result is incorrectly called a vector asset. | Call the generated output raster unless a real vector source/export exists; separate concept approval from Android packaging. |
| Reference fidelity | The source image's busy anime composition is copied rather than distilled. | Use the reference for mood only; do not copy characters, dialogs, or composition. |
| Output framing | White presentation space is confused with the icon's own background. | State that the white field is outside the centered black rounded-square tile. |

### Prompt patch policy

Each patch should change the smallest amount of wording necessary to remove the defect. Keep successful wording. Do not pile on contradictory instructions or add more adjectives when the actual failure concerns shape geometry. After every patch, repeat Pass B to make sure the fix has not introduced ambiguity.

## 7. Current master-prompt audit

This audit evaluates the written prompt currently stored in `design/FLY8-CLONE-LOGO-MASTER-PROMPT.md`; it does not evaluate an image.

| Prompt dimension | Score | Evidence-based reason |
|---|---:|---|
| Product grounding | 5/5 | It states Android app cloning / distinct instances and forbids invented product guarantees. |
| Concept clarity | 5/5 | It describes a core and an integrated branch/echo rather than only saying “cloning symbol.” |
| Concept flexibility | 5/5 | The additional concept-selection gate permits switching from the aperture to alternative routes if it feels generic or camera-like. |
| Anti-generic protection | 5/5 | Stacked panels, infinity marks, cloud/folder symbols, fake desktop dialogs, and cyberpunk clutter are explicit exclusions. |
| Visual hierarchy | 5/5 | It limits the primary mass and secondary cue and prioritizes negative space and silhouette. |
| Palette specificity | 5/5 | Exact FLY8 hex codes and restrained roles are defined. |
| Framing and output | 5/5 | One square icon, a white presentation field, dark tile, centered mark, and safe margins are specified. |
| Small-size constraints | 5/5 | 24/32/48 dp checks are required and must be labeled honestly if only conceptual. |
| Style coherence | 5/5 | Near-flat vector-like construction takes priority over optional depth and effects. |
| Negative prompt | 5/5 | The prompt explicitly removes text, character art, faux UI, watermarks, clutter, and common clichés. |
| Production honesty | 5/5 | The prompt distinguishes raster concept output from SVG/adaptive-icon delivery and actual tests. |
| Revision protocol | 5/5 | It includes separate reviewers, calibrated scoring, candidate comparison, and a defined iteration process. |

**Prompt audit result:** the written brief is sufficiently explicit for the next generation attempt under this project's rubric. These scores represent a documentation review—not proof of objective perfection, not independent human validation, and not a five-star rating for the resulting image.

### Limits of this audit

- The relevant upstream README and design/logo documentation were reviewed.
- The upstream CLI/search scripts were not executed in this session.
- The image for the next round does not yet exist at the time of this prompt-only review.
- Actual 24/32/48 px downscaling, grayscale inspection, adaptive-mask preview, Android installation, vector redraw, and trademark clearance have not been performed by this file.
- A final image must be inspected and scored independently after generation.

## 8. Practical image review after generation

Once a real candidate is available:

1. Open and inspect the full-resolution image.
2. Crop/preview the icon tile separately from the white presentation canvas, if the tool permits.
3. Render actual 24, 32, and 48 px previews and inspect at native display scale.
4. Create grayscale and solid one-color silhouette previews.
5. Check rounded-square and circle crops where feasible.
6. Identify the three most serious visible defects before editing the prompt.
7. Run the five-role critique again, separately scoring all ten image dimensions from the master prompt.
8. Compare the new candidate with the previous best; keep the one with better evidence, not simply the newest one.
9. Revise only when there is a testable design hypothesis.
10. Report remaining weaknesses instead of inflating scores.

**Observed / checked / inferred / unknown** must remain distinct. If no size preview was made, small-size ability is inferred rather than checked. If no outside reviewers participated, do not claim the review was independently validated.

## 9. Iteration policy

Continue when a meaningful defect and a plausible correction exist. Stop early only when the actual candidate meets every five-star criterion honestly. If repeated attempts no longer test a specific hypothesis or the current tooling blocks a required check, state the blocker and the best next experiment; do not create an endless sequence of trivial regenerations.

A useful iteration changes structure, hierarchy, negative space, proportion, shape count, or palette role in response to a recorded finding. A random glow change is not sufficient.

## 10. Final gate

Before generation, confirm:
- [ ] Three concept routes were compared.
- [ ] Product-specific meaning and reference hierarchy are clear.
- [ ] Every prompt-quality dimension is scored 5/5 with a reason.
- [ ] Completeness and ambiguity passes are done.
- [ ] The prompt council challenged the concept rather than simply endorsing it.
- [ ] The strongest predictable failure has an explicit countermeasure.
- [ ] No instructions contradict on output format, composition, style, or palette.

After generation, confirm separately:
- [ ] The image was visually inspected.
- [ ] All ten image scores have evidence.
- [ ] Critical dimensions are not averaged away.
- [ ] Small-size, grayscale, silhouette, and mask checks are either performed or marked not tested.
- [ ] The final report names any actual limitation.

**Principle:** The prompt is finished when its instructions are clear and internally consistent. The logo is finished only when the generated candidate earns the acceptance criteria through actual review.


## 11. Additional cross-file coherence review — 2026-10-15

This is a follow-up review of the saved repository instructions after the prompt and skill were read back from GitHub. It checks consistency between files, not the quality of a future image.

### Pass 1 — Cross-file traceability

- Confirmed the root README points to the FLY8-specific skill, canonical master prompt, prompt QA council, and repository-level agent instructions.
- Confirmed the skill directs logo tasks to both the long-form master prompt and this QA council.
- Confirmed the canonical master prompt retains the exact FLY8 palette, one-icon requirement, white presentation canvas versus dark internal icon tile, anti-generic exclusions, calibrated five-star rubric, and raster-versus-vector honesty rules.
- Confirmed the source inventory links to the relevant upstream UI/UX Pro Max README, core skill, logo design workflow, style guide, color psychology, prompt engineering, and UX/mobile review references.

### Pass 2 — Consistency defects found and corrected

1. **Reading order:** The current concept decision was placed after the visual-specification section, which made the plan feel backward. It has been moved before the visual specification so the document now reads: brief → pre-generation workflow → concept decision → visual system → canonical image prompt.
2. **Instruction drift:** The repository-level instructions still described the aperture as the default direction, while the current working concept had evolved to a forked-core / dual-channel mark. The stale instruction was updated to tell the agent to challenge the current concept rather than privilege the old aperture idea.
3. **Concept hierarchy:** The dual-channel route remains the current working hypothesis, but the route-selection gate still permits replacing it if review finds that it resembles generic network branching, a camera, a biometric scanner, or another stock technology symbol. The chosen direction is not an instruction to ignore evidence.
4. **Section references:** Verified that the canonical prompt, prompt-verification log, calibrated evaluation supplement, post-write verification record, and Android handoff section remain present and cross-referenced. The upstream CLI is not claimed to have been executed.

### Pass 3 — Adversarial usefulness check

The strongest remaining risk is that an image model may still produce a generic abstract tech mark despite the dual-channel description. The prompt must therefore be judged by the actual contour, not by its own explanation. Reject a candidate if its one-to-two logic is not visually apparent, if it resembles a generic networking/sync logo, or if its silhouette needs a caption. Do not attempt to rescue a weak concept with more cyan glow, texture, or floating interface decoration.

### Prompt-only acceptance result

The 12 prompt-quality dimensions in Section 3 remain rated 5/5 under this repository's explicit rubric because the written prompt states the product, symbol logic, alternatives, anti-cliché checks, palette, framing, scale expectations, exclusions, production truth, and revision protocol. This is an internal documentation assessment—not an independent human panel and not a rating for generated artwork.

### Evidence limits

- Upstream documentation pages were read through repository file retrieval.
- The upstream UI/UX Pro Max CLI/search scripts were not executed.
- This review did not perform user research, trademark clearance, or independent human critique.
- A generated image must be assessed separately with observed evidence. Actual 24/32/48 px renders, grayscale, one-color silhouette, adaptive-mask previews, and Android packaging remain unverified until those steps are carried out.


## 11. Observed generation round — reject and reset the context

**Review date:** 2026-10-15  
**Status:** Three generated candidates reviewed at full size; all rejected. This is an image-stage finding, not a prompt-only score.

### Candidate A — `a_high_detail_futuristic_cyber_tech_anime_style_ap.png`

**Observed failures**
- The anime eye and layered faux application windows dominate the composition.
- Orbital ribbons, HUD fragments, bright flares, and decorative interface marks compete with the icon's primary silhouette.
- The result reads as cyberpunk/anime artwork, not as a distinctive, clean Android cloning-app mark.
- The central symbol is not a compact forked-core / dual-channel glyph.

**Provisional review**
- Product fit: 2/5.
- Originality/ownability: 1/5; the eye + floating window composition is a familiar visual trope.
- Instant recognition: 2/5; the eye is memorable but communicates a vision/AI theme more than separate app instances.
- Silhouette: 1/5; multiple frames and ribbons merge into visual clutter.
- Composition: 2/5.
- Color discipline: 2/5; too many bright effects and secondary hues.
- Professional logo finish: 2/5 for the intended use; surface rendering is elaborate, but the identity is not restrained or scalable.
- Platform readiness: 1/5.
- 24/32/48 dp legibility: **not tested**. Small-size performance is predicted to fail because too much meaning depends on fine detail, but that prediction is not a rendered-size test.

### Candidate B — `a_polished_high_detail_stylized_app_icon_graphic.png`

**Observed failures**
- Repeats the same eye, multi-window, orbit, and HUD composition rather than testing the forked-core direction.
- Glossy borders and stacked title bars create more competing contours.
- At full size it is visually striking but far too dense for a launcher mark.

**Decision:** Reject. This is not a meaningful iteration because it does not test the recorded design hypothesis or fix the prior candidate's top defects. No downscaled, grayscale, or mask preview was performed.

### Candidate C — `close_up_stylized_cyberpunk_anime_app_icon_illust.png`

**Observed failures**
- The same anime eye, faux windows, HUD, orbiting rings, and digital fragments remain.
- Large `FLY8` lettering was added despite the no-text requirement.
- This version behaves like a gaming/streaming poster and does not satisfy the standalone-symbol requirement.

**Decision:** Reject. Platform readiness is 1/5. The accidental wordmark is an additional critical failure. No small-size or adaptive-mask checks were performed.

### Council summary

| Lens | Finding | Required action |
|---|---|---|
| Brand strategist | The artwork communicates “AI vision/cyberpunk” more strongly than “separate app instances.” | Remove the character/eye as the focal subject; encode one-to-two instance logic in the actual primary silhouette. |
| Identity designer | Decorative complexity masks the lack of an ownable mark. | Use one abstract continuous form and two legible negative-space channels; keep only one subordinate echo. |
| Android launcher specialist | The frames, orbit lines, and micro-elements are unlikely to survive reduction. | Treat tiny-size performance as unverified until measured; design for broad shapes and safe margins first. |
| Art director | White/cyan glows, purple accents, glass borders, and reflections have become the design rather than support for it. | Near-flat geometry, restricted FLY8 palette, no effect-driven silhouette. |
| Adversarial end user | A fast glance suggests an anime AI scanner or a futuristic game app. | Reject candidates that need their caption to communicate cloning. |

This is a **simulated multi-lens review** by one operator, not five independent reviewers or user research.

### Generation-context correction for the next attempt

The next attempt must be framed as a **new original icon**, not a restyle/edit or continuation of the reference artwork. State the visual exclusions immediately before generation so the earlier source composition cannot dominate: no character, no face, no literal eye/iris, no faux windows/title bars, no targeting HUD, no orbital rings, no stars, no glitch fragments, no extra panels, and no wordmark.

Required central construction: one bold, asymmetric forked-core mark whose continuous cyan-blue form resolves into **two broad, independently readable negative-space channels**. The split itself must carry the cloning meaning. The aperture/eye reference is optional and should be omitted from the next render; avoid circular or concentric constructions entirely. Use crisp near-flat/vector-like geometry, one main mass plus at most one subordinate echo, a dark rounded-square tile on a plain white presentation canvas, and the established FLY8 palette.

If the image tool continues to produce the old composition, reject the output instead of scoring it generously or making another adjective-only edit. Change the concept language and prioritize silhouette, negative space, and detail count. No candidate can receive an all-five acceptance until the actual image is inspected and the required tests are performed.


## 12. Generation preflight — split-core icon, 2026-10-15

**State:** Prompt ready; image not yet reviewed. This section records the design decision and literal prompt audit for the next image generation. The scores below are design-planning judgments, not measured user research or artwork scores.

### Concept routes compared

| Route | Product fit | Ownability | Silhouette | 24 dp plausibility | Primary risk | Decision |
|---|---:|---:|---:|---:|---|---|
| A — Eye/aperture echo | 3 | 2 | 3 | 3 | Camera/biometric/vision-tool interpretation; conflicts with the latest rejection of the previous anime-eye imagery. | Reject for this generation. |
| B — One asymmetrical split-core with two broad negative-space lanes | 4 | 4 | 4 | 4 | Could still become a generic network branch if drawn as thin lines. | Selected for testing; constrain it as one solid mass with exactly two broad cutout lanes, no nodes, arrows, cards or circle geometry. |
| C — F/8-derived abstract monogram | 3 | 3 | 4 | 4 | May become forced lettering, a generic loop, or an unreadable lettermark. | Keep as fallback if B fails its first-glance or silhouette test. |
| D — One-to-parallel path | 4 | 3 | 4 | 4 | Can read as synchronization/network software rather than cloning. | Not selected because it overlaps structurally with B but offers a less ownable silhouette constraint. |

Route scores are heuristic and provisional. Product fit, ownability, silhouette, and small-size behavior are hard decision dimensions; a high average would not excuse a failure in one of them.

### Literal prompt patches applied to the canonical master prompt

1. Replaced optional iris/aperture language in the active concept instructions with a specific ban on eyes, apertures, lenses, circles, and concentric construction for this generation.
2. Specified one continuous, bold, asymmetric cyan-blue mass with a broad structural spine and exactly two broad, offset negative-space lanes.
3. Added a purposeful outer contour/offset shoulder to help avoid a generic Y/network symbol, while explicitly banning nodes, arrows, three-pronged branches, card outlines, and detached objects.
4. Added explicit exclusions for targeting HUDs, orbital rings, stars, glitch fragments, particles, extra panels, and network-node diagrams.
5. Preserved the one-icon output, plain white presentation canvas, centered dark rounded-square tile, restricted FLY8 palette, no text, and small-size/silhouette expectations.
6. Retained the alternate-concept gate: if the dual-channel form reads as generic networking, change the concept rather than decorating it.

### Three-pass prompt verification

**Pass A — traceability:** Product and audience, cloning meaning, unique geometry, palette, composition, exclusions, small-size expectations, and post-generation tests are all stated in the current canonical Section 5 prompt.

**Pass B — ambiguity and contradiction:** The active generation prompt no longer asks for an eye/aperture while simultaneously banning it. The tile is explicitly dark and the separate presentation canvas white. One icon is requested; no collage or wordmark is allowed. The negative-space channels are broad, not thin linework, and effects cannot substitute for silhouette.

**Pass C — simulated multi-lens council:**
- Brand strategist: Product meaning is now tied to two separate lanes within one shared core; a caption must not be needed.
- Identity designer: One mass and two broad channels are clearer than decorative stacked windows, but ownability remains unproven until the actual contour is inspected.
- Android launcher specialist: Broad voids and a compact safe zone favor reduction; 24/32/48 px behavior remains **not tested** until previews exist.
- Art director: The restricted palette and near-flat finish are compatible; no glow, orbital decoration, or glass panels should be used to fill empty space.
- Skeptical end user / contrarian: The remaining risk is a generic branch/network glyph. Reject it if the two lanes are not part of a distinctive monolithic silhouette.

### Prompt-quality decision

The canonical prompt passes the specified prompt-only requirements for this generation: product grounding, concept clarity, route flexibility, anti-generic constraints, hierarchy, palette, framing, small-size intent, style coherence, negative prompt, production honesty, and revision protocol. This is a prompt gate only. It does not pre-score the generated image or guarantee a 5/5 artwork result.

### Post-generation validation — completed for the selected vector candidate

The image-generation outputs repeatedly drifted back toward the supplied anime-eye / faux-window artwork and were rejected in Section 11. To test the actual design brief instead of endlessly adding prompt adjectives, a precision SVG candidate was then authored from the selected monolithic split-core direction and exported as scalable logo and Android icon layers.

**Selected concept:** one asymmetric cyan-blue mass with two broad, offset negative-space lanes. The left-side source contour widens into two independent right-facing channels. The two dark slots are real even-odd cutouts in the canonical SVG; they are not black rectangles pasted over the mark. This keeps the silhouette integrated and distinct from stacked application cards, a literal eye/camera, a generic infinity sign, and a thin network diagram.

**Canonical source assets**
- `design/assets/FLY8_Clone_Logo.svg` — white presentation canvas and dark rounded-square tile.
- `design/assets/FLY8_Clone_Launcher.svg` — full-bleed square launcher artwork.
- `design/assets/FLY8_Clone_Adaptive_Foreground.svg` — transparent color foreground with transparent channels.
- `design/assets/FLY8_Clone_Adaptive_Background.svg` — dark background layer.
- `design/assets/FLY8_Clone_Adaptive_Monochrome.svg` — one-color foreground for themed-icon use.
- `design/assets/README.md` — usage and validation notes.

**Completed artifact checks**
- [x] 1024×1024 presentation render and full-bleed launcher export.
- [x] The canonical mark is a single coherent shape with two real negative-space channels; no wordmark, character, face, literal eye, app-window outlines, HUD, orbit rings, stars, or glitch fragments.
- [x] Actual 24×24, 32×32, and 48×48 raster downscales generated from the full-bleed launcher asset and visually inspected.
- [x] Grayscale version inspected.
- [x] One-color silhouette inspected on a dark field.
- [x] Circle and rounded-square mask previews inspected; the mark remains within the safe area.
- [x] Transparent foreground, background, and monochrome SVG variants exported.
- [x] Final chosen route differs materially from the rejected generated compositions and is documented in the repository.

## 13. Selected vector candidate — internal scorecard

Scores below are the simulated multi-lens council's design assessment against the project's rubric, not ratings collected from users.

| Dimension | Score | Evidence |
|---|---:|---|
| Product fit | 5/5 | One source contour resolves into two distinct internal lanes, expressing parallel instances without drawing generic app cards. |
| Originality / ownability | 5/5 | Custom asymmetric silhouette, real negative-space cuts, and unequal shoulders/terminations; it does not reproduce the submitted anime-eye artwork. This is a design assessment, not legal trademark clearance. |
| Instant recognition | 5/5 | One dominant mass and two large cutouts; the primary concept survives without text. This remains a design judgment until independent user testing. |
| 24 dp legibility | 5/5 | The real 24×24 downscale preserves the two lanes and outer split silhouette; fine effects are nonessential. |
| 32–48 dp legibility | 5/5 | At these sizes the two negative-space channels remain distinct and the outer contour reads cleanly. |
| Silhouette | 5/5 | The solid one-color preview retains the two-lane split without relying on color or shine. |
| Composition | 5/5 | Centered within the icon safe area; no text, edge-hugging details, or decorative elements compete with the mark. |
| Color discipline | 5/5 | Near-black/navy field with the established blue and restrained light accent; grayscale review does not break the structure. |
| Professional finish | 5/5 | Clean vector geometry, consistent joins, no generated-image artifacts, and scalable SVG masters. |
| Platform asset readiness | 5/5 | Separate full-bleed, adaptive foreground/background, and monochrome vectors are included; mask previews were inspected. Actual Android integration is still a separate build-time check. |

**Decision:** retain the monolithic split-core vector as the current five-star *internal design candidate*. Do not describe the score as externally validated. No independent human panel, user study, comprehensive reverse-image search, formal trademark review, or install-on-device launcher test was performed; complete those before public launch if the icon is being released commercially.
