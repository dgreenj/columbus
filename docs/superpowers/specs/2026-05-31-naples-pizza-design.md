# Naples Pizza Guide — Design Spec

**Date:** 2026-05-31  
**Project:** columbus (Italy Trip 2026 Quarto website)  
**Trip context:** Party of 2; Naples June 10–12, 2026

---

## Goal

Add a focused, actionable Naples pizza guide to the columbus website. The deliverable has two purposes:

1. **Planning** — a dedicated research page with full pizzeria details, reservation instructions, and a call-this-week action plan  
2. **In-the-field** — per-night callout boxes injected into the three daily itinerary pages so the right pizzeria is surfaced exactly when needed

---

## Research Findings

Sourced via Firecrawl from TripAdvisor, Yelp, official pizzeria websites, Michelin Guide, and a 31-pizzeria independent head-to-head review (wearethemouth.com, 2026).

### Confirmed Pizzeria Details

| Pizzeria | Address | Phone | Reservations | Hours | Closed |
|---|---|---|---|---|---|
| **Da Attilio** ⭐ #1 | Via Pignasecca 17, 80134 | +39 081 552 0479 | Walk-in; email ok | Daily 10 AM–11:45 PM | Never |
| **Concettina ai Tre Santi** ⭐ #2 | Via Arena della Sanità 137/bis, 80137 | Web form | Reservations taken | Fri–Sat confirmed 11:00–23:30; weekday hours unverified — confirm via website | Mon likely |
| **Starita a Materdei** | Via Materdei 27/28, 80136 | +39 081 544 1485 | Call to reserve | Tue–Sun 12:00–15:30 / 19:00–23:30 | Monday |
| **L'Antica Pizzeria Da Michele** | Via Cesare Sersale 1, 80139 | — | None — ticket at door | ~10:30 AM–close | Sunday |
| **Gino Sorbillo** | Via dei Tribunali 32, 80138 | +39 081 446643 | Walk-in norm | ~12:00–15:30 / 19:00–23:00 | Sunday |
| **50 Kalò** | Piazza Sannazzaro 201/b, 80122 | +39 081 19204667 | Wait list at door | ~12:30–15:30 / 19:30–23:30 | Varies |

**Quality note:** The independent 31-pizzeria guide rates Da Attilio #1 and Concettina #2. It explicitly calls Sorbillo "overhyped" and Da Michele "spectacularly average." These assessments are included on the site with appropriate framing (one reviewer's opinion vs. the famous-by-reputation spots).

### Time Zone for Calling

- Italy CEST = UTC+2 | Madison CDT = UTC−5 | **Italy is 7 hours ahead**
- Best call windows from Madison:
  - **8:00–9:30 AM CDT** = 3:00–4:30 PM Italy (afternoon prep, phones answered)
  - **11:00 AM–noon CDT** = 6:00–7:00 PM Italy (pre-dinner, staff available)

---

## Three-Night Pizza Assignment

| Night | Date | Day | Pizzeria | Reservation |
|---|---|---|---|---|
| Arrival evening | June 10 (Wed) | Day 6 | **Da Attilio** | Walk-in; arrive by 7 PM |
| After walking tour | June 11 (Thu) | Day 7 | **Starita a Materdei** | Call to reserve ✅ |
| Farewell Naples | June 12 (Fri) | Day 8 | **Concettina ai Tre Santi** | Web form ✅ |

---

## Call-This-Week Action Plan

Today is May 31 (Sunday). Naples arrival is June 10 — 10 days out. This is ideal reservation timing.

### Starita a Materdei (June 11 dinner)
- **Phone:** +39 081 544 1485
- **Call:** Tuesday June 2 or Wednesday June 3, **8:00–9:30 AM CDT**
- **Say:** "Hello, I'd like to reserve a table for 2 people for Thursday June 11th, around 7:30 PM. Is that possible?"
- **Backup time:** 8:00 PM if 7:30 unavailable
- Note: Closed Monday, so don't call today (Sunday) expecting Monday to be open

