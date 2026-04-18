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
        "prices": prices[:8],         # cap at 8 lines
        "book_links": book_links[:5],  # cap at 5 links
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
