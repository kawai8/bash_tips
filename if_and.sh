#!/bin/bash

var1="foo1"
var2="foo2"
var3="foo3"

if [ "$var1" = "foo1" ] \
    && [ "$var2" = "foo2" ] \
    && [ "$var3" = "foo3" ]; then
    result="match"
else
    result="no match"
fi

echo $result
