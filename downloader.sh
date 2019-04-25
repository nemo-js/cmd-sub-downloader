#!/bin/bash

exts="mkv mp4 mpeg avi wmv flv mov"

lang=$1

if [ -z "$lang" ]
then
  lang="en"
fi

echo "Donwloading $lang subtitles"

for filename in *; 
do
  ext="${filename##*.}"

  #check if extention is video
  found=0
  for e in $exts;
  do
    if [ "$e" = "$ext" ]; then
      found=1
    fi 
  done

  if [ $found = "1" ]; then
    srt_file="${filename%.*}.srt"
    if [ ! -f "./$srt_file" ]; then
      echo "download $filename";
      subliminal download -l "$lang" "$filename"
      d_srt_file="${filename%.*}.$lang.srt"
      mv "$d_srt_file" "$srt_file"
    fi
  fi
done
