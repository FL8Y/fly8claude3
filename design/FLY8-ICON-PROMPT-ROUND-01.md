# FLY8 Clone — Icon Prompt Round 01
## Product brief, concept selection, red-team council, and final generation prompt

**Status:** Pre-generation design plan  
**Canonical baseline:** `CLAUDE.md`, `.claude/skills/fly8-brand-design/SKILL.md`, and `design/FLY8-CLONE-LOGO-MASTER-PROMPT.md`  
**Upstream framework:** [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)  
**Selected concept:** Forked Aperture / Parallax Echo  
**Deliverable:** One original Android launcher icon, square 1:1, presented on a plain white canvas with one centered dark icon tile

> This document records the actual decisions used for this generation round. It is distinct from the master prompt: the master prompt is the reusable rulebook; this file is the run-specific brief and reviewed prompt.

---

## 1. Product-first design brief

### Product
FLY8 Clone is an Android app-cloning utility intended to support distinct app instances or parallel app contexts. The logo should convey purposeful duplication and separation—not generic technology.

### Audience and context
Android users see this asset primarily as a small home-screen / app-drawer icon. They need to recognize it in a dense field of unrelated icons. The form must be stable under small-size rendering and typical adaptive icon masking. It should not require explanatory text.

### Desired impression
Precise, distinctive, technically capable, modern, composed, lightweight, and premium. The visual language may retain the user's affinity for dark cyber-tech and electric-blue eye/lens imagery, but the result must be a logo—not anime artwork, a sci-fi poster, or a miniature interface screenshot.

### Existing brand palette
- `#000001` — almost-black icon foundation
- `#010205` — deep neutral surface
- `#01132A` — deep navy for negative-space depth
- `#176E94` — signature cyan-blue
- `#01304C` — secondary deep blue
- `#FCFDFD` — selective cool-white highlight
- `#F5DADA` — inherited blush reference tone, intentionally excluded from this primary icon
- `#626773` — muted neutral, not needed in the primary mark

### Known failure modes from previous candidates
1. **Two glossy blue panels:** polished but generic; easily mistaken for cloud storage, files, windows, or multitasking.
2. **Anime eye plus many dialogs and cyber decorations:** memorable mood but too many competing elements; reads like promotional artwork rather than a scalable app mark.
3. **Glow-heavy symbol:** can make a weak silhouette appear impressive at full size while details merge when reduced.
4. **Literal aperture/camera motif:** may suggest a camera or biometric scanner unless the duplication concept is structurally integrated.

### Success definition
A single custom-built mark should connect a lens/iris-like core to an integrated fork/echo that communicates one app context becoming a separate instance. It must be recognizable from its silhouette; the color effects cannot be the only thing making it interesting.

---

## 2. Concept routes considered

These are distinct verbal design routes, not three icons to cram into one image.

### Route A — Forked Aperture / Parallax Echo
One compact geometric aperture contains a clear central negative-space core. A primary contour deliberately forks into one short, offset echo, implying one identity extended into an independent parallel instance. It has optical energy without drawing a literal eye. The contours should be integrated into one symbol, not stacked like cards.

**Strengths:** product meaning can be encoded in the geometry; fits the black/cyan identity; works as an abstract pictorial mark; offers a specific silhouette to refine.  
**Risk:** can drift toward a stock camera shutter or biometric scanner.  
**Countermeasure:** no concentric lens rings, camera shutter blades, target reticles, or literal eyeball; the forked/echo relationship must be more memorable than the lens cue.

### Route B — F/8 Negative-Space Monogram
A custom abstract F-like rail and a doubled counter-space hint at “F8,” with no actual text. It could create an ownable brand mnemonic.

**Strengths:** potential brand-specificity.  
**Risk:** if the letter construction is not expertly drawn, it may look like a generic monogram or cryptic glyph and lose the app-cloning meaning.  
**Decision:** reserve as a fallback exploration; not the primary route for this image generation because the brief's most useful visual equity is the user's dark, optical, cyan-blue direction.

### Route C — Split Crystal / Twin Path
A compact faceted form has a core splitting into two offset blue paths, like a crystal refracting into a second instance.

