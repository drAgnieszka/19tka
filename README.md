# 19tka
Script description

### measure_temp_hum.sh

Script save humidity and temperature values to file csv located in data folder on daily basis - controled by cron (more detail on cron paragraph)
The file structure is like below     
```
date,time,temperature,humidity
2024-05-13,00:01:35,25.600000381469727,22.100000381469727
2024-05-13,00:13:01,25.399999618530273,21.899999618530273
```

### update_cron.sh
Script is updateing cron jobs according to settings provided in cronjobs.txt file

### gnuplot.sh
Script generate plot in png format stored in folder plot from data from day before. It is triggered once after midnight

### crontab
Crontab is set in cronjobs.txt file that is updated each 10 minutes

### requirements
#### wiring pi
```bash
git clone https://github.com/WiringPi/WiringPi.git
cd WiringPi/
./build
sudo ./build install
```
#### gnuplot
```bash
sudo apt install gnuplot
```

Not very smart but working good enough :)
