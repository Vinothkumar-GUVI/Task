#!/bin/bash

# Store the file contents in an array, starting from the 5th line
mapfile -t lines < <(tail -n +5 file.txt)

# Iterate over the lines
for ((i=0; i<${#lines[@]}; i++)); do
  # Check if the line contains the word "welcome"
  if [[ ${lines[i]} == *welcome* ]]; then
    # Replace all occurrences of "give" with "learning"
    lines[i]=${lines[i]//give/learning}
  fi
done

# Print the modified lines to the console
printf "%s\n" "${lines[@]}"

# To write the changes back to the file, uncomment the next line
# printf "%s\n" "${lines[@]}" > file.txt