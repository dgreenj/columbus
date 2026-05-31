# Inbox PDFs Integration — Design Spec

**Date:** 2026-05-31  
**Project:** columbus (Italy Trip 2026 Quarto website)

---

## Source Documents

Three PDFs in `/home/gramps/rstudio/quarto/columbus/in-box/`:

1. **Generali Global Assistance** — "Before You Go Reminder Letter" — Policy 26119X08XT
   - Emergency (US): 877-243-4135 | Emergency (worldwide collect): 240-330-1529
   - Claims: generalitravel.com/claims

2. **Travel Guard** — Policy Confirmation 1002278870 — Preferred plan, 2 travelers, $1,019.59
   - Emergency (US toll-free): 1-800-826-1300 | International collect: 1-715-345-0505
   - Claims: travelguard.com/claims

3. **Strada Toscana** — Puglia Arrival Information (from Lisa Marlow, lisa@stradatoscana.com)
   - **Tour pickup: June 14, 12:30 PM, Brindisi Airport**
   - Dan Green + Jane Mooney listed as "Arriving by Taxi/Shuttle" (from Hotel Executive Inn)
   - Meeting point TBA — will be sent via WhatsApp closer to arrival
   - WhatsApp group (required): chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I
   - Contacts: Pamela, Paola & Lisa Marlow | Phone: 949-GO-ITALY
   - Critical: if not at pickup point on time, driver departs without you

---

## Approach

Transcribe key information into relevant Quarto pages. Do not embed PDFs as rendered content. Move PDFs from `in-box/` to `reservations/` for archival.

---

## File Map

| Action | File | What changes |
|---|---|---|
| **Modify** | `research/pre-departure-checklist.qmd` | Insurance: mark ✅ done + add both policies; Tours: mark Puglia confirmed + add operator details + WhatsApp action |
| **Modify** | `daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd` | Add Strada Toscana pickup callout at top; update "Prepare for Tour Days" section |
| **Modify** | `regions/puglia.qmd` | Update status from "Being Planned" to confirmed; add tour operator section; fix arrival date context |
| **Move** | 3 PDFs: `in-box/` → `reservations/` | Archive source documents |

---

## Detailed Changes

### 1. `research/pre-departure-checklist.qmd`

**Documents & Administration section — replace:**
```
- [ ] Purchase **travel insurance**: medical coverage, trip cancellation, baggage/delay
```
With:
```
- [x] **Travel insurance** — ✅ Two policies purchased:
  - **Travel Guard** (Preferred): Policy 1002278870 — 2 travelers — $1,019.59
    - Emergency (US toll-free): **1-800-826-1300** | International collect: 1-715-345-0505
    - Claims: travelguard.com/claims
  - **Generali Global Assistance**: Policy 26119X08XT
    - Emergency (US): **877-243-4135** | Worldwide collect: 240-330-1529
    - Claims: generalitravel.com/claims
```

**Documents to print section — add after existing insurance refs:**
```
- [ ] Travel Guard policy card (Policy 1002278870) — print or screenshot; emergency: 1-800-826-1300
- [ ] Generali policy number (26119X08XT) — note emergency: 877-243-4135
```

**Tours section — replace:**
```
- [ ] **Puglia organized tour** — confirm tour operator; get daily schedule for Jun 15–19; confirm pickup/meeting details for each day
- [ ] Save all tour confirmation numbers and guide phone numbers to your phone
```
With:
```
- [x] **Puglia tour — Strada Toscana** — ✅ confirmed; operator: Lisa Marlow (lisa@stradatoscana.com, 949-GO-ITALY)
  - **Pickup: June 14, 12:30 PM, Brindisi Airport** — arrive by taxi from Hotel Executive Inn
  - Meeting point TBA via WhatsApp — monitor the group chat
  - If not present at 12:30, driver departs without you
- [ ] **Join WhatsApp group** — required before departure: chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I
- [ ] Save all tour confirmation numbers and guide phone numbers to your phone
  - Strada Toscana: lisa@stradatoscana.com | 949-GO-ITALY
```

### 2. `daily_itineraries/day-10-2026-06-14-naples-to-brindisi.qmd`

Add `callout-important` block immediately after the Overview `---` separator:

```markdown
::: {.callout-important}
## Puglia Tour Pickup — 12:30 PM at Brindisi Airport

**Strada Toscana** picks up the group at **Brindisi Airport at 12:30 PM**. Dan and Jane arrive by taxi from Hotel Executive Inn.

| | |
|---|---|
| **Pickup time** | 12:30 PM sharp |
| **Location** | Brindisi Airport (Papola Casale) |
| **Your transport** | Taxi from Hotel Executive Inn (~10–15 min, ~€10–12) |
| **Depart hotel by** | 12:00 PM at the latest |
| **Meeting point** | TBA — watch WhatsApp group for exact location |
| **If you're late** | Driver departs on schedule — arrange your own transport |

**Contacts:** Pamela, Paola & Lisa Marlow — lisa@stradatoscana.com — 949-GO-ITALY

Monitor WhatsApp group: [chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I](https://chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I)
:::
```

Also update the "Prepare for Tour Days" checklist at the bottom:
- Replace `[ ] Confirm tour operator pickup time and exact meeting location` with specific Strada Toscana item

### 3. `regions/puglia.qmd`

Replace the "Tour Status: Being Planned" callout with a confirmed version. Add a new **Tour Operator** section after "Trip Context":

```markdown
## Tour Operator — Strada Toscana

| | |
|---|---|
| **Company** | Strada Toscana — "experience Italy off the beaten path" |
| **Contact** | Lisa Marlow, Guest Services Director |
| **Email** | lisa@stradatoscana.com |
| **Phone** | 949-GO-ITALY |
| **Website** | stradatoscana.com |

**Guides:** Pamela, Paola & Lisa

**WhatsApp group** (primary communication channel): [Join here](https://chat.whatsapp.com/EJXJTC2HAcwGLOheEWQi0I)

All updates, pickup locations, and schedule changes come through the WhatsApp group.
```

Also fix Trip Context: tour pickup is **June 14** (not "Tour begins June 15" — it begins June 14 at 12:30 PM at Brindisi Airport).

### 4. Move PDFs

```bash
mv in-box/Gmail\ -\ Before\ You\ Go\ Reminder\ Letter\ \!.pdf reservations/
mv in-box/Gmail\ -\ Travel\ Guard\ Policy\ Confirmation_\ 1002278870.pdf reservations/
mv in-box/Puglia-Arrival-information.pdf reservations/
```

---

## Success Criteria

- Checklist shows travel insurance ✅ with both policy numbers and emergency numbers
- Checklist shows Puglia tour ✅ with Strada Toscana details and WhatsApp join action
- Day 10 has a prominent callout showing the 12:30 PM airport pickup before any other content
- Puglia overview page reflects confirmed status and has tour operator contact section
- PDFs archived in `reservations/`
- Site renders cleanly
