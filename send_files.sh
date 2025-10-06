#!/bin/bash

# Check if input directory is provided
if [ -z "$1" ]; then
  echo "Please provide the directory containing files to transfer as an argument."
  exit 1
fi

# Directory containing files to transfer
input_dir="/Users/asaad/Documents/pics/$1"

# Remote server details
remote_user="asaad"
remote_host="10.0.0.30"
remote_path="/home/media/$1"  # Change this to your preferred destination path on the remote server

# Loop through all files in the input directory and send them via scp
for file in "$input_dir"/*; do
  # Check if there are files to transfer
  if [ ! -f "$file" ]; then
    echo "No files found in $input_dir"
    exit 1
  fi

  # Transfer the file
  scp "$file" "$remote_user@$remote_host:$remote_path"

  echo "Transferred $file to $remote_user@$remote_host:$remote_path"
done

