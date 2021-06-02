#!/bin/bash

#Associative arrays are created using declare -A name.
declare -A fruits=(
[red]='apple'
[blue]='berry'
[yellow]='lemon'
)

var=yellow
echo ${fruits[$var]}
