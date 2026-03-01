# Complete Korea & Japan Trip QMD File Generator
# This script creates all files as .qmd format for Quarto
# Covers Korea (Oct 25-31) and Japan (Nov 2-15)

# Load required libraries
library(dplyr)
library(stringr)
library(lubridate)

# Korea itinerary data (Oct 24-31, 2025)
korea_itinerary_data <- list(
    list(
        date = "October 24",
        day_num = "Day 1",
        location = "Travel Day",
        meals = "Flight meals",
        theme = "Departure from Madison",
        activities = c("Flight from Madison, WI to Chicago O'Hare", "Direct flight to Incheon, South Korea on Korean Air", "International travel day", "Cross International Date Line")
    ),
    list(
        date = "October 25",
        day_num = "Day 2",
        location = "Incheon",
        meals = "Light dinner (optional)",
        theme = "Arriving at Incheon Airport",
        activities = c("Arriving at Incheon Airport", "Transportation: Jun's car", "Incheon night view, light dinner (optional)", "Hotel: Holiday Inn ($120 per night)")
    ),
    list(
        date = "October 26",
        day_num = "Day 3",
        location = "Incheon",
        meals = "Lunch, Dinner (cruise ship)",
        theme = "Korean War",
        activities = c("General Douglas MacArthur Statue", "Memorial Hall for Incheon Landing Operation (Lunch)", "Incheon Yeon-An Pier, fish market", "Palmido (visiting Korea's first lighthouse, Korean war)", "Cruise ship (Dinner)")
    ),
    list(
        date = "October 27",
        day_num = "Day 4",
        location = "Gyeonggi-Do, North Seoul",
        meals = "Lunch (Heyri Art Village), Dinner (Insadong)",
        theme = "DMZ",
        activities = c("DMZ", "Majang Reservoir Suspension Bridge", "Heyri Art Village (Lunch)", "Insadong Night View Tour (Dinner)", "Hotel: Hotel Sunbee Insadong ($170.84 per night)")
    ),
    list(
        date = "October 28",
        day_num = "Day 5",
        location = "Seoul",
        meals = "Dinner (Itaewon)",
        theme = "Korean Culture",
        activities = c("National Museum of Korea", "Han River Relaxation", "Itaewon (Dinner)", "Transportation: Walk, Subway, Bus")
    ),
    list(
        date = "October 29",
        day_num = "Day 6",
        location = "Seoul",
        meals = "Temple meals",
        theme = "Buddhism Experience",
        activities = c("Gyeongbokgung Palace", "Craft-Art Museum", "2 days temple experience begins", "Hotel: Geumsunsa Temple Stay (KRW 320,000 for 4 people)", "Check-in before 2:30 PM", "Bring own toiletries, towels and tumbler")
    ),
    list(
        date = "October 30",
        day_num = "Day 7",
        location = "Seoul",
        meals = "Local market dining",
        theme = "Shopping",
        activities = c("Nam-san Mountain", "Skyview", "Local market", "Eyeglasses shopping", "Hotel: AWIK Hanok Stay (KRW 475,000 for 4-6 guests)")
    ),
    list(
        date = "October 31",
        day_num = "Day 8",
        location = "Seoul to Japan",
        meals = "Airport departure",
        theme = "Trip to Japan",
        activities = c("Gyeongbokgung Palace", "Craft-Art Museum", "Transportation: Subway to Airport", "Departure to Japan")
    )
)

