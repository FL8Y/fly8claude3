# FLY8 Clone — Icon Prompt Round 01
## Product brief, concept selection, red-team council, and final generation prompt

**Status:** Pre-generation design plan  
**Canonical baseline:** `CLAUDE.md`, `.claude/skills/fly8-brand-design/SKILL.md`, and `design/FLY8-CLONE-LOGO-MASTER-PROMPT.md`  
**Upstream framework:** [UI/UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)  
**Selected concept:** Forked-Core / Dual-Channel Mark  
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
A single custom-built mark should begin from one asymmetrical core whose continuous primary form deliberately branches into two offset, independently readable channels. That one-to-two path relationship communicates one app context becoming a separate instance. It must be recognizable from its silhouette; color effects cannot be the only thing making it interesting.

---

## 2. Concept routes considered

These are distinct verbal routes, not symbols to combine.

### Route A — Forked Aperture / Parallax Echo
A geometric aperture with one integrated echo contour. It connects to the optical mood of the reference, but has a high risk of looking like a camera or biometric scanner.

**Strength:** recognizable optical focal point.  
**Risk:** familiar camera/iris cliché can overwhelm the cloning idea.  
**Decision:** keep as a comparison route, not the selected mark.

### Route B — Forked-Core / Dual-Channel Mark
One compact, slightly asymmetrical core has a continuous primary path that intentionally forks into two offset, independently readable channels. The split is structural: one form resolves into a second independent path without adding another card or window.

**Strength:** expresses parallel instances through the main silhouette and avoids relying on familiar UI metaphors.  
**Risk:** could become an abstract tech blob or generic branching symbol.  
**Countermeasure:** give the core a distinctive custom proportion and negative-space cut; make the second path clearly related to the first yet individually readable. Avoid symmetry that produces a stock loop or infinity glyph.  
**Decision:** selected for this round.

### Route C — F/8 Negative-Space Monogram
A custom abstract structure hints at F/8 through negative space without drawing readable text.

**Strength:** possible brand-specific mnemonic.  
**Risk:** can become a forced monogram, illegible pseudo-letter, or infinity-like symbol.  
**Decision:** retain as a fallback only if the dual-channel route cannot achieve a distinctive silhouette.

### Selection
**Route B wins for generation.** It has the strongest balance of product meaning, ownable geometry, and small-size potential. Route A is rejected as the default because its camera/biometric ambiguity is too high. If the generated dual-channel mark looks generic or loses its meaning in silhouette, reject it and test a fourth concept rather than dressing it up with more effects.

---

## 3. Prompt iteration and verification

### Draft 0 — vague aesthetic prompt
“Make a futuristic blue cloning app logo with a dark background.”

**Failed checks:** it could create anything; no symbol logic, no safe-area or canvas guidance, and no protection from generic blue tech imagery.

### Draft 1 — meaning added
“Create an abstract mark where one app context branches into a second independent path. Use cyan-blue on black.”

**Improvement:** states the one-to-two meaning.  
**Still weak:** the model could draw a literal branch, network icon, split arrow, infinity loop, or generic curves.

### Draft 2 — custom shape logic added
“Create one compact asymmetrical core whose continuous path forks into two offset channels; make the path relationship itself express separate app instances. Do not use cards, windows, arrows, or a generic loop.”

**Improvement:** establishes the core, branching relationship, and anti-cliché constraints.  
**Still weak:** no presentation canvas, dimensions, safe area, palette hierarchy, or finish requirements.

### Draft 3 — production constraints added
The final prompt below specifies one white-canvas presentation, one dark icon tile, defined color roles, limited geometry, generous safe margins, no essential hairlines, a restrained vector-like treatment, and explicit 24/32/48 dp, grayscale, and silhouette checks.

**Remaining risk:** image models may ignore constraints or introduce artifacts. No prompt can prove small-size success before the rendered candidate is inspected.

---

## 4. Adversarial design council

This is a structured multi-lens review. Unless distinct outside people/models actually review the prompt separately, it must be reported as a simulated council—not an independent external panel.

### 1) Brand strategist
- **Strength:** one core that becomes two paths is directly relevant to distinct app instances.
- **Risk:** an abstract split can mean network branching, sync, or data flow instead of app cloning.
- **Required revision:** make the second path visibly an echo/parallel instance of the same core, not an arrow, branch diagram, or disconnected object.

### 2) Senior identity designer
- **Strength:** one integrated silhouette gives the mark room to become ownable.
- **Risk:** two paths can easily become a generic infinity loop or an arbitrary technology glyph.
- **Required revision:** use a custom off-center core and a purposeful negative-space cut; avoid two equal loops and perfect mirrored geometry.

### 3) Android launcher specialist
- **Strength:** one compact icon on a dark tile is appropriate for a launcher.
- **Risk:** narrow internal gaps or fine lines may merge at 24–48 dp or clip under masks.
- **Required revision:** make both channels robust and open; keep the symbol comfortably inside the safe region; judge small-size behavior from actual previews when available.

### 4) Art director / color critic
- **Strength:** black, cyan-blue, deep blue, and selective white match the established FLY8 visual language.
- **Risk:** all-over glow, glass, and reflective edges can hide a weak silhouette.
- **Required revision:** the flat one-color silhouette must work first; use cyan only to clarify the defining path.

### 5) Skeptical end user
- **Strength:** a unique one-to-two core has more identity potential than stacked panels.
- **Risk:** it could still be misread as network, sync, AI, or a security utility.
- **Required revision:** avoid arrows, node diagrams, infinity loops, eye/camera cues, and generic circuit decoration; make the two channels feel like parallel instances of a single original form.

