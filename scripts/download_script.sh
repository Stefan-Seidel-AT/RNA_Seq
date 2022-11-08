#!/bin/bash

# this script is for downloading files from en external source provided by another file
# and saveing it to the ../raw_data directory

input=$1

echo "$input"

while IFS= read -r line
do
   ## take some action on $line
  echo "$line"
done < "$input"

###### script for renaming file

