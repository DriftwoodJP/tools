#!/bin/bash

internalHD="/Volumes/WDHD/iTunes Media"
externalHD="/Volumes/LaCieHD1TB/iTunes Media"

cd "${internalHD}"
ls Music/**/*/ > /tmp/internalHD.txt

cd "${externalHD}"
ls Music/**/*/ > /tmp/externalHD.txt

diff -c /tmp/externalHD.txt /tmp/internalHD.txt
