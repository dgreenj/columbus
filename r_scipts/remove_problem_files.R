# Delete the problematic .Rmd files
file.remove(list.files("daily_itineraries", pattern = "\\.Rmd$", full.names = TRUE))

# Delete the incorrectly named notes files
file.remove(list.files("notes", pattern = "notes_10_10_|notes_11_11_", full.names = TRUE))

# Re-run the generator with the corrected script
result <- main_complete_generator()
