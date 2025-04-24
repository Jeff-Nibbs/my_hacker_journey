#!/usr/bin/env bash

my_lat="38.807930"
my_lon="-121.273643"

store_lat="38.788261"
store_lon="-121.206551"

curl -s "https://api.openweathermap.org/data/2.5/forecast?lat=$my_lat&lon=$my_lon&appid=$WEATHER_KEY&units=imperial" > hack_stuff/weather_app/cahe_forcast.txt

for i in {39..0};
do
  time=$( cat hack_stuff/weather_app/cahe_forcast.txt | jq ".list.[$i | tonumber].dt" )
  temp=$( cat hack_stuff/weather_app/cahe_forcast.txt | jq ".list.[$i | tonumber].main.temp" )
  desc=$( cat hack_stuff/weather_app/cahe_forcast.txt | jq ".list.[$i | tonumber].weather.[0].description" )
  echo " "
  echo "$( date -r $time "+| %a %b %d ~ %I:%M %p |" )"
  echo " "
  echo "      $temp °F"
  echo "      $desc"
  echo " "
done






