#!/bin/bash

var=$1

if [ "$var" = "a" ] \
    || [ "$var" = "b" ] \
    || [ "$var" = "c" ] \
    || [ "$var" = "d" ] \
    || [ "$var" = "e" ] \
    || [ "$var" = "f" ] \
    || [ "$var" = "g" ]; then
    result="match"
else
    result="no match"
fi

echo $result