# Japan itinerary data (Nov 2-15, 2025) - same as before
japan_itinerary_data <- list(
    list(
        date = "November 2",
        day_num = "Day 1",
        location = "Tokyo",
        meals = "Dinner included",
        activities = c("Arrival Day + Welcome Dinner", "Overnight at Hotel East 21")
    ),
    list(
        date = "November 3",
        day_num = "Day 2",
        location = "Tokyo",
        meals = "Lunch and Dinner included",
        activities = c("Group Sewing with Heidi Parkes", "Fabric Shopping", "Overnight at Hotel East 21")
    ),
    list(
        date = "November 4",
        day_num = "Day 3",
        location = "Tokyo",
        meals = "Dinner included",
        activities = c("Tokyo Day Tour with a guide", "Meiji Jingu Shrine, Tsukiji Outer Market: Lunch on Your Own", "Kimono & Tea Ceremony Experience, Asakusa", "Overnight at Hotel East 21")
    ),
    list(
        date = "November 5",
        day_num = "Day 4",
        location = "Tokyo",
        meals = "Lunch & Dinner included",
        activities = c("Luggage Transfer to Kyoto", "Group Sewing With Heidi Parkes", "Digital Art Experience", "Overnight at Hotel East 21")
    ),
    list(
        date = "November 6",
        day_num = "Day 5",
        location = "Tokyo",
        meals = "Dinner included",
        activities = c("Lunch on your own", "Sashiko Museum", "Overnight at Hotel Regina Lake Kawaguchi")
    ),
    list(
        date = "November 7",
        day_num = "Day 6",
        location = "Mt. Fuji Area",
        meals = "Lunch & Dinner included",
        activities = c("Oahino Hakkai (Eight Ponds of Oshino) near Mt. Fuji", "Bullet Train to Kyoto", "Group Sewing with Heidi Parkes")
    ),
    list(
        date = "November 8",
        day_num = "Day 7",
        location = "Kyoto",
        meals = "Lunch included",
        activities = c("Kyoto Day Tour", "Kiyomizu Temple, Sanju Sangendo, Fushimi Inari Shrine; optional: Nishiki Market; Nomura Taylor")
    ),
    list(
        date = "November 9",
        day_num = "Day 8",
        location = "Kyoto",
        meals = "Lunch included",
        activities = c("Free time in Kyoto", "Dinner on your own")
    ),
    list(
        date = "November 10",
        day_num = "Day 9",
        location = "Kyoto",
        meals = "Lunch & Dinner included",
        activities = c("Luggage transfer to Tokyo", "Kyoto Day Tour", "Kinkakuji, Daitoku-ji, Nijo Castle, Arashiyama")
    ),
    list(
        date = "November 11",
        day_num = "Day 10",
        location = "Niigata",
        meals = "Lunch and Dinner included",
        activities = c("Domestic air from Osaka to Niigata (included)", "Tachikawa Weaving Factory", "Overnight at Hotel Nikko Niigata")
    ),
    list(
        date = "November 12",
        day_num = "Day 11",
        location = "Niigata",
        meals = "Lunch and Dinner included",
        activities = c("Akiko Ike Workshop in Echizenhama", "Hoshina Studio", "Bento Box lunch", "Bullet Train from Niigata to Tokyo", "Overnight Grand Nikko Odaiba Tokyo")
    ),
    list(
        date = "November 13",
        day_num = "Day 12",
        location = "Yokohama/Tokyo",
        meals = "Dinner included",
        activities = c("Yokohama Quilt Show", "Lunch on your own", "Overnight Grand Nikko Odaiba Tokyo")
    ),
    list(
        date = "November 14",
        day_num = "Day 13",
        location = "Tokyo",
        meals = "Lunch & Dinner included",
        activities = c("Shizuka Kusano Japanese Embroidery Workshop", "Farewell Dinner", "Overnight Grand Nikko Odaiba Tokyo")
    ),
    list(
        date = "November 15",
        day_num = "Day 14",
        location = "Tokyo",
        meals = "",
        activities = c("Tour ends after breakfast")
    )
)

