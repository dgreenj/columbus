# Florence Ticket Agent Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a Python script that reads Days 3 & 4 of the columbus Italy itinerary, uses Firecrawl to fetch official ticket booking pages for each site, and writes a structured `tickets-days-3-4.md` report with prices, booking links, and timed-entry instructions.

**Architecture:** Single Python script (`scripts/ticket_agent.py`) with a hardcoded site manifest for Days 3–4, Firecrawl CLI calls to scrape official booking pages, and a Markdown reporter that writes output into `research/tickets-days-3-4.md` inside the columbus Quarto project.

**Tech Stack:** Python 3 (stdlib only + subprocess), Firecrawl CLI (`firecrawl` on PATH via `~/.claude/plugins`), Bash runner

------------------------------------------------------------------------

## Sites Reference (derived from Days 3 & 4)

### Day 3 — Saturday June 7

| Site | Booking URL | Notes |
|----|----|----|
| Duomo Complex (combo) | https://www.museumflorence.com | €30; timed dome climb required |
| Uffizi Gallery | https://www.uffizi.it/en/tickets | Timed entry; book weeks ahead in June |

### Day 4 — Sunday June 8

| Site | Booking URL | Notes |
|----|----|----|
| Galleria dell'Accademia (David) | https://www.b-ticket.com/b-ticket/uffizi/default.aspx | Timed entry; sells out fast |
| Medici Chapels | https://www.b-ticket.com/b-ticket/uffizi/default.aspx | Book same session as Accademia |
| Basilica di San Lorenzo | https://www.operamedicealaurenziana.org | Separate ticket; Laurentian Library extra |
| Palazzo Vecchio (optional) | https://www.museumflorence.com | City hall + secret passages tour |
| Museum of San Marco (optional) | https://www.b-ticket.com/b-ticket/uffizi/default.aspx | Fra Angelico frescoes |

------------------------------------------------------------------------

## File Structure

```         
columbus/
├── scripts/
│   └── ticket_agent.py          # CREATE — main agent script
└── research/
    └── tickets-days-3-4.md      # CREATE — output report (overwritten each run)
```

------------------------------------------------------------------------

### Task 1: Create the script skeleton and site manifest

**Files:** - Create: `scripts/ticket_agent.py`

-   [ ] **Step 1: Create `scripts/` directory**

``` bash
mkdir -p /home/gramps/rstudio/quarto/columbus/scripts
```

-   [ ] **Step 2: Write `ticket_agent.py` with site manifest**

``` python
#!/usr/bin/env python3
"""
Florence Ticket Agent — Days 3 & 4
Fetches official booking info for each site and writes research/tickets-days-3-4.md
"""

import subprocess
import json
import sys
from pathlib import Path
from datetime import datetime

PROJECT_ROOT = Path(__file__).parent.parent
OUTPUT_FILE = PROJECT_ROOT / "research" / "tickets-days-3-4.md"

SITES = [
    {
        "day": 3,
        "date": "Saturday June 7",
        "name": "Duomo Complex (combo ticket)",
        "url": "https://www.museumflorence.com/museum/3/tickets-for-brunelleschi-dome",
        "notes": "€30 combo; timed dome climb; go first thing in morning",
    },
    {
        "day": 3,
        "date": "Saturday June 7",
        "name": "Uffizi Gallery",
        "url": "https://www.uffizi.it/en/tickets",
        "notes": "Timed entry; June weekends sell out weeks ahead",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Galleria dell'Accademia (David)",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Timed entry; 8:15 AM slot best — before crowds",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Medici Chapels",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Book same session; walk from Accademia ~10 min",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Basilica di San Lorenzo & Laurentian Library",
        "url": "https://www.operamedicealaurenziana.org",
        "notes": "Separate ticket for library; confirm Sunday hours",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Palazzo Vecchio (optional)",
        "url": "https://www.museumflorence.com/museum/1/palazzo-vecchio",
        "notes": "Secret passages tour extra; afternoon slot",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Museum of San Marco (optional)",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Fra Angelico frescoes; closed Tuesday — open Sunday",
    },
]

if __name__ == "__main__":
    print(f"Florence Ticket Agent — {len(SITES)} sites to check")
    print(f"Output: {OUTPUT_FILE}\n")
    # Tasks 2 and 3 add scraping and report writing here
```

