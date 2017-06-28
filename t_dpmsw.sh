#!/bin/bash
echo 'input dpm running time(unit is hour):'
read -a t
rm log.txt log.yml
# edc error don't clear up
a=`memt mciodebugindi 0x0 | grep "0x00a" | awk 'BEGIN{FS=","} {print $2}'`
let "b=$a+0x40"
b=`printf "%x" $b`
b=`echo 0x$b`
echo $b
memt mciodebugind 0xa $b 

./menu/10-1 2 1 &
sleep "$t"h
pkill -9 "10-1"
echo completed!!!
sleep 300
t_error_find.sh 
da=`date +%m_%d`
t_error_find.sh >> log.txt
cp log.txt logs/dpm_$da.log
cp log.yml logs/dpm_$da.yml
pkill -9   "t_Mstatus"
