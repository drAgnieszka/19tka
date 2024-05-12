#!/bin/bash

# set variables
# day for filename 
current_day=$(date +"%Y-%m-%d")

# date for measurment
current_time=$(date +"%H:%M:%S")

# set pin phere dht is set
DHT_PIN=4

# Read the temperature and humidity from the DHT22 sensor
data=$(sudo /usr/bin/python3 -c "import Adafruit_DHT; print(Adafruit_DHT.read_retry(Adafruit_DHT.DHT22, $DHT_PIN))")

#echo "data: $data"

temp=$(echo "$data" | sed 's/.*(\([^,]*\),.*/\1/')
hum=$(echo "$data" | sed 's/.*, \(.*\))/\1/')

# Print the extracted values
#echo "Temperature: $temp"
#echo "Humidity: $hum"

# check if file exist and create it if not
if [ ! -f "$current_day.csv" ]; then
	touch "$current_day.csv"
	echo "date,time,temperature,humidity" >> "$current_day.csv"
fi

echo "$current_day,$current_time,$temp,$hum" >> "$current_day.csv"
