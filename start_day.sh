#!/usr/bin/env bash

for x in $(cat hack_stuff/text_files/hacker_websites.txt)
do
    open -a "google chrome" $x
done