**Strengths:** strong technical character and simple silhouette.  
**Risk:** likely to become a generic shard, gem, or abstract AI/crypto logo unless the duplication logic is unusually specific.  
**Decision:** reject for this round; use only if the aperture route fails at the thumbnail and cliché checks.

### Selection
**Route A is the best first candidate** because it connects the visual language of the user's reference (optical focal point, dark/cyan cyber-tech) to the product meaning (distinct parallel instances) without reproducing a character or piling on windows. It is not automatically a final logo; the rendered result must still survive the scorecard.

---

## 3. Prompt iteration and verification

### Draft 0 — vague aesthetic prompt
“Make a futuristic blue cloning app logo with a dark background.”

**Failed checks:** could create anything; no unique symbol logic, no explicit output canvas, no small-size limits, no banned clichés. It encourages generic blue technology imagery.

### Draft 1 — the symbol was specified
“Create a geometric aperture that branches into a second contour, symbolizing one app instance becoming another. Use cyan-blue on black.”

**Improvement:** meaningful metaphor and basic palette.  
**Still weak:** aperture can become a camera icon; no composition or production details; doesn't prevent glow-heavy complexity.

### Draft 2 — composition and exclusions added
“Create one forked aperture mark, centered in a black rounded-square icon tile on a white presentation canvas. Use a constrained cyan/deep-blue palette, clean geometry, and a single echo contour. Avoid generic stacked cards, camera-shutter blades, infinity loops, text, and decorations.”

**Improvement:** clear canvas, shape hierarchy, brand palette, output count, and anti-patterns.  
**Still weak:** “single echo contour” may become too thin at small sizes; not explicit about silhouette resilience and optical balance.

### Draft 3 — scale and craft constraints added
The final prompt below specifies relative mark size, minimum line/body thickness by visual intent, safe space near the mask, negative space, limited colors, no hairline details, and one-color/thumbnail performance.

**Remaining risk:** generated artwork may ignore geometry or invent artifacts. This cannot be solved by prompt wording alone; the resulting image must be inspected after generation.

---

## 4. Adversarial design council

The following roles are used as a structured review, not as evidence of independent human testing.

### 1) Brand strategist
- **Strength:** one identity branching into a second path is more relevant than generic duplicate cards.
- **Risk:** an abstract mark may communicate “optics” before “cloning.”
- **Required revision:** make the echo/fork unmistakably part of the same structure and visually separate from the core, so the idea of parallel instances can be inferred rather than explained.

### 2) Senior identity designer
- **Strength:** one primary contour and one integrated echo can make a coherent mark.
- **Risk:** a conventional aperture is a familiar category symbol.
- **Required revision:** ban concentric camera rings, shutter blades, and perfect target symmetry; give the silhouette a deliberate fork and unique negative-space cut.

### 3) Android launcher specialist
- **Strength:** a single centered mark on a dark tile fits standard launcher usage.
- **Risk:** narrow internal gaps, thin line art, or an oversized shape will fail at 24–48 dp and may be clipped by mask variants.
- **Required revision:** use robust forms and generously open negative spaces; keep the logo well inside the tile's safe region; design for a small-size read from the start.

### 4) Art director / color critic
- **Strength:** the restricted black, cyan-blue, deep-blue, and selective white palette is coherent with FLY8.
- **Risk:** all-over glow or too many reflective edges will make the mark look AI-generated and obscure shape quality.
- **Required revision:** make color explain the hierarchy, not decorate it; insist the mark still works without glow.

### 5) Skeptical end user
- **Strength:** a compact optical core can be remembered more easily than a complex collage.
- **Risk:** it could be mistaken for a camera, eye scanner, or generic cybersecurity product.
- **Required revision:** avoid literal iris rings/reticles, make the forked duplicate contour the distinguishing cue, and remove every irrelevant cue.

### Council resolution
Keep Route A, but only in an **abstract forked aperture** form. The design must combine one compact optical core with one visible branching/echo contour. Do not draw an actual eye, camera lens, character, windows, or UI controls. If the render looks like a camera/security scanner, reject it and adjust the core/branch relationship rather than adding decoration.

---

## 5. Final image-generation prompt

