#! /bin/bash

x=1
while [[ $x -le 100 ]]
do
    echo "hey $x"
    sleep 1
    (( x++))
done


