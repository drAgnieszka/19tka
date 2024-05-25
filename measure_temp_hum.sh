#!/bin/bash

# set variables
# day for filename 
current_day=$(date +"%Y-%m-%d")

# date for measurment
current_time=$(date +"%H:%M:%S")

# set pin phere dht is set
DHT_PIN=4

# Read the temperature and humidity from the DHT22 sensor
#data=$(sudo /usr/bin/python3 -c "import Adafruit_DHT; print(Adafruit_DHT.read_retry(Adafruit_DHT.DHT22, $DHT_PIN))")
data=$(sudo /usr/bin/python3 -c "import Adafruit_DHT; print(Adafruit_DHT.read_retry(Adafruit_DHT.AM2302, $DHT_PIN))")

#echo "data: $data"

hum=$(echo "$data" | sed 's/.*(\([^,]*\),.*/\1/')
temp=$(echo "$data" | sed 's/.*, \(.*\))/\1/')

# Print the extracted values
#echo "Temperature: $temp"
#echo "Humidity: $hum"

# check if file exist and create it if not
if [ ! -f "data/$current_day.csv" ]; then
	touch "data/$current_day.csv"
	echo "date,time,temperature,humidity" >> "data/$current_day.csv"
fi

echo "$current_day,$current_time,$temp,$hum" >> "data/$current_day.csv"
