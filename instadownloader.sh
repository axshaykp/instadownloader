#!/bin/bash
wget -O pagesource.html -U "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:54.0) Gecko/20100101 Firefox/54.0" --no-check-certificate $1
egrep -o 'https?://instagram.fcok[^"]+' pagesource.html | sed 's.\\u0026.\&.g' | sort -u | sed '/sh0.08.*sh0.08/p;/sh0.08/d' | sed '/s150x150.*s150x150/p;/s150x150/d' > links.txt
cat links.txt | grep jpg? | grep e35 > images.txt
cat links.txt | grep mp4? > videos.txt
for image in `cat images.txt`; do wget -O `date +"%m%d%Y%T%N"`.jpg $image; done
for video in `cat videos.txt`; do wget -O `date +"%m%d%Y%T%N"`.mp4 $video; done
rm pagesource.html links.txt images.txt videos.txt