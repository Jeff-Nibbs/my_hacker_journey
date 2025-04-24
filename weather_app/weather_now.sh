#!/usr/bin/env bash

my_lat="38.807930"
my_lon="-121.273643"

store_lat="38.788261"
store_lon="-121.206551"

curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$my_lat&lon=$my_lon&appid=$WEATHER_KEY&units=imperial" > hack_stuff/weather_app/cahe_my_weather.txt

curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$store_lat&lon=$store_lon&appid=$WEATHER_KEY&units=imperial" > hack_stuff/weather_app/cahe_store_weather.txt

my_current_temp=$( cat hack_stuff/weather_app/cahe_my_weather.txt | jq ".main.temp" )

my_current_desc=$( cat hack_stuff/weather_app/cahe_my_weather.txt | jq ".weather.[0].description" | tr -d '"' )

my_current_desc=$( cat hack_stuff/weather_app/cahe_my_weather.txt | jq ".weather.[0].description" | tr -d '"' )

store_current_temp=$( cat hack_stuff/weather_app/cahe_store_weather.txt | jq ".main.temp" )

store_current_desc=$( cat hack_stuff/weather_app/cahe_store_weather.txt | jq ".weather.[0].description" | tr -d '"' )

time=$( cat hack_stuff/weather_app/cahe_store_weather.txt | jq ".dt" )

echo " "
echo "$( date -r $time "+| %a %b %d ~ %I:%M %p |" )"
echo " "
echo "Home is $my_current_temp °F and $my_current_desc outside."
echo " "
echo "Work is $store_current_temp °F and $store_current_desc outside."
echo " "





