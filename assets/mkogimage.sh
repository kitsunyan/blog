#!/bin/bash

w=1200
h=630
convert "$1" -resize ${w}x${h}\^ -quality 70 "$2" &&
exiftool -overwrite_original -all= "$2"
