#!/usr/bin/env bash

for x in $(cat /Users/jnibbs/hack_stuff/text_files/hacker_websites.txt)
do
    open -a "google chrome" $x
done


