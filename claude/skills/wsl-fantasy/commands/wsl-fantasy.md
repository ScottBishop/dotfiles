---
description: Analyze WSL Fantasy Surfing tiers and recommend 2 picks per tier (men and women) plus 1 male and 1 female power surfer for the upcoming event.
argument-hint: [event name or notes about the venue]
---

# WSL Fantasy Surfing Picks

Event/notes from user: `$ARGUMENTS`

## What I need from the user

If the user hasn't already provided screenshots, ask them to share:
1. Men's Tier A, B, and C screenshots (from the WSL Fantasy "Pick Your Team" screen)
2. Women's Tier A, B, and C screenshots
3. The event name and location (venue matters — home break advantage is real)

They can share men's and women's in separate batches — that's fine. Analyze men's tiers as soon as all three are provided, then ask for women's. Wait until all 6 tiers are provided before publishing **Power Surfer** picks.

## Analysis Framework

For each tier, extract these columns from the screenshots:
- **Fant Pts** — total fantasy points this season
- **Avg Pts** — average points per event
- **Heat W%** — heat win percentage (consistency indicator)
- **Max HS** — highest single heat score (ceiling indicator)
- **AHS** — average heat score
- **Exc H** — excellent heats (scores 16+)

### Scoring each surfer

Weight the factors in this order:
1. **Avg Pts** — primary metric, best predictor of event output
2. **Heat W%** — consistency; a surfer winning 80%+ of heats is reliable
3. **Venue / home advantage** — surfers competing at or near their home break historically outperform their season average. Always research who is local to the event location.
4. **Max HS / Exc H** — upside; a surfer with a high ceiling can steal an event
5. **Wildcards (no season data)** — surfers with `-` stats were added as event wildcards. At their home break this is a sleeper pick worth considering.

### Venue research

Always consider:
- Is this a point break, beach break, or reef break? Certain surfers specialize.
- Which surfers are from this country/region and know these waves?
- Has anyone won at this venue multiple times historically?
- Australian events (Gold Coast, Bells, Margaret River) heavily favor local surfers.
- NZ events (Piha/Auckland area) are typically powerful black-sand beachbreak with raw Southern Ocean swell. Australians and surfers comfortable in heavy, punchy surf have an edge. NZ wildcards (e.g. Billy Stairmand, Alani Morse) are prime Tier C sleeper picks.
- When stat tiers are compressed (e.g. all women's Tier B averages clustered between 19–30 pts), shift more weight to Heat W%, AHS, and venue/form factors — the avg pts alone won't differentiate.

### Surfer profiles (accumulated across events)

**Men:**
- **Gabriel Medina** (Tier A, Brazil) — dominant statistical performer, high floor and ceiling, picks itself when available
- **Samuel Pupo** (Tier A, Brazil) — elite ceiling (18.90+ Max HS), good consistency; strong power surfer candidate
- **Connor O'Leary** (Tier B, Australia/Japan) — high avg for Tier B, multiple Exc H, comfortable in Southern Hemisphere power surf
- **Filipe Toledo** (Tier B, Brazil) — massive ceiling (18.94+ Max HS) but can be inconsistent in heavy/scary conditions; worth picking for upside
- **Billy Stairmand** (Tier C, NZ) — NZ local wildcard; prioritize at any NZ event

**Women:**
- **Luana Silva** (Tier A, Brazil) — season statistical leader, consistent Heat W%, top power surfer pick
- **Gabriela Bryan** (Tier A, Hawaii/USA) — elite Heat W% (75%+), comfortable in powerful beachbreak, second-best avg in Tier A
- **Carissa Moore** (Tier B, Hawaii) — 5x world champion; season stats can undersell her — elevates in quality, powerful surf
- **Nadia Erostarbe** (Tier B, Spain) — Tier B statistical leader; solid consistency and ceiling
- **Alani Morse** (Tier C, NZ) — NZ local wildcard; prioritize at any NZ event

## Output Format

Present picks in this format for both men and women:

### Tier A — Pick: **Name** + **Name**
Brief reasoning for each pick, including any venue/home advantage notes.

### Tier B — Pick: **Name** + **Name**
Brief reasoning.

### Tier C — Pick: **Name** + **Name**
Brief reasoning. Note if taking a wildcard gamble and why.

---

Then after all 6 tiers:

## Power Surfers

Power Surfers earn a 2X points multiplier. Pick the one man and one woman from your team most likely to score the highest absolute points at this specific event.

- Choose based on highest **Avg Pts** among your picks, adjusted for venue upside
- A Tier A surfer is usually the right call unless a Tier B/C surfer has a strong home break advantage and exceptional current form
- Briefly explain why each Power Surfer was chosen over the alternatives on the team

---

## Previous Event Context

If the user mentions results from the previous event or provides updated season stats, factor those in:
- Surfers on a hot streak (improving avg) are worth upgrading
- Surfers with declining form or injury news should be downgraded
- Home break advantage resets each event — always re-evaluate for the new venue
