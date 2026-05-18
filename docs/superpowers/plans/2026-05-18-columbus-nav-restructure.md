# Columbus Navigation Restructure Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Separate actual booking pages from informational reference pages in the columbus Quarto site, so Pre-Trip Planning shows only confirmed bookings and a new Resources section holds general guidance.

**Architecture:** Four content changes (1 file revised, 3 files created) plus one navigation config edit and one cross-link fix. All new informational files go in a new `resources/` directory; actual-booking files stay in `research/`. The sidebar gains a "Resources" section; the navbar gains a "Resources" dropdown.

**Tech Stack:** Quarto (rendered inside Docker container `rstudio`), YAML config, Markdown/QMD

**Render command:** `docker exec rstudio quarto render /home/rstudio/Quarto/columbus`

**Spec:** `docs/superpowers/specs/2026-05-18-columbus-nav-restructure-design.md`

---

## File Map

| Action | File | Purpose |
|--------|------|---------|
| Create | `resources/flight-research.qmd` | Informational: airline options, booking strategy, luggage tips (extracted from old flights.qmd) |
| Create | `resources/train-travel.qmd` | Informational: train tips, station info, fare classes (extracted from trains.qmd) |
| Revise | `research/flights.qmd` | Actual: booked international flights (FMWYOJ outbound + return) |
| Create | `research/travel-in-italy.qmd` | Actual: booked intra-Italy transport (train PIDCMA + flight IXYZMT) |
| Modify | `_quarto.yml` | Sidebar and navbar restructure |
| Modify | `daily_itineraries/day-01-2026-06-05-madison-to-frankfurt.qmd` | Update cross-link text |

---

## Task 1: Create `resources/flight-research.qmd`

**Files:**
- Create: `resources/flight-research.qmd`

- [ ] **Step 1: Create the resources/ directory**

```bash
mkdir -p /home/gramps/rstudio/quarto/columbus/resources
```

- [ ] **Step 2: Write `resources/flight-research.qmd`**

Write the file with the following complete content (extracted and reorganised from the old `research/flights.qmd`, minus the Naples→Brindisi booked section which moves to Task 4):

