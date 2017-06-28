#!/bin/bash
echo 'input dpm running time(unit is hour):'
read -a t
rm log.txt log.yml
./menu/7-5 2 1 &
sleep "$t"h
pkill -9 "7-5"
echo completed!!!
sleep 300
da=`date +%m_%d`
t_error_find.sh 1
t_error_find.sh >> log.txt
cp log.txt logs/stutter_$da.log
cp log.yml logs/stutter_$da.yml
pkill -9 "t_Mstatus"
