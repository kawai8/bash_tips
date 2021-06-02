#!/bin/bash

ITEMS=()
ITEMS_A=(
"apple","100","15"
"pine apple","200","5" #<-word including space charactor
"orange","150","10"
)
ITEMS_B=(
"blueberry","50","100"
"strawberry","300","8"
)

ITEMS=("${ITEMS_A[@]}")
#ITEMS=("${ITEMS_B[@]}")

IFS_ORG=$IFS
IFS=,
for i in "${ITEMS[@]}"
do
    item=(${i[@]})
    col1=${item[0]}
    col2=${item[1]}
    col3=${item[2]}
    echo "${col1} \\${col2} stock:${col3}"
done
IFS=$IFS_ORG
