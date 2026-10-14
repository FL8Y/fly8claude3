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