### Council resolution
Proceed with **Route B — Forked-Core / Dual-Channel Mark**. The duplication idea must be embodied in one core splitting into two offset paths. No camera/eye-centered motif, no windows/cards, no generic loop, no arrow, and no decorative circuitry. If the first render loses clarity or looks like a common category symbol, reject the structure rather than adding lighting.

---

## 5. Final image-generation prompt

Use the following full prompt for this round. It is aligned with the selected concept in the master prompt.

> Create one original, professional Android launcher icon for FLY8 Clone, an app-cloning utility for keeping distinct app instances or parallel app contexts. Work like a senior brand identity designer and Android launcher-icon specialist. Follow a product-first design approach informed by UI/UX Pro Max logo principles: specific symbol logic, restrained palette, clear silhouette, carefully chosen visual style, explicit negative constraints, and strict pre-delivery review. Do not create generic technology artwork.
>
> **CONCEPT — FORKED-CORE / DUAL-CHANNEL MARK:** Design one compact, slightly asymmetrical core whose continuous primary form deliberately separates into two offset, independently readable channels. The channels must clearly belong to the same custom-built structure: one original path becomes a separate instance path. This integrated one-to-two relationship is the central metaphor for app cloning. It must be visible in the outer silhouette and meaningful negative space—not added as a second card, window, app tile, arrow, or pasted-on duplicate. Give the core a distinctive contour and one purposeful internal cut that make the mark recognizable even without color.
>
> Avoid the familiar categories of camera lens, biometric reader, eye-tracking tool, infinity loop, network-node diagram, sync arrows, cloud drive, folder, generic AI logo, and gaming-cheat icon. An optical hint may exist only as subordinate negative space if it genuinely improves the geometry; the icon must not read primarily as an eye, camera, scanner, or shutter. If the main meaning depends on explanation, reject the shape.
>
> **SHAPE HIERARCHY:** use one dominant core and one integrated dual-channel/fork cue. No more than two essential shape ideas. Maintain clear hierarchy, generous negative space, consistent edge thickness, coherent corner radii, clean joins, and optical balance. Slight asymmetry is encouraged when it improves ownability. Both channels must remain distinct at small size; do not draw one as a hairline. The flat black silhouette must feel original before gradients or lighting are applied.
>
> **BRAND PALETTE:** near-black tile #000001 and/or deep surface #010205; deep negative-space blue #01132A; signature cyan-blue #176E94; secondary deep blue #01304C; selective cool-white highlight #FCFDFD. Keep the palette restrained—approximately three main colors with white used sparingly. Cyan identifies the important branching/echo relationship; navy provides negative space. Do not add blush pink, random purple, gold, rainbow gradients, or unrelated accent colors.
>
> **STYLE AND FINISH:** precise, authored, vector-like geometry with a near-flat or subtly dimensional finish. Any gradient or highlight must clarify form and remain subordinate to the silhouette. No foggy bloom, continuous outer glow, lens flares, metallic scratches, photorealistic surfaces, excessive bevels, glossy glass slabs, plastic reflections, noisy grain, random circuit patterns, glitch particles, HUD ornaments, stars, or floating shards. The icon must work with all effects removed.
>
> **COMPOSITION / PRESENTATION:** square 1:1 high-resolution presentation. Show exactly one dark rounded-square/squircle launcher tile centered on a plain pure-white canvas with equal, generous outer margins. The dark tile occupies about 72–76% of the canvas width. Inside it, the symbol occupies about 56–68% of the tile's shorter dimension, optically balanced and safely inset from the edge. The white canvas is only presentation space; the icon itself is the dark tile. No unnecessary drop shadow, title, border, caption, device, collage, or extra object.
>
> **ANDROID SMALL-SIZE DESIGN:** design for coherent recognition at 24 dp, 32 dp, and 48 dp and leave adequate space for common rounded-square or circular adaptive masks. Do not rely on hairline gaps, tiny cutouts, microtext, edge glows, or fine decoration to express the second channel. The core and both paths must remain visually distinct when reduced and when viewed as a one-color silhouette. These are requirements to verify after generation, not proof that testing has already happened.
>
> **BRAND FEEL:** composed, technical, precise, compact, discreet, premium, and distinctly FLY8. Keep the user's preferred black/cyan cyber-tech energy, but express it through original geometry and controlled contrast rather than anime illustration or visual noise. The result must look like a serious mobile utility's identity, not a generic AI product or a concept-art poster.
>
> **STRICT NEGATIVE PROMPT:** no overlapping rounded squares; no stack of app cards or windows; no floating application panels; no fake title bars; no minimize/close controls; no dialogs; no yes/no buttons; no readable or pseudo text; no letters; no FLY8 wordmark; no slogans; no watermark; no signature; no multiple logos; no concept grid; no phone mockup; no screenshot; no anime character or face; no literal human eye; no camera lens; no shutter blades; no fingerprint; no target reticle; no infinity sign; no cloud or folder; no copy glyph; no recycle arrows; no network nodes; no sync arrows; no orbital rings; no random circuit board; no glitch confetti; no particles; no stars or sparks; no floating shards; no decorative HUD; no heavy outer glow; no purple-pink gradient; no rainbow color; no photorealism; no realistic 3D rendering; no glass panels as the main symbol; no hairline details; no noise texture; no clutter; no warped geometry; no accidental duplicate cores; no off-center tile; no clipped symbol.
>
> **SELF-CRITIQUE BEFORE ACCEPTING:** Could this icon be mistaken for a network/sync logo, AI product, camera, biometric scanner, or generic tech company? Does the fork/dual-channel relationship communicate one instance becoming two without words? Is there one ownable silhouette? Does it still work as flat monochrome artwork? Are both paths distinct at small size? Can any decorative detail be removed without harming meaning? If a critical answer exposes a weakness, revise the geometry or the concept; do not hide it with effects. Output exactly one icon and no explanatory text.

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