-   [ ] **Step 3: Make executable**

``` bash
chmod +x /home/gramps/rstudio/quarto/columbus/scripts/ticket_agent.py
```

-   [ ] **Step 4: Smoke-test imports**

``` bash
cd /home/gramps/rstudio/quarto/columbus
python3 scripts/ticket_agent.py
```

Expected output:

```         
Florence Ticket Agent — 7 sites to check
Output: /home/gramps/rstudio/quarto/columbus/research/tickets-days-3-4.md
```

-   [ ] **Step 5: Commit**

``` bash
cd /home/gramps/rstudio/quarto/columbus
git add scripts/ticket_agent.py
git commit -m "feat: add ticket agent skeleton with days 3-4 site manifest"
```

------------------------------------------------------------------------

### Task 2: Add Firecrawl scraping per site

**Files:** - Modify: `scripts/ticket_agent.py`

-   [ ] **Step 1: Verify Firecrawl CLI is available**

``` bash
which firecrawl || echo "NOT FOUND — check PATH"
firecrawl --help 2>&1 | head -5
```

Expected: version/help output. If not found, check `~/.claude/plugins` or install per Firecrawl skill.

-   [ ] **Step 2: Test a single Firecrawl scrape manually**

``` bash
firecrawl scrape "https://www.uffizi.it/en/tickets" --format markdown 2>&1 | head -60
```

Note the exact flag names from the output — use them verbatim in the script.

-   [ ] **Step 3: Add `scrape_site()` function to `ticket_agent.py`**

Replace the `if __name__ == "__main__":` block with this full file content:

