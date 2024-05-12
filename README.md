# 19tka

Script measure_temp_hum.sh save humidity and temperature values to file csv on daily basis
The file structure is like below     
```
date,time,temperature,humidity
2024-05-13,00:01:35,25.600000381469727,22.100000381469727
2024-05-13,00:13:01,25.399999618530273,21.899999618530273
```

The file is triggered by cron with comands like below
```
* * * * * cd /home/buddy/github && ./measure_temp_hum.sh
*/10 * * * * cd /home/buddy/github && git add 2024* && git commit -m "update measurments" && git push >/dev/null 2>&1
```

Not very smart but working good enough :)
