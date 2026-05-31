# Inbox PDFs Integration Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Transcribe information from three inbox PDFs (two travel insurance policies + Puglia tour arrival details) into the relevant pages of the columbus Quarto website, and archive the PDFs.

**Architecture:** Four targeted edits to existing Quarto markdown files, plus a shell move of three PDF files. No new pages created. Pattern follows existing callout-based design used throughout the site.

**Tech Stack:** Quarto markdown, YAML front matter, Quarto callout blocks. Render: `docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus`

---

## File Map

| Action | File | Change |
|---|---|---|
| Modify | `research/pre-departure-checklist.qmd` | Insurance ✅, Puglia tour ✅, WhatsApp action item |
| Modify | `daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd` | Add Strada Toscana pickup callout-important |
| Modify | `regions/puglia.qmd` | Replace stale status callout; add tour operator section; fix trip context |
| Move | 3 PDFs: `in-box/` → `reservations/` | Archive source documents |

---

## Task 1: Update `research/pre-departure-checklist.qmd`

**Files:**
- Modify: `research/pre-departure-checklist.qmd`

Three edits to this file: (a) mark travel insurance done with both policies, (b) add insurance emergency numbers to Documents to print, (c) update Tours section for Puglia with Strada Toscana details and WhatsApp action.

- [ ] **Step 1: Read the file to confirm exact text**

```bash
grep -n "travel insurance\|Puglia organized\|Save all tour\|Documents to print" /home/gramps/rstudio/quarto/columbus/research/pre-departure-checklist.qmd
```

- [ ] **Step 2: Replace the travel insurance line**

Find:
```markdown
- [ ] Purchase **travel insurance**: medical coverage, trip cancellation, baggage/delay
```

Replace with:
```markdown
- [x] **Travel insurance** — ✅ Two policies purchased:
  - **Travel Guard** (Preferred plan): Policy **1002278870** — 2 travelers — $1,019.59
    - Emergency (US toll-free): **1-800-826-1300** | International collect: 1-715-345-0505
    - Claims: travelguard.com/claims
  - **Generali Global Assistance**: Policy **26119X08XT**
    - Emergency (US): **877-243-4135** | Worldwide collect: 240-330-1529
    - Claims: generalitravel.com/claims
```

- [ ] **Step 3: Add insurance to Documents to print section**

Find:
```markdown
- [ ] Italo train ticket (PIDCMA) — or save as PDF on phone
```

Replace with:
```markdown
- [ ] Italo train ticket (PIDCMA) — or save as PDF on phone
- [ ] Travel Guard policy number (1002278870) — note emergency line: 1-800-826-1300 / 1-715-345-0505
- [ ] Generali policy number (26119X08XT) — note emergency line: 877-243-4135 / 240-330-1529
```

- [ ] **Step 4: Replace the Puglia tour section in Tours**

Find:
```markdown
- [ ] **Puglia organized tour** — confirm tour operator; get daily schedule for Jun 15–19; confirm pickup/meeting details for each day
- [ ] Save all tour confirmation numbers and guide phone numbers to your phone
```

Replace with:
```markdown
- [x] **Puglia tour — Strada Toscana** — ✅ confirmed
  - **Pickup: June 14, 12:30 PM, Brindisi Airport** — take taxi from Hotel Executive Inn (depart by 12:00 PM; ~10–15 min, ~€10–12)
  - Meeting point TBA — will be sent via WhatsApp closer to arrival
  - **If not at pickup point at 12:30, driver departs without you**
  - Contacts: Pamela, Paola & Lisa Marlow | lisa@stradatoscana.com | 949-GO-ITALY
- [ ] **Join WhatsApp group** — required before departure: [chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I](https://chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I)
- [ ] Save all tour confirmation numbers and guide phone numbers to your phone
  - Strada Toscana: lisa@stradatoscana.com | 949-GO-ITALY
```

- [ ] **Step 5: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/research/pre-departure-checklist.qmd
```

Expected: clean render; output at `_site/research/pre-departure-checklist.html`.

- [ ] **Step 6: Commit**

```bash
git add research/pre-departure-checklist.qmd
git commit -m "Update checklist: travel insurance confirmed (Travel Guard + Generali), Puglia tour confirmed (Strada Toscana)"
```

---

## Task 2: Add Strada Toscana pickup callout to Day 10

**Files:**
- Modify: `daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd`

Add a `callout-important` immediately after the opening `---` separator in the Overview section. Also update the "Prepare for Tour Days" checklist at the bottom to reference the confirmed pickup.

- [ ] **Step 1: Find the exact insertion point**

```bash
grep -n "^---$\|Prepare for Tour\|Confirm tour operator" /home/gramps/rstudio/quarto/columbus/daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd
```

- [ ] **Step 2: Insert the pickup callout after the first `---` separator following the Overview heading**

Find:
```markdown
## Overview

**First full day in Puglia.** We arrived in Brindisi last evening. Today is for orienting to the city, exploring the historic port, and preparing for the days of Puglia tour ahead.

---
```

Replace with:
```markdown
## Overview

**First full day in Puglia.** We arrived in Brindisi last evening. Today is for orienting to the city, exploring the historic port, and then joining the Strada Toscana tour group at the airport at 12:30 PM.

::: {.callout-important}
## Puglia Tour Pickup — 12:30 PM at Brindisi Airport

**Strada Toscana** picks up the group at **Brindisi Airport at 12:30 PM**. You and Jane arrive by taxi from Hotel Executive Inn.

