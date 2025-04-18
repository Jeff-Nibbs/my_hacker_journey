#!/usr/bin/env bash

me=$(ifconfig en0 | grep 'inet ' | cut -d ' ' -f 2 | cut -c 1-9)


for ip in `seq 1 254`; do
ping -c 1 $me.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