### Concettina ai Tre Santi (June 12 dinner)
- **Book online:** https://www.concettinaaitresanti.com/en/contacts/
- **Do this:** Today (May 31) or tomorrow morning — no phone required
- **Request:** Table for 2, Friday June 12, 7:30 or 8:00 PM
- June 12 is a Friday — their stated late hours apply (11:00–23:30)

### Da Attilio (June 10 dinner)
- **No reservation needed** — walk-in, open daily until 11:45 PM
- Optional email: pizzeria.attilio@gmail.com if you want to confirm
- Arrive by 7:00–7:30 PM to avoid a wait
- This is your first night in Naples after the train — keep it low-stress

### Walk-in Strategy for Other Places
If you want to visit Da Michele or Sorbillo (lunch, or spontaneously):
- **Da Michele:** Arrive before noon for lunch or before 7 PM for dinner; get a paper number at the door; wait to be called
- **Sorbillo:** Arrive before 12:30 PM for lunch or before 7:00 PM for dinner; queue at door
- Neither takes phone reservations — early arrival is the only strategy

---

## Files to Create/Modify

### New file: `research/naples-pizza.qmd`

Page structure:
1. **Intro callout** — 3 sentences on why Naples pizza is in its own category
2. **Your 3 nights** — table: Date / Pizzeria / Reservation status / Action needed
3. **Call this week** — the action plan above, formatted as a step-by-step checklist with times
4. **The six pizzerias** — detailed entries in priority order (Da Attilio → Concettina → Starita → Da Michele → Sorbillo → 50 Kalò); each entry: address, phone, reservation method, hours, what to order, price range, honest character note
5. **What to order** — Margherita vs. Marinara; `pizza fritta` as street food; the rule about "creative" toppings on a first visit
6. **Getting there** — brief note on which neighborhoods these are in; which can be walked to from centro storico, which need a taxi

### `_quarto.yml` changes
- Navbar Research menu: Add "Naples Pizza" between "Restaurants" and "Packing List"
- Sidebar Pre-Trip Planning: Add `research/naples-pizza.qmd` between `research/restaurants.qmd` and `research/packing-list.qmd`

### `research/restaurants.qmd`
- Replace the Naples pizza section (Da Michele/Sorbillo/50 Kalò bullets) with:
  - A 2-sentence intro
  - A `callout-tip` linking to `naples-pizza.qmd`
  - Keep seafood, pastries, and general tips sections unchanged

### `daily_itineraries/day-06-2026-06-10-florence.qmd` (arrival day — confirms as Florence-to-Naples travel day; arrives 3:28 PM)
- The existing **Evening** section already says "Pizza is the only correct choice for tonight" but lists Da Michele/Sorbillo/50 Kalò
- Replace the "Top options" bullet list with a `callout-tip`: Tonight → Da Attilio; walk-in; arrive by 7 PM; address; link to naples-pizza.qmd
- Party: Jane Mooney + Dan Green

### `daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd`
- Replace the generic "pizza on Via dei Tribunali" Evening text
- `callout-tip`: Tonight → Starita a Materdei; confirm reservation; address; time to leave Airbnb

### `daily_itineraries/day-08-2026-06-12-naples-herculaneum.qmd`
- Replace "Return to favorite pizzeria?" bullet with a `callout-tip`
- Tonight → Concettina ai Tre Santi; confirm reservation; address; farewell framing

---

## Out of Scope

- Puglia restaurants (separate section, not part of this work)
- Florence restaurants (unchanged)
- Lunch restaurant recommendations (these are dinner-focused)
- Budget restaurant alternatives (the site already covers this in `restaurants.qmd`)

---

## Success Criteria

- A party of 2 with no prior knowledge of Naples can open the site and know: which pizzeria to go to each night, whether a reservation is needed, exactly when and how to make it, and what to order
- The daily itinerary pages for June 10–12 each surface a specific, actionable pizza recommendation in the evening section
- No broken links; site renders cleanly; page appears correctly in sidebar and navbar
