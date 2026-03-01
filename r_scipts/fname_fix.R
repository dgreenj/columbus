# Get current filenames
old_files <- list.files("notes", pattern = "notes_10_10_", full.names = TRUE)
# Create new filenames (remove the extra "10_")
new_files <- gsub("notes_10_10_", "notes_10_", old_files)
# Rename them
file.rename(old_files, new_files)

# Do the same for Japan files
old_files_japan <- list.files("notes", pattern = "notes_11_11_", full.names = TRUE)
new_files_japan <- gsub("notes_11_11_", "notes_11_", old_files_japan)
file.rename(old_files_japan, new_files_japan)