| | |
|---|---|
| **Pickup time** | 12:30 PM sharp |
| **Location** | Brindisi Airport (Papola Casale) |
| **Your transport** | Taxi from Hotel Executive Inn (~10–15 min, ~€10–12) |
| **Depart hotel by** | 12:00 PM at the latest |
| **Meeting point** | TBA — watch WhatsApp group for exact location |
| **If you're late** | Driver departs on schedule — arrange your own transport |

**Contacts:** Pamela, Paola & Lisa Marlow — lisa@stradatoscana.com — 949-GO-ITALY

Join WhatsApp group (primary channel): [chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I](https://chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I)
:::

---
```

- [ ] **Step 3: Update the "Prepare for Tour Days" checklist**

Find:
```markdown
- [ ] Confirm tour operator pickup time and exact meeting location
```

Replace with:
```markdown
- [ ] Check WhatsApp group for exact meeting point at Brindisi Airport (Strada Toscana will send closer to date)
```

- [ ] **Step 4: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd
```

Expected: clean render.

- [ ] **Step 5: Commit**

```bash
git add daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd
git commit -m "Add Strada Toscana 12:30 PM airport pickup callout to Day 10"
```

---

## Task 3: Update `regions/puglia.qmd`

**Files:**
- Modify: `regions/puglia.qmd`

Two changes: (a) replace the stale "Tour Status: Being Planned" callout-warning with a confirmed status note, and (b) add a Tour Operator section after Trip Context. Also fix the Trip Context text which says "Tour begins June 15" when it actually starts June 14 at 12:30 PM.

- [ ] **Step 1: Replace the stale status callout**

Find this entire block:
```markdown
::: {.callout-warning}
## Tour Status: Being Planned

The Puglia portion of our trip (June 14–20; 5-day organized tour June 15–19) is currently being finalized. June 14 is a Brindisi orientation/buffer day. This page contains general information about the region and expected highlights. Specific tour details, daily itineraries, and accommodations will be updated once the tour operator and schedule are confirmed.

**Expected Finalization:** Late March/early April 2026
:::
```

Replace with:
```markdown
::: {.callout-note}
## Tour Operator: Strada Toscana — Confirmed

The Puglia tour is confirmed with **Strada Toscana**. Pickup is **June 14 at 12:30 PM at Brindisi Airport**. Tour runs June 14–19; departure June 20.

Contact: Lisa Marlow — lisa@stradatoscana.com — 949-GO-ITALY
:::
```

- [ ] **Step 2: Fix the Trip Context section**

Find:
```markdown
### Tour Days (June 15-19)

**5 full days** exploring Puglia with organized tour (details to be confirmed):
```

Replace with:
```markdown
### Tour Days (June 14–19)

**Tour starts June 14 at 12:30 PM** — Strada Toscana picks up at Brindisi Airport. Six days exploring Puglia:
```

- [ ] **Step 3: Add Tour Operator section after Trip Context**

Find:
```markdown
---

## Puglia at a Glance
```

Replace with:
```markdown
---

## Tour Operator — Strada Toscana

| | |
|---|---|
| **Company** | Strada Toscana — "experience Italy off the beaten path" |
| **Guides** | Pamela, Paola & Lisa Marlow |
| **Contact** | lisa@stradatoscana.com |
| **Phone** | 949-GO-ITALY |
| **Website** | stradatoscana.com |

**WhatsApp group** (primary communication — join before departure):
[chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I](https://chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I)

All pickup locations, schedule updates, and last-minute changes come through the WhatsApp group. Keep phone on with data enabled on arrival day.

---

## Puglia at a Glance
```

- [ ] **Step 4: Render to verify**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus/regions/puglia.qmd
```

Expected: clean render.

- [ ] **Step 5: Commit**

```bash
git add regions/puglia.qmd
git commit -m "Update Puglia overview: confirmed tour status, add Strada Toscana operator section"
```

---

## Task 4: Archive PDFs and Full Site Render

**Files:**
- Move: 3 PDFs from `in-box/` to `reservations/`

- [ ] **Step 1: Move the PDFs**

```bash
mv "/home/gramps/rstudio/quarto/columbus/in-box/Gmail - Before You Go Reminder Letter !.pdf" /home/gramps/rstudio/quarto/columbus/reservations/
mv "/home/gramps/rstudio/quarto/columbus/in-box/Gmail - Travel Guard Policy Confirmation_ 1002278870.pdf" /home/gramps/rstudio/quarto/columbus/reservations/
mv "/home/gramps/rstudio/quarto/columbus/in-box/Puglia-Arrival-information.pdf" /home/gramps/rstudio/quarto/columbus/reservations/
```

- [ ] **Step 2: Verify files moved**

```bash
ls /home/gramps/rstudio/quarto/columbus/reservations/*.pdf | grep -E "Travel Guard|Before You Go|Puglia"
ls /home/gramps/rstudio/quarto/columbus/in-box/
```

Expected: three PDFs now in `reservations/`; `in-box/` shows only `empty` file.

- [ ] **Step 3: Full site render**

```bash
docker exec --user rstudio rstudio quarto render /home/rstudio/Quarto/columbus
```

Expected: clean render, ~36 files, no errors.

- [ ] **Step 4: Spot-check rendered HTML**

```bash
grep -l "Travel Guard\|1002278870" /home/gramps/rstudio/quarto/columbus/_site/research/pre-departure-checklist.html
grep -l "Strada Toscana" /home/gramps/rstudio/quarto/columbus/_site/daily_itineraries/day-10-2026-06-14-naples-to-brindisi.html
grep -l "Strada Toscana" /home/gramps/rstudio/quarto/columbus/_site/regions/puglia.html
```

Expected: all three commands return the filename.

- [ ] **Step 5: Final commit and push**

```bash
git add reservations/ in-box/
git status
git commit -m "Archive inbox PDFs to reservations/"
git push
```
