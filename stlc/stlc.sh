#!/bin/bash

while true ; do
  read NAME || exit
  ./main $NAME
done
