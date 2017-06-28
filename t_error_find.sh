#!/bin/bash
#if [ $1 -eq 1 ]
#then
echo -e "Failed log:\n`grep -n "] Fail" log.txt`"
echo -e "Skipped log:\n`grep -n "] Skip" log.txt`"
echo "Passed counter:`grep -n "] Pass" log.txt|wc -l`"
echo "Failed counter:`grep -n "] Fail" log.txt|wc -l`"
echo "Skipped counter:`grep -n "] Skip" log.txt|wc -l`"
#else
echo "EDC error log:`egrep -n "Error = [1-9^]" edc.log`"
echo "EDC no error counter:`grep -n "Error = 0" edc.log|wc -l`"
echo "EDC error counter:`grep -n "Error = [1-9^]" edc.log|wc -l`"
echo "Errors: `grep -n "<error>" log.txt`"
echo `grep -n "CRC" log.txt`
memt mciodebugindi 0x0
memt edcerrcnt9
#fi 
