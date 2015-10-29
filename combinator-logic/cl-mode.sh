#!/bin/bash

while true ; do
    read NAME || exit

    if [[ ${NAME:0:6} == "--eval" ]]
    then
	clrb $NAME
    else
	clrb $NAME --spans
    fi
done
