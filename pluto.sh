#!/bin/sh

# Zapis daty i czasu do pliku
date '+%Y-%m-%d %H:%M:%S' | awk '{ date =$1; time=$2; print "Data i czas: " date " " time}' > /logi/info.log
# Zapis zużycia pamięci do pliku
cat /sys/fs/cgroup/memory/memory.usage_in_bytes  | awk '{ byte =$1 /1024/1024; print "Zuzycie pamieci: " byte " MB" }' >> /logi/info.log
