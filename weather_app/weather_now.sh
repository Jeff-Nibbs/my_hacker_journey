#!/usr/bin/env bash

format_date () {
  echo "$( date -r $1 "+| %a %b %d ~ %I:%M %p |" )"  
}

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


sunrise=$( cat hack_stuff/weather_app/cahe_my_weather.txt | jq ".sys.sunrise" )

sunset=$( cat hack_stuff/weather_app/cahe_my_weather.txt | jq ".sys.sunset" )

fahrenheit="°F"
am="AM"
pm="PM"

echo " "
echo "        $( format_date $time )"
echo " "
echo "Home is ${my_current_temp}${fahrenheit} and $my_current_desc outside."
echo " "
echo "Work is ${store_current_temp}${fahrenheit} and $store_current_desc outside."
echo " "
echo "Sunrise:$( format_date $sunrise )"
echo "Sunset: $( format_date $sunset )"
echo " "



