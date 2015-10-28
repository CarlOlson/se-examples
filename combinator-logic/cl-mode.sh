#!/bin/bash

while true ; do
    read NAME || exit

    if [[ ${NAME:0:6} == "--eval" ]]
    then
	cl $NAME
    else
	cl $NAME --spans
    fi
done