```markdown
---
title: "Flight Research"
subtitle: "Options and Guidance for International Flights to Italy"
categories: [resources, flights]
toc: true
---

## Overview

General reference for flying from Chicago/Madison to Italy. Our actual booked flights are on the [Flights to Italy](../research/flights.qmd) page.

Flying from Chicago/Madison to Italy requires one European hub connection — there are no nonstops. Pisa (PSA) has more carrier options than Florence (FLR), though we ultimately booked into FLR via Frankfurt.

**Key Advantage of Pisa:** Larger international airport with more carriers and competitive fares, plus the convenient PisaMover + train connection gets you to Florence in under 2 hours total.

## Pisa vs. Florence Airport Comparison

| Factor | Pisa (PSA) | Florence (FLR) |
|--------|------------|----------------|
| **Airport Size** | International, larger | Small regional |
| **Airline Options** | More carriers, more flights | Fewer options |
| **Typical RT Economy** | $537–$700 from ORD | $440–$900 from ORD |
| **To Florence Center** | 1h train from Pisa Cle | 20 min tram (T2) |
| **Business Class** | ~$2,400–$5,000 | ~$2,500–$5,000 |

## Outbound Flight Options: Chicago to Italy

### Can You Fly Direct from Chicago to Pisa?

**No.** There are no nonstop flights from Chicago O'Hare (ORD) to Pisa Galileo Galilei (PSA). All routings require one connection through a European hub.

### Economy Class Options

| Airline | Route (Hub) | Stops | Total Time | RT Price |
|---------|-------------|-------|------------|----------|
| **British Airways** | via London (LHR) | 1 stop | ~12h | $537–$700 |
| **American/BA** | via London (LHR) | 1 stop | ~12h | $540–$800 |
| **Lufthansa** | via Munich (MUC) | 1 stop | ~11h | $650–$900 |
| **SWISS** | via Zurich (ZRH) | 1 stop | ~11h | $650–$900 |
| **SAS** | via Copenhagen | 1 stop | ~13h | $530–$700 |
| **Aer Lingus** | via Dublin (DUB) | 1 stop | ~13h | $550–$750 |

**Current Best Pricing:** Google Flights shows Chicago–Pisa RT from ~$537 (British Airways via LHR)

**Seasonality:**
- Cheapest month: February
- Most expensive: September
- June: Moderate to high season pricing

### Business Class Options (Lie-Flat Beds)

| Airline | Hub | Product | RT Price |
|---------|-----|---------|----------|
| **Lufthansa** | Munich (MUC) | Lie-flat bed | $2,500–$4,500 |
| **SWISS** | Zurich (ZRH) | Lie-flat bed | $2,500–$4,500 |
| **British Airways** | London (LHR) | Club World lie-flat | $2,800–$5,500 |
| **Air France** | Paris (CDG) | Lie-flat bed | $2,800–$5,000 |
| **United/Lufthansa** | Frankfurt (FRA) | Polaris lie-flat | $2,500–$4,000 |

### First Class Options

True first class (above business) is only available on the transatlantic leg. The connection from the European hub to Italy will be business or economy class.

| Airline | First Class Product | Hub | RT Price |
|---------|-------------------|-----|----------|
| **Lufthansa** | First Class suite + FCT lounge | Frankfurt | $6,000–$12,000 |
| **SWISS** | First Class, 1-1 suites | Zurich | $6,000–$10,000 |
| **British Airways** | First (14 seats, most privacy) | London | $5,500–$9,000 |
| **Air France** | La Première (limited) | Paris | $7,000–$14,000 |

**Special Note:** Lufthansa First Class via Frankfurt includes access to the **First Class Terminal** — private security, fine dining, and a chauffeur-driven Mercedes to your gate.

### Premium Fare Shopping Tip

**SkyLux Travel** (skyluxtravel.com) specializes in discounted premium fares and can sometimes beat published prices by 30–50%.

## Arriving in Pisa: Stay or Go?

You have two good options when landing at Pisa Galileo Galilei Airport (PSA):

### Option A: Head Straight to Florence (Recommended)

| Step | Details |
|------|---------|
| **From Airport** | Take the PisaMover shuttle (8 min, automated) to Pisa Centrale station |
| **Train** | Direct Regionale to Firenze Santa Maria Novella (SMN) |
| **Duration** | 50–70 minutes depending on service |
| **Frequency** | Every 30 minutes, ~52 trains per day |
| **Price** | €10–€12 one way (fixed price, no advance booking needed) |
| **First Train** | 4:15 AM from Pisa Centrale |
| **Last Train** | 9:01 PM (arrives Florence 10:26 PM) |

**This is the most efficient option.** You'll be in Florence within 2 hours of clearing customs.

### Option B: Overnight in Pisa

If you arrive late or want to ease into the trip, spending one night in Pisa is pleasant.

**Why Stay:**
- Piazza dei Miracoli (with the Tower, Cathedral, and Baptistery) is genuinely spectacular
- Arno riverfront at sunset is lovely
- See Pisa's highlights in a leisurely evening and morning
- Reduce travel stress after long flight

**Where to Stay:**
- Stay near the train station or along the Arno — **not near the Tower** (touristy and overpriced)
- **Hotel Bologna** or **Royal Victoria** are good mid-range picks

## Return Flight Considerations

### From Puglia (Brindisi/BDS) to Chicago

**Key Considerations:**
- Getting from Puglia to a major hub requires either a connecting flight or overnight train to Rome
- Brindisi (BDS) has limited direct international service — most return routings go via a European hub
- **Recommendation:** Book out of BDS via a hub (Munich, Frankfurt, etc.) rather than trying to reach FCO by ground

### Airport Logistics

**Rome Fiumicino (FCO):**
- Larger international hub with more direct return flight options to Chicago
- Airport hotels available for overnight before early flight
- Express train to city center (Leonardo Express, 32 min to Termini)

**Brindisi (BDS) — Papola Casale Airport:**
- Small regional airport (~4 km from city center)
- Limited carriers but serves Lufthansa/Air Dolomiti regional connections

## Booking Strategy

### When to Book

**Timeline:**
- **2-3 months ahead:** Best balance of price and availability
- **Too early:** Prices often haven't dropped to competitive levels
- **Too late:** Limited availability, higher prices

**For a June departure:** Book by late March/early April

### Booking Checklist

- [ ] Compare prices on Google Flights, airline sites, and SkyLux
- [ ] Check baggage allowances (especially for souvenirs on return)
- [ ] Select seats early (aisle vs. window preference)
- [ ] Add to calendar with confirmation numbers
- [ ] Print or download boarding passes 24 hours before
- [ ] Notify credit cards of international travel dates
- [ ] Check passport validity (must be valid 6 months beyond return)

### Seat Selection Tips

**Transatlantic Leg:**
- Business/First: Window for sleep, aisle for movement
- Economy: Aisle for long-haul comfort and bathroom access
- Avoid seats near lavatories and galleys (noise)
- Emergency exit rows: More legroom but no under-seat storage during takeoff/landing

**European Connection:**
- Usually shorter flights (1-2 hours)
- Less critical but still book early for best selection

## Luggage Considerations

### Checked Baggage

**Typical Allowances:**
- **Economy:** 1-2 bags, 50 lbs each (varies by airline and fare class)
- **Business:** 2-3 bags, 70 lbs each
- **First:** 3 bags, 70 lbs each

**Strategy:**
- Check allowances for specific booking
- Leave room in checked bags for return (wine, art, souvenirs)
- Consider shipping heavy items if over limit

### Carry-On

**Standard:** 1 carry-on + 1 personal item

**Pack in Carry-On:**
- Medications
- Valuables (jewelry, electronics)
- Change of clothes (in case checked bag delayed)
- Travel documents
- Essential toiletries (3.4 oz / 100ml limit)

## Important Links

### Booking Sites
- [Google Flights](https://www.google.com/flights)
- [British Airways](https://www.britishairways.com)
- [Lufthansa](https://www.lufthansa.com)
- [SWISS](https://www.swiss.com)
- [SkyLux Travel](https://skyluxtravel.com) (premium fare specialists)

### Airport Information
- [Pisa Airport (PSA)](https://www.pisa-airport.com)
- [Rome Fiumicino (FCO)](https://www.adr.it/fiumicino)
- [PisaMover](https://www.pisa-airport.com/en/transport/pisamover/) (airport to train station)

### Travel Documents
- [TSA](https://www.tsa.gov)
- [U.S. State Department Travel](https://travel.state.gov)
- [Italy Entry Requirements](https://travel.state.gov/content/travel/en/international-travel/International-Travel-Country-Information-Pages/Italy.html)

## Pre-Flight Checklist

### 3 Months Before
- [ ] Book flights
- [ ] Verify passport validity (expires after Dec 2026?)
- [ ] Check visa requirements (none for U.S. tourists <90 days)

### 1 Month Before
- [ ] Select seats
- [ ] Add flight details to calendar
- [ ] Book airport parking or arrange drop-off

### 1 Week Before
- [ ] Check in online (24 hours before)
- [ ] Print/download boarding passes
- [ ] Verify baggage allowances
- [ ] Notify credit card companies

### Day Before
- [ ] Confirm flight status
- [ ] Pack carry-on essentials
- [ ] Charge all electronics
- [ ] Have passport and documents accessible

### Day Of
- [ ] Arrive 3 hours early for international flight
- [ ] Have passport and boarding pass ready
- [ ] Double-check departure terminal
- [ ] Relax and enjoy the journey!

---

**See also:** [Train Travel in Italy](train-travel.qmd) — general train reference guide
```

