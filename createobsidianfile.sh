#!/bin/bash

filename=$1

if [[ -e "$filename.md" || -L "$filename.md" ]] ; then
    i=0
    while [[ -e "$filename-$i.md" || -L "$filename-$i.md" ]] ; do
        let i++
    done
    filename="$filename-$i"
fi


think=$2
research=$3
citations=$4
cat >> "$filename.md" <<EOF
# Thinking

$think

# Research

$research

# citations

$citations

EOF
echo "$filename written"⏎