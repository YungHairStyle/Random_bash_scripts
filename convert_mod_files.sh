#!/bin/bash

# Directory containing .mod files from the command line argument
input_dir=$(pwd)
output_dir="$input_dir/Converted"

# Create the output directory if it doesn't exist
#mkdir -p "$output_dir"

counter=1

# Loop through all .mod files in the input directory
for file in "$input_dir"/*.MOD; do
  # Check if there are .mod files to process
  if [ ! -f "$file" ]; then
    echo "No .mod files found in $input_dir"
    exit 1
  fi

  # Define the output file path (e.g., converting to .mp4)
  output_file="$output_dir/IMG_${counter}.mp4"

  # Run the ffmpeg command to convert the file
  ffmpeg -i "$file" "$output_file" -loglevel error
  echo "Converted $file to $output_file"

  ((counter++))
done