- [ ] **Step 3: Commit**

```bash
cd /home/gramps/rstudio/quarto/columbus
git add resources/flight-research.qmd
git commit -m "Add resources/flight-research.qmd with informational flight content"
```

---

## Task 2: Create `resources/train-travel.qmd`

**Files:**
- Create: `resources/train-travel.qmd`

- [ ] **Step 1: Write `resources/train-travel.qmd`**

Write the following complete file (informational content from `research/trains.qmd`, minus the booked Route 1 Florence→Naples section and the booking callout from Route 2; research notes for the Naples→Brindisi train are retained):

```markdown
---
title: "Train Travel in Italy"
subtitle: "Trenitalia & Italo — Reference Guide"
categories: [resources, trains, transportation]
toc: true
---

## Overview

Italian trains are efficient, comfortable, and one of the best ways to travel between cities. This page covers general guidance for booking and riding Italian trains.

For our specific booked train and flight segments between cities, see [Travel in Italy](../research/travel-in-italy.qmd).

## Booking Websites

- **[Trenitalia.com](https://www.trenitalia.com)** - Italy's national rail operator
- **[Italotreno.it](https://www.italotreno.it)** - Private high-speed operator

**Booking Window:** 2-4 weeks ahead for best "Super Economy" fares

**Payment:** Major credit cards accepted, often cheaper to book directly vs. third-party sites

---

## Naples → Brindisi by Train (Research Notes)

::: {.callout-note}
## We changed this leg to a flight
Our Naples→Brindisi segment is now a flight (ITA Airways AZ 1270/1623, June 13). See [Travel in Italy](../research/travel-in-italy.qmd) for the actual booking. Train research below is retained for reference.
:::

**Original planned route:** Naples → Brindisi by Intercity train (~5.5 hours direct)

### Route Options

| Route | Train Type | Duration | Changes | Class | Fare |
|-------|------------|----------|---------|-------|------|
| **Naples → Brindisi (IC)** | **Intercity Express** | **~5h 30m** | **0 (Direct)** | **1st + 2nd** | **€15-€40 (1st)** |
| Naples → Bari | Frecciarossa/Italo | 3h 15-4h | 0-1 | Various | €20-€60 |
| Naples → Brindisi (old route) | Frecce + Regional | 5-6h | 1 (Bari) | Various | €22-€75 |
| Naples → Lecce | Frecciarossa | 5h 30-6h | 0-1 | Various | €25-€80 |

**Key Decision:** Intercity (IC) is the clear winner for the train option — direct service, First Class available, no slow regional connections required.

### First Class Options on IC

| Option | Type | Duration | Class | Verdict |
|---|---|---|---|---|
| **Intercity (IC)** | Express conventional | ~5h 30m | **1st + 2nd Class** | ✅ Best train option |
| Frecciarossa to Bari + Regional | High-speed + slow regional | 5–6h | Business on FS leg only | Regional leg IS slow |

**Why Intercity (IC):**
- Runs Naples → Brindisi without changing trains
- Makes major stops only (Foggia, Bari, coastal towns)
- First Class: reserved seat, more space, quieter car
- Fares: €15–40 First Class with advance booking
- Book at [trenitalia.com](https://www.trenitalia.com) — search Naples Centrale → Brindisi, filter by IC

### Understanding Puglia Geography

**The train journey IS a tour through Puglia:**

| Stop | Notes |
|------|-------|
| Caserta | Royal Palace (Reggia di Caserta), visible from station |
| Benevento | Roman Arch of Trajan |
| Foggia | **Enter Puglia here** (gateway to Gargano Peninsula) |
| Bari | Puglia's capital (~3.5h from Naples) |
| Polignano a Mare | Dramatic cliffside town |
| Ostuni | "White City" on hilltop |
| Brindisi | Historic port city (~5.5h from Naples) |
| Lecce | "Florence of the South" (~6h, 30 min beyond Brindisi) |

### Scenic Journey Highlights

**What You'll See:**
- Crossing the Apennines (mountains)
- Entering the Tavoliere delle Puglie (plains)
- Adriatic coastline (sit on LEFT side after Foggia)
- Olive groves stretching to horizon
- Whitewashed towns on hillsides

### Option B: Stop in Bari (If Time Allows)

- Take morning train from Naples to Bari (3.5h)
- Spend afternoon/evening in Bari Vecchia (old town)
- Watch orecchiette ladies making pasta; visit Basilica di San Nicola
- **Next morning:** Easy 1–1.5 hour regional train to Brindisi

**Bari day trips:** Matera (1h), Alberobello (1.5h), Polignano a Mare (30 min)

### Regional Connections Within Puglia

| Route | Duration | Frequency | Price |
|-------|----------|-----------|-------|
| Bari → Brindisi | 1-1.5h | Frequent | €8-€15 |
| Bari → Lecce | 1.5h | Hourly | €12-€25 |
| Brindisi → Lecce | 30 min | Frequent | €5-€10 |

---

## General Train Travel Tips

### Booking Strategy

**When to Book:**
- High-speed trains: 2-4 weeks ahead for Super Economy fares
- Regional trains: Can buy same day (no reservations)

**Where to Book:**
- Trenitalia.com or Italotreno.it (direct booking best)
- Omio, Rail Europe (third-party, often higher fees)
- Station ticket windows (if you prefer in-person)

### At the Station

**Arrival Time:**
- High-speed trains: Arrive 15-20 minutes early
- Regional trains: Arrive 10 minutes early
- Check platform (binario) on departure boards

**Validating Tickets:**
- E-tickets (QR code): No validation needed, show on phone
- Paper tickets: MUST validate in yellow machines before boarding
- Failure to validate = fine from conductor

### On the Train

**Luggage:**
- Store large bags in designated racks (near doors or overhead)
- Keep valuables with you
- Watch bags during stops

**Seats:**
- High-speed: Assigned seats (on ticket)
- Regional: Open seating (first-come, first-served)

**Quiet Cars:**
- Some trains have "Silenzio" cars (no phone calls, quiet conversations)

### Train Classes Compared

**Trenitalia Classes:**
- **Standard/2nd Class:** Comfortable, affordable
- **Premium:** More space, quieter
- **Business:** Leather seats, welcome drink, snacks
- **Executive:** Most spacious, full meal service (rare on our routes)

**Italo Classes:**
- **Smart:** Economy
- **Comfort:** Business equivalent
- **Prima:** First class equivalent

---

## Station Information

### Firenze Santa Maria Novella (SMN)

**Address:** Piazza della Stazione, 50123 Firenze
**Key Features:**
- Central location (walk to Duomo in 10 min)
- Luggage storage (€6-€12 per bag per day)
- Pharmacy, cafes, shops
- Free WiFi

**Getting to Hotels:**
- Many Florence hotels walkable
- Taxi stand outside main entrance
- Trams and buses available

### Napoli Centrale

**Address:** Piazza Garibaldi, 80142 Napoli
**Key Features:**
- Main Naples station (also called "Garibaldi")
- Can be crowded — watch belongings
- Metro connections (Line 1 and 2)
- Luggage storage available
- Taxi stand (use official white taxis only)

**Safety Note:**
- Busy station attracts pickpockets
- Keep bags close and zipped
- Use official taxis (white with meters)

### Bari Centrale

**Address:** Piazza Aldo Moro, 70122 Bari
**Key Features:**
- Modern, clean station
- Luggage storage
- 15-20 min walk to Bari Vecchia (old town)
- Good cafes and restaurants nearby

### Brindisi Stazione

**Address:** Piazza Vittorio Emanuele III, 72100 Brindisi
**Key Features:**
- Smaller station
- 10 min walk to historic center
- Taxi stand available

---

## Luggage Storage

**Available at:**
- Firenze SMN: Yes (€6-€12/bag/day)
- Napoli Centrale: Yes
- Bari Centrale: Yes
- Brindisi: Limited

**Useful For:**
- Day trips from base city
- Early hotel checkout but late train
- Exploring city upon arrival before hotel check-in

---

## Important Links

### Booking
- [Trenitalia](https://www.trenitalia.com)
- [Italo](https://www.italotreno.it)
- [Omio](https://www.omio.com) (multi-modal search)

### Station Info
- [Firenze SMN](https://www.trenitalia.com/en/customer_information/stazioni/firenze_santa_maria_novella.html)
- [Napoli Centrale](https://www.trenitalia.com/en/customer_information/stazioni/napoli_centrale.html)

### Apps
- **Trenitalia App** (iOS/Android) — Book, manage tickets, live updates
- **Italo Treno App** — Same for Italo trains
- **Google Maps** — Good for finding platforms and connections

---

## Train Travel Checklist

### Before Booking
- [ ] Check departure/arrival stations
- [ ] Compare Trenitalia vs. Italo pricing
- [ ] Decide on fare class
- [ ] Note cancellation/change policies

### After Booking
- [ ] Save tickets to phone (screenshot or download PDF)
- [ ] Add to calendar with station names and times
- [ ] Note platform if known
- [ ] Check for any schedule changes closer to date

### Day Before Travel
- [ ] Verify train status online
- [ ] Check weather (impacts luggage choices)
- [ ] Pack essentials in carry-on (water, snacks, book)
- [ ] Charge phone/devices

### Day of Travel
- [ ] Arrive station 15-20 min early
- [ ] Check departure board for platform (binario)
- [ ] Have ticket ready (QR code or validated paper)
- [ ] Confirm car/seat number on train
- [ ] Enjoy the ride!

---

**See also:** [Flight Research](flight-research.qmd) — general flight options and guidance
```