``` python
#!/usr/bin/env python3
"""
Florence Ticket Agent — Days 3 & 4
Fetches official booking info for each site and writes research/tickets-days-3-4.md
"""

import subprocess
import json
import sys
from pathlib import Path
from datetime import datetime

PROJECT_ROOT = Path(__file__).parent.parent
OUTPUT_FILE = PROJECT_ROOT / "research" / "tickets-days-3-4.md"

SITES = [
    {
        "day": 3,
        "date": "Saturday June 7",
        "name": "Duomo Complex (combo ticket)",
        "url": "https://www.museumflorence.com/museum/3/tickets-for-brunelleschi-dome",
        "notes": "€30 combo; timed dome climb; go first thing in morning",
    },
    {
        "day": 3,
        "date": "Saturday June 7",
        "name": "Uffizi Gallery",
        "url": "https://www.uffizi.it/en/tickets",
        "notes": "Timed entry; June weekends sell out weeks ahead",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Galleria dell'Accademia (David)",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Timed entry; 8:15 AM slot best — before crowds",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Medici Chapels",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Book same session; walk from Accademia ~10 min",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Basilica di San Lorenzo & Laurentian Library",
        "url": "https://www.operamedicealaurenziana.org",
        "notes": "Separate ticket for library; confirm Sunday hours",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Palazzo Vecchio (optional)",
        "url": "https://www.museumflorence.com/museum/1/palazzo-vecchio",
        "notes": "Secret passages tour extra; afternoon slot",
    },
    {
        "day": 4,
        "date": "Sunday June 8",
        "name": "Museum of San Marco (optional)",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/default.aspx",
        "notes": "Fra Angelico frescoes; closed Tuesday — open Sunday",
    },
]


def scrape_site(url: str) -> str:
    """Run firecrawl scrape and return markdown content, or error string."""
    try:
        result = subprocess.run(
            ["firecrawl", "scrape", url, "--format", "markdown"],
            capture_output=True,
            text=True,
            timeout=30,
        )
        if result.returncode == 0 and result.stdout.strip():
            return result.stdout.strip()
        return f"[Scrape failed — exit {result.returncode}]\n{result.stderr[:300]}"
    except subprocess.TimeoutExpired:
        return "[Scrape timed out after 30s]"
    except FileNotFoundError:
        return "[firecrawl CLI not found — check PATH]"


def extract_ticket_info(raw_markdown: str, site_name: str) -> dict:
    """
    Pull price lines and booking/purchase links out of raw scraped markdown.
    Returns dict with keys: prices (list[str]), book_links (list[str]), excerpt (str).
    """
    lines = raw_markdown.splitlines()
    prices = []
    book_links = []

    for line in lines:
        lower = line.lower()
        # Price heuristic: contains € or "euro" or "admission" or "ticket"
        if any(tok in lower for tok in ["€", "euro", "admission", "price", "ticket", "fee"]):
            stripped = line.strip()
            if stripped and len(stripped) < 200:
                prices.append(stripped)
        # Link heuristic: markdown links containing buy/book/ticket/shop/reserv
        if any(tok in lower for tok in ["book", "buy", "ticket", "reserv", "shop", "acquist"]):
            if "](http" in line:
                book_links.append(line.strip())

    # First 400 chars as excerpt context
    excerpt = raw_markdown[:400].replace("\n", " ")

    return {
        "prices": prices[:8],        # cap at 8 lines
        "book_links": book_links[:5], # cap at 5 links
        "excerpt": excerpt,
    }


if __name__ == "__main__":
    results = []

    for site in SITES:
        print(f"Scraping: {site['name']} ...")
        raw = scrape_site(site["url"])
        info = extract_ticket_info(raw, site["name"])
        results.append({**site, **info, "raw_length": len(raw)})
        print(f"  → {len(info['prices'])} price lines, {len(info['book_links'])} booking links")

    print(f"\nAll done. Writing {OUTPUT_FILE} ...")
    # Task 3 adds report writing here
    print("(Report writer not yet implemented)")
```

-   [ ] **Step 4: Run and verify scraping works**

``` bash
cd /home/gramps/rstudio/quarto/columbus
python3 scripts/ticket_agent.py 2>&1
```

Expected: 7 lines like `Scraping: Uffizi Gallery ...` with counts. If firecrawl returns errors, note which sites fail — the report writer handles graceful fallback.

-   [ ] **Step 5: Commit**

``` bash
cd /home/gramps/rstudio/quarto/columbus
git add scripts/ticket_agent.py
git commit -m "feat: add firecrawl scraping and ticket info extraction to ticket agent"
```

------------------------------------------------------------------------

### Task 3: Add Markdown report writer

**Files:** - Modify: `scripts/ticket_agent.py` - Create: `research/tickets-days-3-4.md` (generated)

-   [ ] **Step 1: Add `write_report()` function and wire it into `__main__`**

Replace the entire `if __name__ == "__main__":` block (and add the function before it):