# Function to create full Korea itinerary QMD file
create_korea_full_itinerary_qmd <- function(days, filename = "korea_trip_full_itinerary.qmd") {

    # Create header
    header <- paste0(
        "---\n",
        "title: \"Korea Cultural & Historical Tour\"\n",
        "subtitle: \"Complete Itinerary - October 25-31, 2025\"\n",
        "author: \"SYP's MTU Trading Room\"\n",
        "date: \"`r Sys.Date()`\"\n",
        "format:\n",
        "  html:\n",
        "    theme: lux\n",
        "    toc: true\n",
        "---\n\n"
    )

    # Create introduction
    intro <- paste0(
        "# Korea Trip Overview\n\n",
        "**Dates:** October 24-31, 2025  \n",
        "**Duration:** 8 days  \n",
        "**Guide:** Jun  \n",
        "**Focus:** Travel, Korean War history, culture, Buddhism, and modern Seoul\n\n",
        "Experience Korea's rich history and vibrant culture through guided tours, ",
        "cultural experiences, temple stays, and exploration of both historical sites and modern Seoul.\n\n",
        "## Trip Highlights\n\n",
        "- Korean War historical sites and memorials\n",
        "- DMZ (Demilitarized Zone) experience\n",
        "- Traditional Buddhist temple stay\n",
        "- Gyeongbokgung Palace and cultural sites\n",
        "- Modern Seoul exploration and shopping\n",
        "- Local markets and authentic dining\n\n",
        "---\n\n"
    )

    # Create day-by-day content
    content <- sapply(days, function(day) {
        day_content <- paste0(
            "## ", day$date, " - ", day$day_num, "\n\n",
            if(day$location != "") paste0("**Location:** ", day$location, "\n") else "",
            if(!is.null(day$theme)) paste0("**Theme:** ", day$theme, "\n") else "",
            if(day$meals != "") paste0("**Meals:** ", day$meals, "\n\n") else "\n",
            "### Activities\n\n"
        )

        if (length(day$activities) > 0) {
            activities <- paste(paste0("- ", day$activities), collapse = "\n")
            day_content <- paste0(day_content, activities, "\n\n")
        }

        day_content <- paste0(day_content, "---\n\n")
        return(day_content)
    })

    # Combine all content
    full_content <- paste0(header, intro, paste(content, collapse = ""))

    # Write to file
    writeLines(full_content, filename)
    cat("Korea full itinerary written to:", filename, "\n")

    return(filename)
}

# Function to create Japan full itinerary (same as before but updated)
create_japan_full_itinerary_qmd <- function(days, filename = "japan_trip_full_itinerary.qmd") {

    # Create header
    header <- paste0(
        "---\n",
        "title: \"Art & Culture Tour of Japan with Heidi Parkes\"\n",
        "subtitle: \"Complete Itinerary - November 2-15, 2025\"\n",
        "author: \"Wisconsin Museum of Quilts and Fiber Arts\"\n",
        "date: \"`r Sys.Date()`\"\n",
        "format:\n",
        "  html:\n",
        "    theme: lux\n",
        "    toc: true\n",
        "---\n\n"
    )

    # Create introduction
    intro <- paste0(
        "# Japan Trip Overview\n\n",
        "**Dates:** November 2-15, 2025  \n",
        "**Duration:** 14 days  \n",
        "**Group Size:** 16 participants plus coordinators and Heidi Parkes  \n",
        "**Featured Artist:** Heidi Parkes  \n\n",
        "Experience hand quilting and design inspiration in Japan with artist Heidi Parkes. ",
        "This intimate tour features sewing time, hands-on workshops, arts & culture tours, ",
        "admission to the Yokohama Quilt Festival, and more.\n\n",
        "## What's Included\n\n",
        "- 13 nights in 4- and 5-star hotels (breakfast included)\n",
        "- Guided English-speaking experiences and tours\n",
        "- Chartered buses and bullet train tickets\n",
        "- Various meals as specified in itinerary\n\n",
        "---\n\n"
    )

    # Create day-by-day content
    content <- sapply(days, function(day) {
        day_content <- paste0(
            "## ", day$date, " - ", day$day_num, "\n\n",
            if(day$location != "") paste0("**Location:** ", day$location, "\n\n") else "",
            if(day$meals != "") paste0("**Meals Included:** ", day$meals, "\n\n") else "",
            "### Activities\n\n"
        )

        if (length(day$activities) > 0) {
            activities <- paste(paste0("- ", day$activities), collapse = "\n")
            day_content <- paste0(day_content, activities, "\n\n")
        }

        day_content <- paste0(day_content, "---\n\n")
        return(day_content)
    })

    # Combine all content
    full_content <- paste0(header, intro, paste(content, collapse = ""))

    # Write to file
    writeLines(full_content, filename)
    cat("Japan full itinerary written to:", filename, "\n")

    return(filename)
}