- [ ] **Step 2: Commit**

```bash
cd /home/gramps/rstudio/quarto/columbus
git add resources/train-travel.qmd
git commit -m "Add resources/train-travel.qmd with informational train content"
```

---

## Task 3: Revise `research/flights.qmd`

**Files:**
- Modify: `research/flights.qmd` (full replacement)

- [ ] **Step 1: Replace `research/flights.qmd` with actual booking content**

Overwrite the entire file with the following:

```markdown
---
title: "Flights to Italy"
subtitle: "International Flights — Reservation FMWYOJ"
categories: [logistics, flights, planning]
toc: true
---

## Overview

All international flights for the Italy trip are booked under **Reservation FMWYOJ** (Lufthansa/United codeshare).

**Outbound:** Madison → Frankfurt → Florence, June 5–6, 2026  
**Return:** Brindisi → Munich → Chicago → Madison, June 20, 2026  
**Cabin:** Premium Economy on transatlantic legs; Economy on regional hops  
**Baggage:** 2 × 23kg checked + 1 × 8kg carry-on per person

For general flight options, airline comparisons, and booking guidance, see [Flight Research](../resources/flight-research.qmd).  
For intra-Italy transport (Florence→Naples train, Naples→Brindisi flight), see [Travel in Italy](travel-in-italy.qmd).

---

## Outbound: June 5–6, 2026

### Summary

| # | Flight | Operator | Route | Departs | Arrives | Cabin |
|---|--------|----------|-------|---------|---------|-------|
| 1 | LH 8835 | GoJet/United Express | MSN → ORD | Jun 5, 5:45pm | 7:00pm | Economy |
| 2 | LH 0433 | Lufthansa | ORD → FRA | Jun 5, 10:30pm | Jun 6, 2:05pm | Premium Economy |
| 3 | LH 9498 | Air Dolomiti | FRA → FLR | Jun 6, 4:50pm | 6:30pm | Economy |

### Flight 1 — MSN → ORD (LH 8835)

**Operated by:** GoJet Airlines for United Express  
**Aircraft:** Air 109  
**Cabin:** Economy | **Seats:** 15C (Dan), 15D (Jane)  
**Duration:** 1h 15m | **Meals:** None

- Departs MSN 5:45pm → Arrives ORD Terminal 2, 7:00pm
- Arrive at airport by 3:45pm (2 hours early for international connection)
- After landing, take ATS people mover from Terminal 2 to Terminal 1 (Lufthansa departures)

### Flight 2 — ORD → FRA (LH 0433)

**Operated by:** Lufthansa  
**Aircraft:** Airbus A343 (wide-body long-haul)  
**Cabin:** Premium Economy | **Duration:** 8h 35m | **Meals:** Full meal service

- Departs ORD Terminal 1, 10:30pm (Friday, June 5)
- Arrives FRA Terminal 1, 2:05pm **(Saturday, June 6)**
- Use ORD layover (7:00pm–10:30pm) to eat dinner and find gate

**Premium Economy on Lufthansa A343:**
- Dedicated cabin, wider seats (~18–19 in), more legroom (~38 in pitch)
- Adjustable footrest, headrest, lumbar support
- Priority boarding after Business class
- Set watch to Italian time at boarding; aim for 7+ hours sleep

### Flight 3 — FRA → FLR (LH 9498)

**Operated by:** Air Dolomiti (Lufthansa regional partner)  
**Aircraft:** Embraer 195 (2-2 seating — no middle seat)  
**Cabin:** Economy | **Duration:** 1h 40m | **Meals:** Purchase available

- Departs FRA Terminal 1, 4:50pm
- Arrives **FLR (Florence Peretola Airport), 6:30pm**
- Frankfurt T1 is large — allow 30–45 min to reach gate after deplaning LH 0433
- Board early: Embraer overhead bins fill fast

See [Day 1](../daily_itineraries/day-01-2026-06-05-madison-to-frankfurt.qmd) and [Day 2](../daily_itineraries/day-02-2026-06-06-arrive-florence.qmd) for full departure-day plans including layover details and arrival logistics.

---

## Return: June 20, 2026

### Summary

| # | Flight | Operator | Route | Departs | Arrives | Cabin |
|---|--------|----------|-------|---------|---------|-------|
| 1 | LH 1895 | Air Dolomiti | BDS → MUC | Jun 20, 10:55am | 12:45pm | Economy |
| 2 | UA 8855 | Lufthansa for United | MUC → ORD | Jun 20, 3:40pm | 6:15pm | Premium Economy |
| 3 | UA 1400 | United | ORD → MSN | Jun 20, 9:15pm | 10:27pm | Premium Economy |

### Flight 1 — BDS → MUC (LH 1895)

**Operated by:** Air Dolomiti  
**Aircraft:** Embraer 195  
**Cabin:** Economy | **Duration:** 1h 50m | **Meals:** Purchase available

- Departs BDS 10:55am → Arrives MUC Terminal 2, 12:45pm
- Depart hotel by 8:15am (airport is small; allow 2.5 hours for check-in)
- No seat assignment until check-in

### Flight 2 — MUC → ORD (UA 8855)

**Operated by:** Lufthansa for United  
**Aircraft:** Airbus A359 (widebody)  
**Cabin:** Premium Economy | **Duration:** 9h 35m | **Meals:** Full meal service

- Departs MUC Terminal 2, 3:40pm → Arrives ORD Terminal 5 (international), 6:15pm
- Stay in MUC Terminal 2 throughout layover — no terminal change needed
- US Customs and Immigration at ORD Terminal 5 on arrival
- After clearing customs: collect bags, recheck for domestic, take ATS to Terminal 1, re-clear TSA

### Flight 3 — ORD → MSN (UA 1400)

**Operated by:** United  
**Aircraft:** Boeing 737-700  
**Cabin:** Premium Economy | **Seats:** 08D (Dan), 08E (Jane)  
**Duration:** 1h 12m | **Meals:** None

- Departs ORD Terminal 1, 9:15pm → Arrives MSN, 10:27pm
- 3-hour ORD connection is comfortable even with customs; have dinner at Terminal 1

See [Day 16](../daily_itineraries/day-16-2026-06-20-brindisi-departure.qmd) for the full departure-day plan including Brindisi airport logistics.
```

