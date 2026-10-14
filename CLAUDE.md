# FLY8 Clone — Agent Instructions

These are repository-level instructions for Claude Code and other coding/design agents. They make the FLY8 project-specific design baseline discoverable and repeatable across sessions.

## Required source of truth

Before any visual design, logo, launcher icon, brand asset, or UI/UX direction task, read:

1. `.claude/skills/fly8-brand-design/SKILL.md`
2. `design/FLY8-CLONE-LOGO-MASTER-PROMPT.md` for any logo or app-icon task.

The master prompt contains the product brief, canonical generation prompt, prompt-verification protocol, five-role critique council, ten-category scorecard, calibrated scoring scale, production-validation steps, and iterative refinement rules. Do not replace it with a generic image-generation prompt.

## FLY8 product and brand invariants

- Product: Android app-cloning utility for distinct app instances / parallel app contexts.
- Desired message: controlled duplication and separation—not piracy, data theft, stealth, or unverified security promises.
- Established visual identity: near-black and cyan/blue; see the canonical prompt for exact hex values and roles.
- Primary icon deliverable: one self-contained pictorial mark, no baked-in wordmark unless explicitly requested.
- The user's anime/cyberpunk reference is mood context only. Extract its dark/cyan character; do not reproduce a crowded scene, anime face, fake system dialogs, or HUD collage.
- Explicitly rejected: generic glossy overlapping blue squares/cards/windows. Changing only the gradient, bevel, or glow does not solve that weakness.
- Preferred outcome: ownable silhouette, one clear semantic idea, controlled negative space, disciplined palette, minimal detail, strong small-size recognition.

## Required design workflow

1. **Inspect:** Read the two project sources and examine current app/repository/reference material when available. Separate verified product facts from assumptions.
2. **Brief:** State product, audience/use context, desired impression, output format, palette, symbol logic, and non-goals.
3. **Explore:** Compare at least three structurally different concept routes. For each, record a strength, a likely misinterpretation, and a reason it might fail. Do not render several weak ideas as a noisy collage.
4. **Select:** Choose a direction based on product fit, originality, silhouette, small-size potential, restraint, and brand fit. Do not cling to the current forked-core / dual-channel concept if critique shows it is generic or unclear; the master prompt's concept gate can replace it before generation.
5. **Prompt:** Write one explicit image prompt describing the central geometry and hierarchy, palette roles, rendering level, icon tile, presentation canvas, safe margins, scale constraints, and strict exclusions.
6. **Verify prompt twice:** First inspect completeness and contradictions; then act as an adversarial image model likely to produce generic clichés. Patch the literal prompt based on the audit before generating.
7. **Generate:** Use the actual available image tool. Never claim upstream scripts ran if they were only read about or are unavailable.
8. **Review:** Use the five specialist lenses in the master prompt. If only one model/operator is involved, label this a **simulated multi-lens council**, not an independent external panel.
9. **Validate:** When an actual image and suitable tools are available, inspect full resolution, 24/32/48 px downscales, grayscale, one-color silhouette, safe area, and rounded-square/circle masks. Re-open and inspect the outputs. Label any unperformed test as not tested.
10. **Refine:** Identify the three largest observable defects and fix those specifically. Preserve the best-so-far candidate and compare each revision fairly; newer does not automatically mean better.
11. **Score honestly:** Assign all ten scores with evidence and use the calibrated rubric. Product fit, originality, small-scale legibility, and silhouette are critical gates. A high average cannot hide a failure.
12. **Report:** Distinguish observed, checked, inferred, and unknown claims. Never assert user-tested memorability, trademark uniqueness, measured performance, external approval, or perfect rendering without corresponding evidence.

## Five-star acceptance policy

The target is 5/5 in every category, not an instruction to inflate ratings. Continue while a concrete weakness and a meaningful next experiment remain. Stop when the criteria are met honestly or when available tools/evidence no longer support useful progress; describe remaining gaps instead of declaring a false perfect result. The master prompt includes an explicit review-cycle policy; honor an explicit user request for additional purposeful cycles where practical, but never use meaningless regeneration loops.

## Upstream UI/UX Pro Max

The upstream project is a design reference: https://github.com/nextlevelbuilder/ui-ux-pro-max-skill

Use its relevant logo-design brief, style, color, industry, scalability, negative-prompt, and pre-delivery guidance when the tooling or reference documentation is available. Verify returned guidance is relevant before applying it. Reading documentation is not the same as running CLI searches. Do not claim the upstream project has been installed, cloned, executed, or vendored unless that actually happened.

## Established palette

- `#000001` — almost-black tile
- `#010205` — deep surface
- `#01132A` — deep navy-blue
- `#176E94` — primary cyan-blue
- `#01304C` — secondary deep blue
- `#FCFDFD` — cool white
- `#F5DADA` — optional blush accent; generally omit from the primary launcher icon
- `#626773` — muted neutral

Use only the colors that serve the concept. The master prompt and project skill are canonical. If verified project facts or the user's explicit direction change, reconcile the sources rather than silently following contradictory instructions.

## Repository editing discipline

- Keep the canonical logo brief/prompt at `design/FLY8-CLONE-LOGO-MASTER-PROMPT.md`.
- Keep reusable workflow rules in `.claude/skills/fly8-brand-design/SKILL.md`.
- Record substantial changes in the relevant document's change log.
- Avoid conflicting duplicate standards; cross-link the two files when a workflow changes.
- Do not copy the full upstream repository into this project merely to claim it is the baseline.
- Do not expose private chain-of-thought. Persist concise decisions, observed evidence, test results, scores, and unresolved risks.

3. Read `design/FLY8-PROMPT-QA-COUNCIL.md` before generating a logo; it is the separate prompt-quality gate, not an image scorecard.
