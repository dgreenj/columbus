#!/usr/bin/env python3
"""
Florence Ticket Agent — Days 3 & 4
Fetches official booking info for each site and writes research/tickets-days-3-4.md
"""

import re
import subprocess
import sys
from pathlib import Path
from datetime import datetime

PROJECT_ROOT = Path(__file__).parent.parent
OUTPUT_FILE = PROJECT_ROOT / "research" / "tickets-days-3-4.md"

SITES = [
    # ── Florence ──────────────────────────────────────────────────────────
    {
        "city": "florence",
        "day": 3,
        "date": "Saturday June 7",
        "name": "Duomo Complex (combo ticket)",
        "url": "https://www.museumflorence.com/museum/3/tickets-for-brunelleschi-dome",
        "notes": "€30 combo; timed dome climb; go first thing in morning",
    },
    {
        "city": "florence",
        "day": 3,
        "date": "Saturday June 7",
        "name": "Uffizi Gallery",
        "url": "https://www.uffizi.it/en/tickets",
        "notes": "Timed entry; June weekends sell out weeks ahead",
    },
    {
        "city": "florence",
        "day": 4,
        "date": "Sunday June 8",
        "name": "Galleria dell'Accademia (David)",
        "url": "https://www.galleriaaccademiafirenze.it/en/tickets/",
        "notes": "Timed entry; 8:15 AM slot best — before crowds",
    },
    {
        "city": "florence",
        "day": 4,
        "date": "Sunday June 8",
        "name": "Medici Chapels",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/ticketCategoryList.aspx?lang=en&IDMostra=7",
        "notes": "Book same session; walk from Accademia ~10 min",
    },
    {
        "city": "florence",
        "day": 4,
        "date": "Sunday June 8",
        "name": "Basilica di San Lorenzo & Laurentian Library",
        "url": "https://www.operamedicealaurenziana.org",
        "notes": "Separate ticket for library; confirm Sunday hours",
    },
    {
        "city": "florence",
        "day": 4,
        "date": "Sunday June 8",
        "name": "Palazzo Vecchio (optional)",
        "url": "https://www.museumflorence.com/museum/1/palazzo-vecchio",
        "notes": "Secret passages tour extra; afternoon slot",
    },
    {
        "city": "florence",
        "day": 4,
        "date": "Sunday June 8",
        "name": "Museum of San Marco (optional)",
        "url": "https://www.b-ticket.com/b-ticket/uffizi/ticketCategoryList.aspx?lang=en&IDMostra=47",
        "notes": "Fra Angelico frescoes; closed Tuesday — open Sunday",
    },
    # ── Naples ────────────────────────────────────────────────────────────
    {
        "city": "naples",
        "day": 8,
        "date": "Thursday June 12",
        "name": "Herculaneum (Parco Archeologico)",
        "url": "https://ercolano.beniculturali.it/en/biglietti/",
        "notes": "Circumvesuviana to Ercolano Scavi (20 min); better preserved than Pompeii",
    },
    {
        "city": "naples",
        "day": 8,
        "date": "Thursday June 12",
        "name": "MANN — Museo Archeologico Nazionale",
        "url": "https://mann-napoli.it/en/tickets/",
        "notes": "€18; go after Herculaneum for context; allow 2-3 hours; closed Tuesdays",
    },
    {
        "city": "naples",
        "day": 8,
        "date": "Thursday June 12",
        "name": "Cappella Sansevero (Veiled Christ)",
        "url": "https://www.museosansevero.it/en/tickets/",
        "notes": "€9; ESSENTIAL timed booking — tiny chapel, very limited slots; no photography",
    },
    {
        "city": "naples",
        "day": 9,
        "date": "Friday June 13",
        "name": "Napoli Sotterranea (Underground Naples)",
        "url": "http://www.napolisotterranea.org",
        "notes": "Guided tours only; 40m underground; ancient Roman theater + WWII shelters",
    },
]


def scrape_site(url: str) -> str:
    """Run firecrawl scrape and return markdown content, or error string."""
    try:
        result = subprocess.run(
            ["firecrawl", "scrape", url],
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


# Domains that host actual ticket purchases
TICKET_DOMAINS = [
    "tickets.duomo.firenze.it",
    "uffizi.it",
    "galleriaaccademiafirenze.it",
    "b-ticket.com",
    "museumflorence.com",
    "operamedicealaurenziana.org",
    "museosansevero.it",
    "mann-napoli.it",
    "coopculture.it",
    "ticketone.it",
    "vivaticket.com",
    "napolisotterranea.org",
    "ercolano.beniculturali.it",
]

_LINK_RE = re.compile(r'\]\((https?://[^)]+)\)')


def _clean_line(line: str) -> str:
    """Strip leading list markers (-, *, •) from a line."""
    return re.sub(r'^[\-\*•]\s*', '', line).strip()


def extract_ticket_info(raw_markdown: str, site_name: str) -> dict:
    """
    Pull price lines and booking/purchase links out of raw scraped markdown.
    Returns dict with keys: prices (list[str]), book_links (list[str]), excerpt (str).

    Price heuristic: line contains € immediately followed by a digit.
    Link heuristic: markdown link whose URL is on a known ticket domain.
    """
    lines = raw_markdown.splitlines()
    prices = []
    book_links = []

    for line in lines:
        cleaned = _clean_line(line)

        # Price: must contain € immediately followed by a digit
        if re.search(r'€\s*\d', cleaned) and len(cleaned) < 200:
            prices.append(cleaned)

        # Booking link: URL must be on a known ticket domain
        m = _LINK_RE.search(line)
        if m:
            url = m.group(1).lower()
            if any(domain in url for domain in TICKET_DOMAINS):
                book_links.append(cleaned)

    excerpt = raw_markdown[:400].replace("\n", " ")

    return {
        "prices": prices[:8],
        "book_links": book_links[:5],
        "excerpt": excerpt,
    }


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
                lines.append("**Page excerpt:**")
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

    print(f"\nWriting report to {OUTPUT_FILE} ...")
    write_report(results, OUTPUT_FILE)