``` python
def write_report(results: list, output_path: Path) -> None:
    """Write structured markdown report of all scraped ticket info."""
    output_path.parent.mkdir(parents=True, exist_ok=True)

    lines = [
        "# Florence Ticket Booking — Days 3 & 4",
        "",
        f"> Generated by `scripts/ticket_agent.py` on {datetime.now().strftime('%Y-%m-%d %H:%M')}",
        "> Re-run any time to refresh: `python3 scripts/ticket_agent.py`",
        "",
        "---",
        "",
    ]

    current_day = None
    for r in results:
        if r["day"] != current_day:
            current_day = r["day"]
            lines += [
                f"## Day {r['day']} — {r['date']}",
                "",
            ]

        lines += [
            f"### {r['name']}",
            "",
            f"**Our notes:** {r['notes']}",
            "",
            f"**Official page:** <{r['url']}>",
            "",
        ]

        if r["prices"]:
            lines.append("**Pricing / Ticket Info Found:**")
            lines.append("")
            for p in r["prices"]:
                lines.append(f"- {p}")
            lines.append("")

        if r["book_links"]:
            lines.append("**Booking Links Found:**")
            lines.append("")
            for lnk in r["book_links"]:
                lines.append(f"- {lnk}")
            lines.append("")

        if not r["prices"] and not r["book_links"]:
            lines.append(f"_No price or booking links extracted — visit page directly: <{r['url']}>_")
            lines.append("")
            if r["raw_length"] > 50:
                lines.append(f"**Page excerpt:**")
                lines.append("")
                lines.append(f"> {r['excerpt'][:300]}")
                lines.append("")

        lines.append("---")
        lines.append("")

    lines += [
        "## Booking Checklist",
        "",
        "- [ ] Duomo Complex dome climb — timed entry",
        "- [ ] Uffizi Gallery — timed entry",
        "- [ ] Galleria dell'Accademia (David) — timed entry",
        "- [ ] Medici Chapels",
        "- [ ] Basilica di San Lorenzo / Laurentian Library",
        "- [ ] Palazzo Vecchio (optional)",
        "- [ ] Museum of San Marco (optional)",
        "",
        "> **Tip:** Book Uffizi and Accademia first — they sell out fastest for June Saturdays/Sundays.",
    ]

    output_path.write_text("\n".join(lines), encoding="utf-8")
    print(f"Report written: {output_path}")


if __name__ == "__main__":
    results = []

    for site in SITES:
        print(f"Scraping: {site['name']} ...")
        raw = scrape_site(site["url"])
        info = extract_ticket_info(raw, site["name"])
        results.append({**site, **info, "raw_length": len(raw)})
        print(f"  → {len(info['prices'])} price lines, {len(info['book_links'])} booking links")

    print(f"\nAll done. Writing report ...")
    write_report(results, OUTPUT_FILE)
```

-   [ ] **Step 2: Run the full agent**

``` bash
cd /home/gramps/rstudio/quarto/columbus
python3 scripts/ticket_agent.py
```

Expected final line: `Report written: .../research/tickets-days-3-4.md`

-   [ ] **Step 3: Verify the report**

``` bash
cat /home/gramps/rstudio/quarto/columbus/research/tickets-days-3-4.md
```

Verify it contains: - Two `## Day N` headers - All 7 site sections - At least some price/link lines (sites that scraped successfully) - Booking checklist at the bottom

-   [ ] **Step 4: Commit both script and report**

``` bash
cd /home/gramps/rstudio/quarto/columbus
git add scripts/ticket_agent.py research/tickets-days-3-4.md
git commit -m "feat: complete florence ticket agent — scrape + markdown report for days 3-4"
```

------------------------------------------------------------------------

## Self-Review

**Spec coverage:** - \[x\] Reads days 3 & 4 sites — hardcoded manifest derived from `.qmd` files - \[x\] Uses Firecrawl to fetch booking pages - \[x\] Outputs structured report with prices + booking links - \[x\] Saves to columbus project at `research/tickets-days-3-4.md` - \[x\] Booking checklist included

**Placeholder scan:** No TBDs. All code blocks are complete and runnable.

**Type consistency:** `results` is `list[dict]` throughout; `scrape_site` returns `str`; `extract_ticket_info` returns `dict` with keys `prices`, `book_links`, `excerpt`. `write_report` consumes the merged dicts — keys align.

------------------------------------------------------------------------

## Execution Handoff

Plan complete and saved to `docs/superpowers/plans/2026-04-18-florence-ticket-agent.md`.

**Two execution options:**

**1. Subagent-Driven (recommended)** — fresh subagent per task, review between tasks

**2. Inline Execution** — execute tasks in this session using executing-plans

**Which approach?**