Use the following prompt as the full generation brief.

> Create one original, professional Android launcher icon for **FLY8 Clone**, an app-cloning utility for keeping distinct app instances or parallel app contexts. Work like a senior brand identity designer and Android launcher-icon specialist. Follow a product-first design approach informed by UI/UX Pro Max logo principles: specific symbol logic, disciplined palette, clear silhouette, carefully chosen visual style, explicit negative constraints, and strict small-size review. The goal is not simply “a futuristic tech logo”; it is a recognizable FLY8 mark.
>
> **CONCEPT — FORKED APERTURE / PARALLAX ECHO:** Draw one compact, custom geometric aperture symbol with a deliberate central negative-space core. One strong contour continues from the main form and forks/echoes into one clearly related but separately legible offset path. This controlled branch is the main cloning metaphor: one original app context becoming a parallel instance. The fork and core must read as a single coherent symbol, not as two objects stacked together. The offset path must have enough mass to survive reduction; do not make it a hairline. Use an ownable, subtly asymmetric outline and a purposeful inner cut so the silhouette is not interchangeable with generic clone, cloud, file, or multitasking icons.
>
> The mark may suggest focus or an optical iris, but remain abstract. Do not draw a literal eye, eye anatomy, face, anime character, camera lens, camera shutter, fingerprint, target reticle, or biometric scanner. Avoid perfect concentric circles and conventional shutter blades. It should feel like a bespoke FLY8 symbol discovered through thoughtful geometry, not a stock pictogram with cyan lighting.
>
> **SHAPE HIERARCHY:** one dominant compact aperture mass, one central negative-space core, and one integrated echo/fork. No more than these three essential shape ideas. The main contour should form a confident, memorable outer silhouette. Use deliberate negative space, coherent edge thickness, considered corner radii, clean joins, and optical balance. Slight asymmetry may be used to make the silhouette more distinctive, but it must look intentional rather than off-center. The symbol should be interesting as flat black-on-white artwork before color or rendering effects are added.
>
> **BRAND PALETTE:** tile foundation `#000001` and/or `#010205`; deep negative-space blue `#01132A`; signature cyan-blue `#176E94`; secondary deep blue `#01304C`; very limited cool-white highlights `#FCFDFD`. Keep the total palette restrained, about three colors plus a small highlight. Use cyan to identify the important fork/echo edge and deep blue to support the core. White is a selective highlight, never a continuous glowing outline around everything. Do not add blush pink, purple, gold, rainbow gradients, or arbitrary accent colors.
>
> **SURFACE / STYLE:** crisp vector-like geometry, near-flat or only subtly dimensional, precise edge treatment, premium and deliberate. Gradients are allowed only to reinforce form. Keep any edge light narrow and controlled. No foggy bloom, lens flares, metallic scratches, photorealistic surfaces, heavy glass slabs, excessive bevels, plastic reflections, noisy grain, random circuit textures, or a 3D game-object appearance. The symbol must retain its quality with the glow disabled.
>
> **COMPOSITION / OUTPUT:** square 1:1 high-resolution presentation, one single dark rounded-square/squircle app tile centered on a clean pure-white canvas with even generous outer margins. The tile should occupy roughly 72–76% of the full canvas width. Inside it, the symbol should occupy about 56–68% of the tile's shorter dimension, balanced optically and surrounded by safety space. Do not let any key shape approach the tile boundary. Keep the center strong but not oversized. No shadow is required; if any separation is needed it should be barely perceptible. The white canvas is only the presentation field; the icon itself is the dark tile.
>
> **SMALL-SIZE REQUIREMENT:** design the mark so its primary silhouette remains clear at 24 dp, 32 dp, and 48 dp and survives common Android adaptive-icon mask shapes. Do not depend on tiny cutouts, hairline gaps, microtext, fine orbit lines, or glow to show the branching idea. Ensure the fork/echo and central core remain distinguishable when viewed as a tiny thumbnail and when converted to a single-color silhouette. Preserve clear visual hierarchy: aperture first, branching cue second, highlights last.
>
> **BRAND FEEL:** confident, precise, compact, technical, tasteful, recognizable, quietly futuristic. Bring forward the user's preferred dark/cyan energy, but express it through authored geometry and negative space rather than anime art or cyberpunk noise. The result should look credible as a serious Android utility icon while still having its own personality.
>
> **STRICT NEGATIVE PROMPT:** no generic overlapping rounded squares; no stack of app cards; no floating application windows; no fake window title bars; no close/minimize buttons; no dialog boxes; no yes/no buttons; no readable or unreadable text; no letters; no FLY8 wordmark; no slogans; no watermark; no signatures; no extra logos; no logo grid; no phone mockup; no screenshot; no anime character or face; no literal human eye; no camera lens; no camera-shutter blades; no fingerprint; no target reticle; no generic infinity sign; no cloud/folder symbol; no copy glyph; no recycle arrows; no orbiting rings; no random circuit board; no glitch confetti; no particles; no stars or sparks; no floating shards; no decorative HUD; no heavy outer glow; no purple-pink gradient; no rainbow color; no photorealism; no realistic 3D rendering; no glass panels used as the main symbol; no hairline details; no noisy texture; no clutter; no warped geometry; no accidental duplicate cores; no off-center tile; no clipped symbol.
>
> **FINAL QUALITY GATE:** before accepting the image, challenge it as a skeptical identity designer. Would its silhouette still feel ownable in one color? Could it be mistaken for a camera, security scanner, cloud app, or generic tech company? Does the fork/echo communicate one instance branching into another without needing text? Does the symbol remain legible when tiny? Can any detail be removed without reducing its meaning? If it fails a key check, change the symbol construction or negative space rather than adding effects. Output exactly one icon, no explanatory text.