- [ ] **Step 2: Commit**

```bash
cd /home/gramps/rstudio/quarto/columbus
git add research/flights.qmd
git commit -m "Revise research/flights.qmd to show only booked international flights (FMWYOJ)"
```

---

## Task 4: Create `research/travel-in-italy.qmd`

**Files:**
- Create: `research/travel-in-italy.qmd`

- [ ] **Step 1: Write `research/travel-in-italy.qmd`**

```markdown
---
title: "Travel in Italy"
subtitle: "Booked Intra-Italy Transport"
categories: [logistics, trains, flights, transportation]
toc: true
---

## Overview

Two legs move us between Italian cities during the trip:

| Leg | Mode | Date | Operator | Booking |
|-----|------|------|----------|---------|
| Florence → Naples | Train (Italo #8902) | June 10 | Italo | PIDCMA |
| Naples → Brindisi | Flight via Rome (AZ 1270/1623) | June 13 | ITA Airways | IXYZMT |

For general Italian train information (booking tips, fare classes, station details), see [Train Travel in Italy](../resources/train-travel.qmd).

---

## Segment 1: Florence → Naples by Train — June 10

**Booked:** Italo #8902 | **Ticket:** PIDCMA

| Detail | Info |
|--------|------|
| **Route** | Firenze Santa Maria Novella (SMN) → Napoli Centrale |
| **Departs** | 12:28pm |
| **Arrives** | 3:28pm |
| **Duration** | 3 hours |
| **Car** | Salotto 1 (Lounge) |
| **Seats** | Jane (1), Dan (2) |

**What to expect:**
- Modern high-speed Italo train; power outlets and WiFi at seats
- Café/bar car available
- Scenic route: Tuscan countryside → Apennines → Vesuvius views approaching Naples
- Sit on the right side (west) for potential Vesuvius sighting on approach

**At the stations:**

*Firenze SMN:* Arrive 15–20 min early. Check departure boards for platform (binario). Station is central — walk to Duomo in 10 min.

*Napoli Centrale:* Busy station — keep bags close. Official white taxi stand outside; Metro Lines 1 and 2 connect to the city.

See [Day 7](../daily_itineraries/day-07-2026-06-11-florence-to-naples.qmd) for the full travel-day plan.

---

## Segment 2: Naples → Brindisi by Flight — June 13

**Booked:** ITA Airways (AZ) | **Reservation:** IXYZMT | **Airline code:** BY4EV5

::: {.callout-note}
## Why via Rome?
There are no direct commercial flights between Naples (NAP) and Brindisi (BDS) — the route is too short and thin for direct service. Routing via Rome Fiumicino (FCO) is the only way to fly this leg. Total journey time (~3.5 hours door-to-door from central Naples) is comparable to the 5.5-hour direct train that was the original plan.
:::

| Flight | Route | Departs | Arrives |
|--------|-------|---------|---------|
| AZ 1270 | NAP → FCO (Rome Fiumicino T1) | 3:05pm | 4:05pm |
| AZ 1623 | FCO → BDS (Brindisi) | 5:15pm | 6:25pm |

**Baggage:** 2 × 23kg checked + 1 × 8kg carry-on per person on both flights.

See [Day 9](../daily_itineraries/day-09-2026-06-13-naples.qmd) for the full departure-day plan including Naples airport logistics.
```

