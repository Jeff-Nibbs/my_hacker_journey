#!/usr/bin/env bash

quote=$( curl -s 'https://api.adviceslip.com/advice' | jq '.slip.advice' )


echo " "
echo $quote | fmt -c -w 69
echo " "



