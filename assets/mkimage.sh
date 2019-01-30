#!/bin/bash

page_width=800
dpi_scale=2
image_margin=4

count=1
grep -Pxq '\d+' <<< "$1" && {
  count="$1"
  shift
}
size=$(($dpi_scale * ($page_width / $count - $image_margin)))

imadd=(-resize "${size}x${size}")
grep -Pxq '\d+:\d+:\w+' <<< "$1" && {
  w="${1%%:*}"
  h="${1%:*}"
  h="${h#*:}"
  g="${1##*:}"
  shift
  if [ "$w" -gt "$h" ]; then
    h=$(($size * $h / $w))
    w="$size"
  elif [ "$h" -gt "$w" ]; then
    w=$(($size * $w / $h))
    h="$size"
  fi
  imadd=(-resize "${w}x${h}^" -gravity "$g" -crop "${w}x${h}+0+0")
}

while original="$1"; shift; do
  name="${original%.*}"
  ext="${original##*.}"
  preview="$name-preview-$count.jpeg"
  [ "$ext" = 'png' ] && optipng "$original"
  convert "$original" "${imadd[@]}" -quality 70 "$preview" &&
  exiftool -overwrite_original -all= "$original" "$preview"
done
