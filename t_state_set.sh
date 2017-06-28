#! /bin/bash

#read -p "do you want add 3% margin?[Y/N]" a
#atitool -ppdumptable
#modify pptable.txt
#row=`grep -ni "\[mclk dependency\]" pptable.txt  | awk 'BEGIN{FS=":"} {print $1}'`
#echo $row
#mclk=`awk 'BEGIN{FS=" "} NR=='$row+4'{print $2 }' pptable.txt`
#if [ "$mclk" = "" ]
#then
#mclk=`awk 'BEGIN{FS=" "} NR=='$row+3'{print $2 }' pptable.txt`
#fi
#echo $mclk
#let "mclkplus=$mclk*103/100" 
#echo $mclkplus
#sed -ie 's/'$mclk'/'$mclkplus'/' pptable.txt

#if [ "$a" = "Y" -o "$a" = "y" ]
#then
#atitool -ppmode=perf -ppoverride
#else
#atitool -ppmode=perf
#fi
if [ $1 -eq 1 ]
then
atitool -ppmode=1 -ppoverride
atitool -ppdpmforce=mclk,max
atitool -fancontrol=1
elif [ $1 -eq 2 ]
then
atitool -ppmode=1 -ppoverride
atitool -ppdpmforce=mclk,1
elif [ $1 -eq 3 ]
then
atitool -ppmode=1 -ppoverride
atitool -ppdpmforce=mclk,0
fi

#if [ "$a" = "Y" -o "$a" = "y" ]
#then
#atitool -incmclkpct=3%
#fi

atitool -clkstatus
