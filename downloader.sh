#!/bin/bash

lang="el"
exts=(mkv mp4 mpeg avi)

for filename in *; do
  ext="${filename##*.}"
  if [[ "$ext" == "mkv" ]]
  then
    srt_file="${filename%.*}.srt"
    if [ ! -f "./$srt_file" ]; then
      subliminal download -l "$lang" "$filename"
      d_srt_file="${filename%.*}.$lang.srt"
      mv "$d_srt_file" "$srt_file"
    fi
  fi
done