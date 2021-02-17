#!/bin/sh

if [ $(hostname) = 'garudadell' ]; then
    echo "It's garudadell!"
else
    echo "Not in garudadell :("
    echo $(hostname)
fi
