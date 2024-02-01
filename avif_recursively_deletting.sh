#!/bin/bash

MAGICK_MEMORY_LIMIT=35GB
MAGICK_MAP_LIMIT=35GB
MAGICK_THREAD_LIMIT=20

# Run the script recursively for all files in the current folder and its subfolders
find . -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" -o -iname "*.bmp" \) | while IFS= read -r file; do
    # Create the output folder if it doesn't exist
    output_folder="$(dirname "$file")/avif"
    mkdir -p "$output_folder"

    # Convert and save the AVIF file in the corresponding subfolder
    magick convert "$file" -define avif:lossless=true "$output_folder/$(basename "$file" | sed 's/\.[^.]*$//').avif"

    # Check if the magick command was successful
    if [ $? -eq 0 ]; then
        echo "Converted: $file to $output_folder/$(basename "$file" | sed 's/\.[^.]*$//').avif"
        rm "$file"
    else
        echo "Conversion failed for: $file"
    fi
done