- [ ] **Step 2: Commit**

```bash
cd /home/gramps/rstudio/quarto/columbus
git add research/travel-in-italy.qmd
git commit -m "Add research/travel-in-italy.qmd with booked intra-Italy transport"
```

---

## Task 5: Update `_quarto.yml`

**Files:**
- Modify: `_quarto.yml`

- [ ] **Step 1: Update the navbar Research menu**

In `_quarto.yml`, locate the navbar `left:` section. Make three changes to the Research dropdown:
1. Change `text: "Flights"` → `text: "Flights to Italy"`
2. Remove the `text: "Trains"` / `href: research/trains.qmd` entry entirely
3. Add `text: "Travel in Italy"` after the Flights entry

The Research menu block should look like this after the edit:

```yaml
      - text: "Research"
        menu:
          - text: "June Calendar"
            href: research/june-calendar.qmd
          - text: "Pre-Departure Checklist"
            href: research/pre-departure-checklist.qmd
          - text: "---"
          - text: "Flights to Italy"
            href: research/flights.qmd
          - text: "Travel in Italy"
            href: research/travel-in-italy.qmd
          - text: "Accommodations"
            href: research/accommodations.qmd
          - text: "Tours"
            href: research/tours.qmd
          - text: "Museums"
            href: research/museums.qmd
          - text: "Florence Tickets"
            href: research/tickets-florence.qmd
          - text: "Naples Tickets"
            href: research/tickets-naples.qmd
          - text: "Restaurants"
            href: research/restaurants.qmd
          - text: "Packing List"
            href: research/packing-list.qmd
```

