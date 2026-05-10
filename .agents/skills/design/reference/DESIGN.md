---
version: alpha
name: Tequio Tech (Amate Codex)
description: A light-mode primary design system rooted in the warmth of Mesoamerican bark-paper codices and the structural rigor of carved jade. The codex companion to Tequio Tech's Cyber-Aztec dark mode — built for documentation, dashboards, and long reading sessions where parchment beats obsidian.

colors:
  primary: "#1A6B5A"
  primary-hover: "#21856F"
  on-primary: "#F2E6CC"
  secondary: "#4A3525"
  on-secondary: "#F2E6CC"
  surface: "#F2E6CC"
  surface-raised: "#EADCB8"
  surface-sunken: "#FAF1DC"
  on-surface: "#1F1208"
  on-surface-muted: "#6B5840"
  border: "#D9C7A3"
  border-strong: "#4A3525"
  error: "#B8284A"
  on-error: "#F2E6CC"
  warning: "#8C5000"
  on-warning: "#F2E6CC"
  accent: "#D17A00"
  on-accent: "#1F1208"

typography:
  display:
    fontFamily: Outfit
    fontSize: 3.5rem
    fontWeight: 700
    lineHeight: 1.05
    letterSpacing: -0.02em
  h1:
    fontFamily: Outfit
    fontSize: 2.5rem
    fontWeight: 700
    lineHeight: 1.1
    letterSpacing: -0.01em
  h2:
    fontFamily: Outfit
    fontSize: 1.875rem
    fontWeight: 600
    lineHeight: 1.2
  h3:
    fontFamily: Outfit
    fontSize: 1.375rem
    fontWeight: 600
    lineHeight: 1.3
  body-lg:
    fontFamily: Space Grotesk
    fontSize: 1.125rem
    fontWeight: 400
    lineHeight: 1.6
  body-md:
    fontFamily: Space Grotesk
    fontSize: 1rem
    fontWeight: 400
    lineHeight: 1.6
  body-sm:
    fontFamily: Space Grotesk
    fontSize: 0.875rem
    fontWeight: 400
    lineHeight: 1.5
  label-caps:
    fontFamily: Outfit
    fontSize: 0.75rem
    fontWeight: 600
    letterSpacing: 0.08em
  code:
    fontFamily: JetBrains Mono
    fontSize: 0.875rem
    fontWeight: 400
    lineHeight: 1.55

rounded:
  none: 0px
  sm: 2px
  md: 4px
  lg: 6px

spacing:
  xs: 4px
  sm: 8px
  md: 16px
  lg: 24px
  xl: 32px
  2xl: 48px
  3xl: 64px

components:
  button-primary:
    backgroundColor: "{colors.primary}"
    textColor: "{colors.on-primary}"
    typography: "{typography.label-caps}"
    rounded: "{rounded.sm}"
    padding: 12px 20px
  button-primary-hover:
    backgroundColor: "{colors.primary-hover}"
    textColor: "{colors.on-primary}"
  button-secondary:
    backgroundColor: "{colors.surface}"
    textColor: "{colors.secondary}"
    typography: "{typography.label-caps}"
    rounded: "{rounded.sm}"
    padding: 12px 20px
  button-secondary-hover:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.secondary}"
  button-destructive:
    backgroundColor: "{colors.error}"
    textColor: "{colors.on-error}"
    typography: "{typography.label-caps}"
    rounded: "{rounded.sm}"
    padding: 12px 20px
  input-default:
    backgroundColor: "{colors.surface-sunken}"
    textColor: "{colors.on-surface}"
    typography: "{typography.body-md}"
    rounded: "{rounded.sm}"
    padding: 10px 14px
  input-focus:
    backgroundColor: "{colors.surface-sunken}"
    textColor: "{colors.on-surface}"
  card-default:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.on-surface}"
    rounded: "{rounded.md}"
    padding: 24px
  card-muted:
    backgroundColor: "{colors.surface-raised}"
    textColor: "{colors.on-surface-muted}"
    rounded: "{rounded.md}"
    padding: 24px
  alert-warning:
    backgroundColor: "{colors.warning}"
    textColor: "{colors.on-warning}"
    rounded: "{rounded.sm}"
    padding: 12px 16px
  badge-accent:
    backgroundColor: "{colors.accent}"
    textColor: "{colors.on-accent}"
    typography: "{typography.label-caps}"
    rounded: "{rounded.sm}"
    padding: 4px 10px
  divider-default:
    backgroundColor: "{colors.border}"
    textColor: "{colors.on-surface-muted}"
    height: 1px
  divider-strong:
    backgroundColor: "{colors.border-strong}"
    textColor: "{colors.on-surface}"
    height: 1px
---

## Overview

