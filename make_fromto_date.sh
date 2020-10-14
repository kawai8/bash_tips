#!/bin/bash
########################################################
# Script name : make_fromto_date.sh
# Usage : ./make_fromto_date.sh <From(yyyymmdd)> <To(yyyymmdd)>
# author ： kawai8
# Discription:
#
# history
# 2020/10/10 create prototype
#
########################################################

##----------------------------------
## Default settings
##----------------------------------
numArg=$#
fromDate=$1
toDate=$2
errorExitCode=99
datePattern='^([0-9]{4})-([0-9]{1,2})-([0-9]{1,2})$'
usageMsg="Usage: ./$0 [FROM(yyyy-mm-dd)] [TO(yyyy-mm-dd)]"


##----------------------------------
## Functions
##----------------------------------
usage(){
    printf "\n  ${usageMsg}\n\n"
    #return $errorExitCode
    exit ${errorExitCode}
}

input_validation(){
  if [ -z "${fromDate}" -o -z "${toDate}" ]; then usage; fi
  if [ ${numArg} -ne 2 ]; then usage; fi 

  if [[ ! ${fromDate} =~ ${datePattern} ]]; then usage; fi
  check_calendar ${fromDate}
  fromDate="${strDate}"

  if [[ ! ${toDate} =~ ${datePattern} ]]; then usage; fi
  check_calendar ${toDate}
  toDate="${strDate}"

  check_span ${fromDate} ${toDate}
}

check_calendar(){
  MM=`printf %02d ${BASH_REMATCH[2]}`
  DD=`printf %02d ${BASH_REMATCH[3]}`
  strDate="${BASH_REMATCH[1]}${MM}${DD}"
  chkDate=`date '+%Y%m%d' -d "${strDate}" 2>/dev/null`

  if [ ! "{$strDate}" = "{$chkDate}" ];then
    printf "\n  ERROR: Invalid date specified. >>> [${1}]"
    usage
  fi
}

check_span(){
  unixtimeFrom=`date '+%s' -d "$1"`
  unixtimeTo=`date '+%s' -d "${toDate}"`
  if [ ! ${unixtimeFrom} -le ${unixtimeTo} ]; then
    printf "\n  ERROR: Invalid span specified. >>> [From:${fromDate}] To:[${toDate}]"
    usage
  fi
  sec=`expr "$unixtimeTo" - "$unixtimeFrom"`
  span=`expr $sec / 86400 + 1 `
}

makeArray(){
  startDate=`date -d "${fromDate}" '+%Y%m%d'`
  x=0
  while [ $x -lt "${span}" ]
  do
    currentDate=`date -d "${startDate} ${x} days" '+%Y%m%d'`
    x=`expr $x + 1`
    echo ${currentDate}
  done
}



##----------------------------------
## Pre
##----------------------------------
input_validation


##----------------------------------
## Main
##----------------------------------
getArrayDate(){
  arrayDate=(`makeArray`)
}

#for i in "${arrayDate[@]}"
#do
#   echo $i
#done