- [ ] **Step 2: Add the Resources navbar entry**

Immediately after the closing of the Research menu block (before `- text: "Regions"`), add:

```yaml
      - text: "Resources"
        menu:
          - text: "Flight Research"
            href: resources/flight-research.qmd
          - text: "Train Travel in Italy"
            href: resources/train-travel.qmd
```

- [ ] **Step 3: Update the sidebar Pre-Trip Planning section**

Locate the sidebar `contents:` under `section: "Pre-Trip Planning"`. Remove `research/trains.qmd` and add `research/travel-in-italy.qmd` after `research/flights.qmd`:

```yaml
      - section: "Pre-Trip Planning"
        contents:
          - research/june-calendar.qmd
          - research/pre-departure-checklist.qmd
          - research/flights.qmd
          - research/travel-in-italy.qmd
          - research/accommodations.qmd
          - research/tours.qmd
          - research/museums.qmd
          - research/tickets-florence.qmd
          - research/tickets-naples.qmd
          - research/restaurants.qmd
          - research/packing-list.qmd
```

- [ ] **Step 4: Add the Resources sidebar section**

After the `Pre-Trip Planning` section block and its closing `- text: "---"` separator (i.e., between Pre-Trip Planning and the daily itinerary day sections), insert:

```yaml
      - text: "---"

      - section: "Resources"
        contents:
          - resources/flight-research.qmd
          - resources/train-travel.qmd
```