Tequio Tech is a "Cyber-Aztec" design system that fuses Mesoamerican communal philosophy (*tequio* — collective labor that builds cities) with modern digital precision. The **Amate Codex** variant is the system's light-mode foundation: a parchment-led palette inspired by the bark paper (*amate*) that scribes (*tlacuilos*) painted Mesoamerican codices on for centuries.

Where the dark Mictlan Void variant evokes obsidian and circuitry, Amate Codex feels carved into warm stone-paper. It is the canvas of the scribe — built for documentation, long-form reading, dashboards, and any surface where the user needs to dwell.

Four principles anchor every decision:

- **Ometeotl (Duality)** — every component balances form and function, dark and light. Amate Codex is half of that pair.
- **Teocalli (Monumental Structure)** — modular, interlocking, structurally honest. No floating glassmorphism.
- **Chinampa (Cultivated Growth)** — content is grown in structured rows, like the Aztec floating gardens.
- **Tlacuilo (Visual Storytelling)** — every glyph and micro-interaction carries meaning. Decoration without intent is forbidden.

## Colors

The palette is extracted from the natural materials of the Mexica empire — bark paper, jade, sepia ink, cochineal dye, marigold petals — and tuned for WCAG AA contrast on screen.

- **Primary (#1A6B5A) — Living Jade.** The most precious stone in the ancient world, more valuable than gold. Drives all forward action: primary buttons, links, focus states, success affordances.
- **Primary Hover (#21856F).** A touch brighter; signals interactivity without breaking the carved-stone feel.
- **Secondary (#4A3525) — Sepia Obsidian.** The structural ink of the codex. Used for emphasis text, strong borders, and serif-of-the-system gravitas.
- **Surface (#F2E6CC) — Amate.** The bark-paper canvas. Warmer than off-white, lower glare than pure parchment. The default page background.
- **Surface Raised (#EADCB8).** A slightly deeper amate for cards, panels, and inset content. Replaces shadows; structure comes from tone, not elevation.
- **Surface Sunken (#FAF1DC).** A lighter amate for input fields and content wells — the "freshly prepared paper" before the scribe writes.
- **On-Surface (#1F1208) — Codex Ink.** Deep cocoa-black for body text. Never use pure black; the warm undertone is the whole point.
- **On-Surface Muted (#6B5840).** Faded ink for captions, metadata, and secondary copy. Passes AA at body sizes on Surface and Surface Raised.
- **Border (#D9C7A3).** Soft amate edge for default 1px dividers and component outlines.
- **Border Strong (#4A3525).** Sepia ink for emphasis borders, focus rings, and section breaks of consequence.
- **Error (#B8284A) — Cochineal.** The crimson dye extracted from cochineal insects, once worth its weight in silver. Reserved for destructive actions and critical alerts. Never decorative.
- **Warning (#8C5000) — Toasted Cempasúchil.** A darkened marigold that meets AA contrast on amate. Use for caution states and unverified content.
- **Accent (#D17A00) — Cempasúchil.** Vibrant marigold for ornament, status dots, badge fills, and ritual highlights. Does not meet AA on amate at body sizes — never use as text on the surface. Safe as a background fill with `on-accent` ink on top.

## Typography

Two typeface families do all the work. The headline voice carves; the body voice flows.

- **Headlines — Outfit.** A geometric, slightly wide sans-serif that evokes monumental stone inscription. Used for `display`, `h1`, `h2`, `h3`, and `label-caps`. Always sentence case; never title case, never all caps except the `label-caps` token (which uses tracking instead of weight to project authority).
- **Body — Space Grotesk.** A humanist tech sans with generous apertures — the digital equivalent of the *tlacuilo's* fluid brushstroke. Used for `body-lg`, `body-md`, and `body-sm`. Default reading size is `body-md` at 1rem with line-height 1.6 for codex-density legibility.
- **Code — JetBrains Mono.** Used in the `code` token for inline code, technical strings, and data-heavy tables. Slightly smaller than body to sit visually flush with running text.

Three weights only across the system: 400 (regular body), 600 (subheadings, labels, button text), 700 (display and h1). Anything heavier reads as decoration; anything lighter loses on warm parchment.

## Layout

Layouts behave like *chinampas* — structured, fertile rows where content grows naturally. The grid is the architecture; whitespace is the soil.

- **Spacing scale** is a 4px-rooted progression: `xs` (4), `sm` (8), `md` (16), `lg` (24), `xl` (32), `2xl` (48), `3xl` (64). All component padding, margins, and gap values must come from this scale. No bespoke values.
- **Container max-width** is 1280px for marketing surfaces, 1024px for documentation, 720px for long-form prose. Codex-style reading rewards narrower measures.
- **Section rhythm:** vertical spacing between sections is `2xl` (48px) at minimum, `3xl` (64px) for primary divisions of a page.
- **Inline spacing** within a component (icon-to-label, label-to-input) defaults to `sm` (8px).

## Elevation & Depth

Tequio Tech does not use shadows, blurs, or floating elevation. Depth comes from **tonal stratification** of amate surfaces and the structural authority of borders.

- A "raised" element uses `surface-raised` (#EADCB8) against `surface` (#F2E6CC).
- A "sunken" element (input field, code block) uses `surface-sunken` (#FAF1DC) inside a `surface` page or inside a card on `surface-raised`.
- The only legitimate "shadow" is a 1px `border` line. Focus rings use a 2px `border-strong` outline at 2px offset — the stone is carved, not lit.

## Shapes

The system's signature shape language is **carved, not bubbled**.

- **Corner radii** stay below 6px in every component. `sm` (2px) is the workhorse for buttons, inputs, badges, and alerts. `md` (4px) is reserved for cards and larger containers. `lg` (6px) is the absolute ceiling — used only for full-page modal frames or hero containers. `none` (0px) is encouraged for dividers, table cells, and any element where the right angle reinforces structure.
- **Step-fret (*Xicalcoliuhqui*) motifs** are the system's ornamental signature. Use them subtly: in card corner accents, divider end-caps, loading-state animations, empty-state illustrations, and section break ornaments. Never as repeating background tiles behind body content (illegible). The motif uses 90° and 45° angles only — never curves.
- **Iconography** is linear, 2px stroke, square-cornered. Glyphs derive from the same step-fret + circuit-line vocabulary as the brand mark. Filled icons are reserved for active or selected states.

## Components

### Buttons (The *Teocalli*)

Primary buttons are the carved stone steps that lead the user upward. They use deep jade fill, amate text, and the `label-caps` typography token (tracked uppercase) for ceremonial weight. Hover transitions to a brighter `primary-hover` jade — never an opacity fade. Secondary buttons sit on the page surface with a 1px `border-strong` outline; they share the carved-stone proportions but recede visually. Destructive buttons swap in cochineal red and should appear only inside confirmation dialogs, never in primary navigation flow.

### Inputs (The *Codex Fields*)

Inputs use `surface-sunken` to read as freshly prepared amate awaiting the scribe. Default state shows a 1px `border` outline; on focus, the border swaps to `border-strong` (sepia) with a 2px outline offset — the moment the brush touches paper. Placeholder text uses `on-surface-muted`; entered text uses full `on-surface` ink.

### Cards (The *Chinampas*)

Cards use `surface-raised` against the page `surface`, with a 1px `border` for definition. No shadows. Optional step-fret corner ornaments may appear in the top-left in `accent` (cempasúchil) at 16px size for category cards or featured content. Card padding is always `lg` (24px). The `card-muted` variant uses `on-surface-muted` for body text — for archival or de-emphasized content.

### Alerts & Badges

`alert-warning` uses solid `warning` fill with `on-warning` text — meant to interrupt. `badge-accent` uses cempasúchil with codex ink on top, sized for inline status indicators (12px label-caps, 4×10px padding). For success states, reuse `primary` jade; for errors, reuse `error` cochineal.

### Dividers

`divider-default` is a 1px `border` line — used between table rows, list items, and sibling sections. `divider-strong` is a 1px `border-strong` line, reserved for separating major page regions or codex-style chapter breaks. Never use both in the same view.

## Do's and Don'ts

**Do** treat amate as a tactile material. The page should feel like paper held in hand — warm, slightly textured (in spirit), readable for hours.

**Do** use jade as the single source of forward motion. If something can be clicked to advance, it is jade or it is nothing.

**Do** favor tonal surface stratification over shadows. Three amate values (`surface`, `surface-raised`, `surface-sunken`) handle every "depth" need the system has.

**Do** lean into step-fret ornament at moments of consequence — empty states, card accents, loading animations, divider end-caps.

**Do** use sentence case across all UI text, including button labels (the `label-caps` token uses tracked uppercase only for short ceremonial labels like "Initiate" or "Submit", not full sentences).

**Don't** use pure white (#FFFFFF) or pure black (#000000) anywhere. The warmth of amate and the cocoa of codex ink are the entire visual identity. Pure neutrals destroy the brand in one stroke.

**Don't** use `accent` (cempasúchil) for body text or any sustained reading surface — it fails AA contrast on amate. Marigold is for ornament and badge fills only.

**Don't** add drop shadows, glows, blurs, gradients, or glassmorphism. The system is carved, not lit. If something needs visual prominence, give it a `border-strong` outline or a darker surface tone.

**Don't** use rounded corners above 6px. Bubbly UI breaks the stone-and-paper metaphor immediately. When in doubt, go to 2px.

**Don't** mix Outfit and Space Grotesk weights below 400 or above 700. Three weights — 400, 600, 700 — are the system. More weights, more noise.

**Don't** use cochineal (`error`) decoratively. Red in this system means *destruction* or *critical alert*. A red border on a non-error card is a category violation.

**Don't** stack step-fret ornament on top of body content. The motif is for boundaries, not backgrounds.
