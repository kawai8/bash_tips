#!/bin/sh

# call make_formto_date.sh
. ./make_fromto_date.sh

# get date Array
getArrayDate $@


# print 
for i in "${arrayDate[@]}"
do
   echo $i
   # write your job here
done


