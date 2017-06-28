#!/bin/bash
da=`date +%y_%d_%k_%M`
while ((1))
do
echo `date +%m_%d_%k:%M` >> logs/error_$da.log
atitool -temp  >> logs/error_$da.log
memt mciodebugindi 0x0 | egrep "^(0x004|0x005|0x00d)" >> logs/error_$da.log
memt edcerrcnt9 >> logs/error_$da.log
sleep 300
done
