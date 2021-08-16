#!/bin/bash
wget -O pagesource.html -U "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0" --no-check-certificate $1
egrep -o 'https?://[^"]+' pagesource.html | sed 's.\\u0026.\&.g' | sort -u | grep jpg? | grep e35 | grep 1080x1080> images.txt
egrep -o 'https?://[^"]+' pagesource.html | grep "mp4" | sed 's.\\u0026.\&.g' | sort -u > videos.txt
for image in `cat images.txt`; do wget -O `date +"%m%d%Y%T%N"`.jpg $image; done
for video in `cat videos.txt`; do wget -O `date +"%m%d%Y%T%N"`.mp4 $video; done
rm pagesource.html images.txt videos.txt
