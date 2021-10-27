#!/bin/bash

var1="foo1"
var2="foo2"
var3="foo3"

# method 1
# use && operator
# Expressions may be combined using "&&" operators
# expression1 && expression2
# True if both expression1 and expression2 are true.

if [ "$var1" = "foo1" ] \
    && [ "$var2" = "foo2" ] \
    && [ "$var3" = "foo3" ]; then
    result="match"
else
    result="no match"
fi
echo $result


# method 2
# use test command option
# expression1 -a expression2
# both EXPRESSION1 and EXPRESSION2 are true

if [ "$var1" = "foo1" -a "$var2" = "foo2" ]; then
    echo "here"
fi