- [ ] **Step 5: Commit**

```bash
cd /home/gramps/rstudio/quarto/columbus
git add _quarto.yml
git commit -m "Update _quarto.yml: add Resources nav section, restructure Pre-Trip Planning"
```

---

## Task 6: Update Cross-Links in Daily Itineraries

**Files:**
- Modify: `daily_itineraries/day-01-2026-06-05-madison-to-frankfurt.qmd` (line 138)

- [ ] **Step 1: Update the link in Day 1**

In `daily_itineraries/day-01-2026-06-05-madison-to-frankfurt.qmd`, line 138 currently reads:

```markdown
- [Flights Research](../research/flights.qmd) — Complete booking details
```

Change it to:

```markdown
- [Flights to Italy](../research/flights.qmd) — Complete booking details
```

(The href stays the same; only the link text changes.)

- [ ] **Step 2: Commit**

```bash
cd /home/gramps/rstudio/quarto/columbus
git add daily_itineraries/day-01-2026-06-05-madison-to-frankfurt.qmd
git commit -m "Update Day 1 cross-link: Flights Research → Flights to Italy"
```

---

## Task 7: Render and Verify

**Files:** None (verification only)

- [ ] **Step 1: Render the site**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus
```

Expected: render completes with no errors. Warnings about missing citations or freeze cache are acceptable.

- [ ] **Step 2: Check for broken references**

```bash
docker exec rstudio quarto render /home/rstudio/Quarto/columbus 2>&1 | grep -i "error\|not found\|missing"
```

Expected: no output (no errors).

- [ ] **Step 3: Spot-check the rendered output**

Verify the following files exist in `_site/`:

```bash
ls /home/gramps/rstudio/quarto/columbus/_site/resources/
# Expected: flight-research.html  train-travel.html

ls /home/gramps/rstudio/quarto/columbus/_site/research/ | grep -E "flights|travel|trains"
# Expected: flights.html  travel-in-italy.html  trains.html (trains.html is fine — file stays on disk)
```

- [ ] **Step 4: Verify _quarto.yml is syntactically valid**

```bash
docker exec rstudio quarto check /home/rstudio/Quarto/columbus 2>&1 | tail -20
```

Expected: no YAML parse errors.

---

## Task 8: Final Commit

- [ ] **Step 1: Confirm clean working tree**

```bash
cd /home/gramps/rstudio/quarto/columbus
git status
```

Expected: `nothing to commit, working tree clean` (all changes committed in tasks 1–6).

- [ ] **Step 2: Tag the state (optional)**

If you want a named checkpoint:

```bash
git tag nav-restructure-complete
```

---

## Self-Review

**Spec coverage check:**

| Spec requirement | Covered by |
|-----------------|------------|
| `resources/flight-research.qmd` with informational content from flights.qmd | Task 1 |
| `resources/train-travel.qmd` with informational content from trains.qmd | Task 2 |
| `research/flights.qmd` revised to actual international flights (FMWYOJ) | Task 3 |
| `research/travel-in-italy.qmd` with actual intra-Italy transport (PIDCMA + IXYZMT) | Task 4 |
| Sidebar Pre-Trip Planning: trains.qmd removed, travel-in-italy.qmd added | Task 5 step 3 |
| Sidebar Resources section added | Task 5 step 4 |
| Navbar Research menu updated (Flights→Flights to Italy, Trains removed, Travel in Italy added) | Task 5 step 1 |
| Navbar Resources dropdown added | Task 5 step 2 |
| Cross-link Day 1 updated | Task 6 |
| Render and verify | Task 7 |
| `research/trains.qmd` stays on disk, removed from nav | Handled in Task 5 (not added to any nav section) |

**Placeholder scan:** No TBDs, TODOs, or vague steps. All file content is complete and inline.

**Type/link consistency:** All hrefs use consistent relative paths (`../resources/` from daily_itineraries, `../research/` from resources pages, bare `resources/` and `research/` from `_quarto.yml` root).
