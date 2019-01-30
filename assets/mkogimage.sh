#!/bin/bash

w=1200
h=630
og='thumbnail.jpeg'
convert "$1" -resize ${w}x${h}\^ -quality 70 "$og" &&
exiftool -overwrite_original -all= "$og"
