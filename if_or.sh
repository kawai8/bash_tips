#!/bin/bash

var=$1

# method 1
# use || operator
# Expressions may be combined using "||" operators
# expression1 && expression2
# True if either expression1 or expression2 is true.

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


# method 2
# use test command option
# expression1 -o expression2
# either EXPRESSION1 or EXPRESSION2 is true

if [ "$var1" = "foo1" -o "$var2" = "foo2" ]; then
    echo "here"
fi


# Example
if ([ "${var1}" = "foo" ] && [ "${var2}" = "1" ]) \
  || ([ "${var1}" = "foo" ] && [ "${var2}" = "2" ]); then
    echo "here" 
fi

if [ "${var1}" = "foo" -a "${var2}" = "1" ] || [ "${var1}" = "foo" -o "${var2}" = "2" ]; then
    echo "here"
fi