---

## 6. Five-star scorecard for the generated result

Do not score the prompt as if it were already a successful image. After generation, score the actual pixels. Each dimension needs concrete evidence.

| Dimension | What qualifies as 5/5 | Failure signal |
|---|---|---|
| Product relevance | Integrated fork/echo plausibly communicates a separate parallel instance | Looks merely like optics or generic tech |
| Distinctiveness | Custom silhouette and negative space | Resembles common camera, cloud, clone-card, or infinity icon |
| First-glance recognition | One focal shape is immediately memorable | Too many shapes compete |
| 24 dp readiness | Main silhouette remains coherent | Tiny lines/gaps collapse |
| 32–48 dp readiness | Core and echo remain distinct | Details merge or echo disappears |
| Monochrome strength | Still ownable without color effects | Looks generic when flattened |
| Composition | Optically centered, balanced, mask-safe | Cropping, crowded tile, weak negative space |
| Palette control | Black/cyan/deep blue roles clear and restrained | Glow dominates; unrelated colors compete |
| Craft | Clean geometry and no image-model defects | Wobbly contours, doubled anatomy, artifacts |
| Output readiness | Single icon on white presentation canvas, no text, safe margins | Collage, labels, watermark, wrong crop |

A 5/5 is not a promise and not a vote of confidence. If a rendered output scores below 5 on a critical dimension, record the defect and make a meaningful revision.

---

## 7. Post-generation council and iteration protocol

For each generated candidate:
1. Record the candidate's visible strengths and the three most consequential defects.
2. Review from five lenses: brand strategist, senior identity designer, Android launcher specialist, art director/color critic, skeptical end user.
3. Require each lens to identify one failure risk and one concrete adjustment; one lens must challenge the favored concept.
4. Score the ten dimensions independently; re-score from scratch after each revision.
5. Compare every new candidate with the current best at the same size and, if tools permit, in a simulated 48 px thumbnail and grayscale.
6. Change a real design variable—shape architecture, negative space, branch ratio, contour thickness, optical center, or effect density. Do not count an arbitrary gradient change as a useful iteration.
7. Keep the best candidate, not necessarily the most recent candidate.
8. Target five stars in every dimension. Stop early only when scores are honestly supported. If eight purposeful rounds are completed and any criterion remains below 5, report the limitation and the next meaningful experiment instead of falsely claiming perfection.

**Important:** the prompt and this plan have been reviewed; the visual asset still needs its own post-generation review. Prompt quality is not evidence that a generated result has passed every criterion.
