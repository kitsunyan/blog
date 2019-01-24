#!/bin/bash

page_width=800
dpi_scale=2
image_margin=4
count="$1"
size=$(($dpi_scale * ($page_width / $count - $image_margin)))
shift

while original="$1"; shift; do
  name="${original%.*}"
  preview="$name-preview-$count.jpeg"
  convert "$original" -resize "${size}x${size}" -quality 70 "$preview" &&
  exiftool -overwrite_original -all= "$original" "$preview"
done
