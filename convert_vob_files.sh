#!/bin/bash

# Get current working directory
input_dir=$(pwd)
output_dir="$input_dir/Converted"
counter=0
# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through all .VOB or .vob files
for file in "$input_dir"/*.VOB "$input_dir"/*.vob; do
  # Check if file exists (avoid literal match if no .vob found)
  [ -e "$file" ] || continue

  name="IMG_${counter}"

  # Define output file path
  output_file="$output_dir/${name}.mp4"

  echo "Converting $file to $output_file ..."
  ffmpeg -i "$file" -c:v libx264 -preset slow -crf 22 -c:a aac -b:a 192k "$output_file"
  
  ((counter++))
done


echo "Conversion complete. Files saved in: $output_dir"

