#!/bin/bash

#Imaginary Landscape Nº5
#John Cage

#joaoseckler@gmail.com


SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"


echo "Files backup..."
cp -v ${SCRIPT_DIR}/files/* ${SCRIPT_DIR}/backup/

find ${SCRIPT_DIR}/files/ -iname "*.mp3" -exec sox -V3 {} {}.converted.wav channels 2 \;

rm ${SCRIPT_DIR}/files/*.mp3

find ${SCRIPT_DIR}/files/ -iname "*.flac" -exec sox -V3 {} {}.converted.wav channels 2 \;

rm ${SCRIPT_DIR}/files/*.flac

for name in ${SCRIPT_DIR}/files/*; do
    if soxi -c "$name" | grep 1
    then sox "$name" "$name" channels 2
    fi
done



sclang ${SCRIPT_DIR}/imaginary.scd

kill  $(ps -e | grep jackd | cut -c1-5)
