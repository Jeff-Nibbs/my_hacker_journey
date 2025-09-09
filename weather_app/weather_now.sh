#!/usr/bin/env bash

folder_path="/Users/jnibbs/hack_stuff/weather_app/"

format_date () {
  echo "$( date -r $1 '+| %a %b %d ~ %I:%M %p |' )"  
}

center() {
    local term_width
    term_width=$(tput cols)

    if [ -t 0 ]; then
        # Input from argument
        local value="$1"
        local value_width=${#value}
        local padding=$(( (term_width - value_width) / 2 ))

        if (( padding > 0 )); then
            printf "%*s%s\n" "$padding" "" "$value"
        else
            echo "$value"
        fi
    else
        # Input from pipe (multi-line)
        while IFS= read -r value; do
            local value_width=${#value}
            local padding=$(( (term_width - value_width) / 2 ))

            if (( padding > 0 )); then
                printf "%*s%s\n" "$padding" "" "$value"
            else
                echo "$value"
            fi
        done
    fi
}

check () {
    val="$1"
    length=${#val}
    width=$(( COLUMNS - 10 ))
    if (( length > COLUMNS )); then
        center "Naw dawg this quote too long"
    else
        center "$val"
    fi
}

format_time () {
  echo "$( date -r $1 '+%I:%M %p' )"
}

my_lat="38.807930"
my_lon="-121.273643"

store_lat="38.788261"
store_lon="-121.206551"

quote=$( curl -s "https://api.adviceslip.com/advice" | jq ".slip.advice" )

kanye_quote=$( curl -s "https://api.kanye.rest" | jq ".quote" )

# curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$my_lat&lon=$my_lon&appid=$WEATHER_KEY&units=imperial" > $folder_path/cahe_my_weather.txt

curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$store_lat&lon=$store_lon&exclude=current,minutely,hourly,alerts&appid=$WEATHER_KEY&units=imperial" > $folder_path/cahe_store_weather.txt

curl -s "https://api.openweathermap.org/data/2.5/weather?lat=$my_lat&lon=$my_lon&exclude=current,minutely,hourly,alerts&appid=$WEATHER_KEY&units=imperial" > $folder_path/cahe_my_weather.txt

my_current_temp=$( cat $folder_path/cahe_my_weather.txt | jq ".main.temp" )

my_current_max_temp=$( cat $folder_path/cahe_my_weather.txt | jq ".main.temp_max" )

my_current_desc=$( cat $folder_path/cahe_my_weather.txt | jq ".weather.[0].description" | tr -d '"' )

my_current_desc=$( cat $folder_path/cahe_my_weather.txt | jq ".weather.[0].description" | tr -d '"' )

store_current_temp=$( cat $folder_path/cahe_store_weather.txt | jq ".main.temp" )

store_current_max_temp=$( cat $folder_path/cahe_store_weather.txt | jq ".main.temp_max" )

store_current_desc=$( cat $folder_path/cahe_store_weather.txt | jq ".weather.[0].description" | tr -d '"' )

time=$( cat $folder_path/cahe_store_weather.txt | jq ".dt" )

my_feels_like=$( cat $folder_path/cahe_my_weather.txt | jq ".main.feels_like" )

store_feels_like=$( cat $folder_path/cahe_store_weather.txt | jq ".main.feels_like" )

sunrise=$( cat $folder_path/cahe_my_weather.txt | jq ".sys.sunrise" )

sunset=$( cat $folder_path/cahe_my_weather.txt | jq ".sys.sunset" )

fahrenheit="°F"
am="AM"
pm="PM"

echo " "
figlet WEATHER | center
center "$( format_date $time )"
echo " "
center "Home"
center "Temp: ${my_current_temp}${fahrenheit}"
center "Feels Like: ${my_feels_like}${fahrenheit}"
center "Max Temp: ${my_current_max_temp}${fahrenheit}"
center  "$my_current_desc outside"
echo " "
center "Work"
center "Temp: ${store_current_temp}${fahrenheit}"
center "Feels Like: ${store_feels_like}${fahrenheit}"
center "Max Temp: ${store_current_max_temp}${fahrenheit}"
center "$store_current_desc outside"
echo " "
center "Sunrise: $( format_time $sunrise )"
center "Sunset: $( format_time $sunset )"
echo " "
check "Quote: $quote"
echo " "
echo " "
check "Kanye Quote: $kanye_quote"
echo " "


