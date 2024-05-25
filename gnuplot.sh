#!/bin/bash

# Get the date for the previous day in YYYY-MM-DD format
yesterday=$(date -d "yesterday" +%Y-%m-%d)

# Construct the filename for the previous day's CSV
input_csv_file="data/${yesterday}.csv"

# Check if the input CSV file exists
if [[ ! -f "$input_csv_file" ]]; then
    echo "Error: File $input_csv_file does not exist."
    exit 1
fi

# Extract the date from the CSV file
date_of_measurement=$(awk -F, 'NR==2 {print $1}' "$input_csv_file")

# Create a temporary gnuplot script
gnuplot_script=$(mktemp)

# Write gnuplot commands to the script
cat <<EOF > "$gnuplot_script"
set datafile separator comma
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'
set output 'plot/${yesterday}.png'

set title "Measurements on $date_of_measurement"
set xlabel "Time"
set xdata time
set timefmt "%H:%M:%S"
set format x "%H:%M"

set yrange [18:25]
set y2range [40:70]

set ytics nomirror
set y2tics
set ylabel "Temperature (°C)"
set y2label "Humidity (%)"

set grid

plot "$input_csv_file" using 2:3 title 'Temperature' with lines axis x1y1, \
     "$input_csv_file" using 2:4 title 'Humidity' with lines axis x1y2
EOF

# Run the gnuplot script
gnuplot "$gnuplot_script"

# Clean up the temporary gnuplot script
rm "$gnuplot_script"

echo "Plot created as ${yesterday}.png"