# Function to create Korea daily QMD files
create_korea_daily_qmd_files <- function(days, output_dir = "daily_itineraries") {

    # Create output directory if it doesn't exist
    if (!dir.exists(output_dir)) {
        dir.create(output_dir, recursive = TRUE)
    }

    # Create individual files
    filenames <- sapply(seq_along(days), function(i) {
        day <- days[[i]]

        # Create filename - ensuring .qmd extension
        day_num_clean <- str_replace(day$day_num, "Day ", "")
        date_clean <- str_replace_all(day$date, " ", "_")
        filename <- file.path(output_dir, paste0(date_clean, "_Day_", day_num_clean, ".qmd"))

        # Create header
        header <- paste0(
            "---\n",
            "title: \"", day$date, " - ", day$day_num, "\"\n",
            "subtitle: \"Korea Trip Itinerary\"\n",
            if(day$location != "") paste0("location: \"", day$location, "\"\n") else "",
            if(!is.null(day$theme)) paste0("theme: \"", day$theme, "\"\n") else "",
            "date: \"`r Sys.Date()`\"\n",
            "format:\n",
            "  html:\n",
            "    theme: lux\n",
            "---\n\n"
        )

        # Create content
        content <- paste0(
            "# ", day$date, " - ", day$day_num, "\n\n",
            if(day$location != "") paste0("**Location:** ", day$location, "\n") else "",
            if(!is.null(day$theme)) paste0("**Travel Theme:** ", day$theme, "\n") else "",
            if(day$meals != "") paste0("**Meals:** ", day$meals, "\n\n") else "\n",
            "## Today's Activities\n\n"
        )

        if (length(day$activities) > 0) {
            activities <- paste(paste0("- ", day$activities), collapse = "\n")
            content <- paste0(content, activities, "\n\n")
        }

        # Add notes section
        content <- paste0(content,
                          "## Cultural Notes\n\n",
                          "_Observations about Korean culture, language, or customs:_\n\n",
                          "## Personal Notes\n\n",
                          "_Add your personal notes, thoughts, or memories from this day here._\n\n",
                          "## Photos\n\n",
                          "_Space for photos or sketches from today's experiences._\n\n"
        )

        # Combine header and content
        full_content <- paste0(header, content)

        # Write to file
        writeLines(full_content, filename)

        return(filename)
    })

    cat("Korea daily QMD files created:\n")
    cat(paste(filenames, collapse = "\n"), "\n")

    return(filenames)
}

