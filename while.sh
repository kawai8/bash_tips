#!/bin/bash

while IFS=, read val1 val2 val3
do
  echo "${val1} | ${val2} | ${val3}"
done << EOF
aaa,bbb,ccc
ddd,eee,fff
ggg,hhh,iii
EOF
