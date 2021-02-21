#!/bin/sh

echo "\
    Hello $(whoami)!
    This script will parse any URI you'll pass as an input"

read uri

IFS='&'     # space is set as delimiter

read -ra ADDR <<< "$uri"   # str is read into an array as tokens separated by IFS

for i in "${ADDR[@]}"; do   # access each element of array
    echo "$i"
done
