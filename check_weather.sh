#! /usr/bin/env bash

temp=".main.temp"
description=".weather.[0].description"
curl -s "https://api.openweathermap.org/data/2.5/weather?lat=38.807930&lon=-121.273643&appid=e4ff88b7b1eaec71ccd662985f2f3a74&units=imperial" | jq $temp,$description