# Function to create Japan daily QMD files
create_japan_daily_qmd_files <- function(days, output_dir = "daily_itineraries") {

    # Create output directory if it doesn't exist
    if (!dir.exists(output_dir)) {
        dir.create(output_dir, recursive = TRUE)
    }

    # Create individual files
    filenames <- sapply(seq_along(days), function(i) {
        day <- days[[i]]

        # Create filename - ensuring .qmd extension
        day_num_clean <- str_replace(day$day_num, "Day ", "")
        date_clean <- str_replace_all(day$date, " ", "_")
        filename <- file.path(output_dir, paste0(date_clean, "_Day_", day_num_clean, ".qmd"))

        # Create header
        header <- paste0(
            "---\n",
            "title: \"", day$date, " - ", day$day_num, "\"\n",
            "subtitle: \"Japan Trip Itinerary\"\n",
            if(day$location != "") paste0("location: \"", day$location, "\"\n") else "",
            "date: \"`r Sys.Date()`\"\n",
            "format:\n",
            "  html:\n",
            "    theme: lux\n",
            "---\n\n"
        )

        # Create content
        content <- paste0(
            "# ", day$date, " - ", day$day_num, "\n\n",
            if(day$location != "") paste0("**Location:** ", day$location, "\n\n") else "",
            if(day$meals != "") paste0("**Meals Included:** ", day$meals, "\n\n") else "",
            "## Today's Activities\n\n"
        )

        if (length(day$activities) > 0) {
            activities <- paste(paste0("- ", day$activities), collapse = "\n")
            content <- paste0(content, activities, "\n\n")
        }

        # Add notes section
        content <- paste0(content,
                          "## Textile & Art Notes\n\n",
                          "_Patterns, colors, techniques, or inspiration from today:_\n\n",
                          "## Personal Notes\n\n",
                          "_Add your personal notes, thoughts, or memories from this day here._\n\n",
                          "## Photos\n\n",
                          "_Space for photos or sketches from today's experiences._\n\n"
        )

        # Combine header and content
        full_content <- paste0(header, content)

        # Write to file
        writeLines(full_content, filename)

        return(filename)
    })

    cat("Japan daily QMD files created:\n")
    cat(paste(filenames, collapse = "\n"), "\n")

    return(filenames)
}

# Function to create Korea notes QMD files
create_korea_notes_qmd_files <- function(output_dir = "notes") {

    # Create output directory if it doesn't exist
    if (!dir.exists(output_dir)) {
        dir.create(output_dir, recursive = TRUE)
    }

    # Define the trip dates and details for Korea
    korea_dates <- seq.Date(from = as.Date("2025-10-24"), to = as.Date("2025-10-31"), by = "day")

    # Korea day details for context
    korea_day_details <- list(
        list(location = "Travel Day", activities = "Madison to Chicago to Incheon flights"),
        list(location = "Incheon", activities = "Arrival, Incheon night view"),
        list(location = "Incheon", activities = "Korean War sites, MacArthur Statue, cruise dinner"),
        list(location = "Gyeonggi-Do, North Seoul", activities = "DMZ, Majang Bridge, Heyri Art Village, Insadong"),
        list(location = "Seoul", activities = "National Museum, Han River, Itaewon"),
        list(location = "Seoul", activities = "Gyeongbokgung Palace, Temple Stay begins"),
        list(location = "Seoul", activities = "Nam-san Mountain, Shopping, Hanok Stay"),
        list(location = "Seoul to Japan", activities = "Final palace visit, departure to Japan")
    )

    # Create individual notes files
    filenames <- character()

    for (i in 1:length(korea_dates)) {
        current_date <- korea_dates[i]
        day_num <- i

        # Format date for filename (MM_DD format)
        date_formatted <- format(current_date, "%m_%d")
        filename <- file.path(output_dir, paste0("notes_10_", date_formatted, ".qmd"))

        # Get day details
        details <- korea_day_details[[i]]

        # Format date for display
        date_display <- format(current_date, "%A, %B %d, %Y")
        date_short <- format(current_date, "%B %d")

        # Create header
        header <- paste0(
            "---\n",
            "title: \"Notes - ", date_short, " (Day ", day_num, ")\"\n",
            "subtitle: \"Korea Trip Personal Notes\"\n",
            "date: \"", current_date, "\"\n",
            "location: \"", details$location, "\"\n",
            "format:\n",
            "  html:\n",
            "    theme: lux\n",
            "    toc: true\n",
            "---\n\n"
        )

        # Create content
        content <- paste0(
            "# Personal Notes - ", date_display, "\n\n",
            "**Day ", day_num, " of 8**  \n",
            "**Location:** ", details$location, "  \n",
            "**Key Activities:** ", details$activities, "\n\n",

            "## Morning Thoughts\n\n",
            "_How am I feeling this morning?_\n\n",
            "\n\n",

            "## Activity Notes\n\n",
            "_Notes from today's experiences:_\n\n",
            "\n\n",

            "## Cultural Observations\n\n",
            "_Something new I learned about Korean culture:_\n\n",
            "\n\n",
            "_Language notes (new words/phrases):_\n\n",
            "\n\n",

            "## Food & Dining\n\n",
            "_What did I eat today?_\n\n",
            "\n\n",

            "## Evening Reflection\n\n",
            "### Highlight of the Day\n\n",
            "_What was the best part of today?_\n\n",
            "\n\n",

            "### Overall Day Rating\n\n",
            "_Rate this day (1-10):_ ___\n\n",

            "## Additional Notes\n\n",
            "_Anything else I want to remember about today:_\n\n",
            "\n\n"
        )

        # Combine header and content
        full_content <- paste0(header, content)

        # Write to file
        writeLines(full_content, filename)
        filenames <- c(filenames, filename)
    }

    cat("Korea notes files created:\n")
    cat(paste(filenames, collapse = "\n"), "\n")

    return(filenames)
}

