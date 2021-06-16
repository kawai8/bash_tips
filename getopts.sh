#!/bin/bash

flagX=FALSE
flagY=FALSE
varZ=
longopt=FALSE
OPT=
USAGE="Usage: $0 [-xy] [-z value] --longoption"

while getopts xyz:-: OPT
do
    case $OPT in
        x) flagX=TRUE
           ;;
        y) flagY=TRUE
           ;;
        z) varZ=$OPTARG
           ;;
        -) longopt=TRUE
           echo $OPTARG
           ;;
       \?) echo "${USAGE}" 1>&2
           exit 9
           ;;
    esac
done
shift `expr $OPTIND - 1`


echo "[-x] = $flagX"
echo "[-y] = $flagY"
echo "[-z] = $varZ"
echo "[--longoption] = $longopt"
echo "[ $@ ]"


# EX) ./getopts.sh -x -y -z foo
# EX) ./getopts.sh -xy -z foo
# EX) ./getopts.sh -xy  -z foo --longoption 
# EX) ./getopts.sh -xy -z foo other
