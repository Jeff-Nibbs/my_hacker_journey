#!/usr/bin/env bash

curl -s "http://api.marketstack.com/v1/eod/latest?access_key=$STOCKS&symbols=$1" > hack_stuff/stocks/temp_stock_data.txt

 