# Function to create Japan notes QMD files (similar to before, simplified)
create_japan_notes_qmd_files <- function(output_dir = "notes") {

    # Create output directory if it doesn't exist
    if (!dir.exists(output_dir)) {
        dir.create(output_dir, recursive = TRUE)
    }

    # Define the trip dates and details for Japan
    japan_dates <- seq.Date(from = as.Date("2025-11-02"), to = as.Date("2025-11-15"), by = "day")

    # Japan day details for context
    japan_day_details <- list(
        list(location = "Tokyo", activities = "Arrival Day + Welcome Dinner"),
        list(location = "Tokyo", activities = "Group Sewing with Heidi Parkes, Fabric Shopping"),
        list(location = "Tokyo", activities = "Tokyo Day Tour, Meiji Jingu Shrine, Kimono & Tea Ceremony"),
        list(location = "Tokyo", activities = "Group Sewing, Digital Art Experience"),
        list(location = "Tokyo", activities = "Sashiko Museum"),
        list(location = "Mt. Fuji Area", activities = "Eight Ponds of Oshino, Bullet Train to Kyoto"),
        list(location = "Kyoto", activities = "Kyoto Day Tour, Kiyomizu Temple, Fushimi Inari Shrine"),
        list(location = "Kyoto", activities = "Free time in Kyoto"),
        list(location = "Kyoto", activities = "Kyoto Day Tour, Kinkakuji, Nijo Castle, Arashiyama"),
        list(location = "Niigata", activities = "Tachikawa Weaving Factory"),
        list(location = "Niigata", activities = "Akiko Ike Workshop, Hoshina Studio, Train to Tokyo"),
        list(location = "Yokohama/Tokyo", activities = "Yokohama Quilt Show"),
        list(location = "Tokyo", activities = "Shizuka Kusano Japanese Embroidery Workshop, Farewell Dinner"),
        list(location = "Tokyo", activities = "Tour ends after breakfast")
    )

    # Create individual notes files
    filenames <- character()

    for (i in 1:length(japan_dates)) {
        current_date <- japan_dates[i]
        day_num <- i

        # Format date for filename (MM_DD format)
        date_formatted <- format(current_date, "%m_%d")
        filename <- file.path(output_dir, paste0("notes_11_", date_formatted, ".qmd"))

        # Get day details
        details <- japan_day_details[[i]]

        # Format date for display
        date_display <- format(current_date, "%A, %B %d, %Y")
        date_short <- format(current_date, "%B %d")

        # Create header
        header <- paste0(
            "---\n",
            "title: \"Notes - ", date_short, " (Day ", day_num, ")\"\n",
            "subtitle: \"Japan Trip Personal Notes\"\n",
            "date: \"", current_date, "\"\n",
            "location: \"", details$location, "\"\n",
            "format:\n",
            "  html:\n",
            "    theme: lux\n",
            "    toc: true\n",
            "---\n\n"
        )

        # Create content
        content <- paste0(
            "# Personal Notes - ", date_display, "\n\n",
            "**Day ", day_num, " of 14**  \n",
            "**Location:** ", details$location, "  \n",
            "**Key Activities:** ", details$activities, "\n\n",

            "## Morning Thoughts\n\n",
            "_How am I feeling this morning?_\n\n",
            "\n\n",

            "## Activity Notes\n\n",
            "_Notes from today's experiences:_\n\n",
            "\n\n",

            "## Textile & Art Inspiration\n\n",
            "_Patterns, colors, or designs that caught my eye:_\n\n",
            "\n\n",

            "## Cultural Observations\n\n",
            "_Something new I learned about Japanese culture:_\n\n",
            "\n\n",

            "## Evening Reflection\n\n",
            "### Highlight of the Day\n\n",
            "_What was the best part of today?_\n\n",
            "\n\n",

            "### Overall Day Rating\n\n",
            "_Rate this day (1-10):_ ___\n\n",

            "## Additional Notes\n\n",
            "_Anything else I want to remember about today:_\n\n",
            "\n\n"
        )

        # Combine header and content
        full_content <- paste0(header, content)

        # Write to file
        writeLines(full_content, filename)
        filenames <- c(filenames, filename)
    }

    cat("Japan notes files created:\n")
    cat(paste(filenames, collapse = "\n"), "\n")

    return(filenames)
}

