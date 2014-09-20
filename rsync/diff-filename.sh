#!/bin/bash

internalHD="$HOME/Music/iTunes/iTunes Media"
externalHD="/Volumes/LaCieHD1TB/Music/iTunes/iTunes Media"

cd "${internalHD}"
ls Music/**/*/ > /tmp/internalHD.txt

cd "${externalHD}"
ls Music/**/*/ > /tmp/externalHD.txt

diff -c /tmp/internalHD.txt /tmp/externalHD.txt