# Main execution function
main_complete_generator <- function() {
    cat("=== Complete Korea & Japan Trip QMD Generator ===\n")
    cat("Creating all .qmd files for both trips...\n\n")

    # Create Korea files
    cat("1. Creating Korea full itinerary QMD file...\n")
    korea_full_file <- create_korea_full_itinerary_qmd(korea_itinerary_data)

    cat("2. Creating Korea daily QMD files...\n")
    korea_daily_files <- create_korea_daily_qmd_files(korea_itinerary_data)

    cat("3. Creating Korea notes QMD files...\n")
    korea_notes_files <- create_korea_notes_qmd_files()

    # Create Japan files
    cat("\n4. Creating Japan full itinerary QMD file...\n")
    japan_full_file <- create_japan_full_itinerary_qmd(japan_itinerary_data)

    cat("5. Creating Japan daily QMD files...\n")
    japan_daily_files <- create_japan_daily_qmd_files(japan_itinerary_data)

    cat("6. Creating Japan notes QMD files...\n")
    japan_notes_files <- create_japan_notes_qmd_files()

    cat("\n=== Generation Complete! ===\n")
    cat("Files created:\n")
    cat("✓ Korea full itinerary:", korea_full_file, "\n")
    cat("✓ Korea daily files:", length(korea_daily_files), "files in daily_itineraries/\n")
    cat("✓ Korea notes files:", length(korea_notes_files), "files in notes/\n")
    cat("✓ Japan full itinerary:", japan_full_file, "\n")
    cat("✓ Japan daily files:", length(japan_daily_files), "files in daily_itineraries/\n")
    cat("✓ Japan notes files:", length(japan_notes_files), "files in notes/\n")
    cat("✓ All files are in .qmd format for Quarto\n\n")

    cat("Total files generated:", 2 + length(korea_daily_files) + length(korea_notes_files) + length(japan_daily_files) + length(japan_notes_files), "\n\n")

    cat("Next steps:\n")
    cat("1. Update your _quarto.yml with the corrected version including Korea dates\n")
    cat("2. Run 'quarto render' to build your website\n")
    cat("3. Check that all links work in the sidebar\n\n")

    return(list(
        korea_full_itinerary = korea_full_file,
        korea_daily_files = korea_daily_files,
        korea_notes_files = korea_notes_files,
        japan_full_itinerary = japan_full_file,
        japan_daily_files = japan_daily_files,
        japan_notes_files = japan_notes_files
    ))
}

# Execute the generator
# Uncomment the line below to run:
result <- main_complete_generator()
