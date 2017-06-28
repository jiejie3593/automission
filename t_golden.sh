#test prepare
name=`grep 'mtag' /etc/hostname`
da=`date`
echo 'slect test category: [1] for margin, [2] for middle,[3] for low'
read -a tc
if [ $tc -eq 1 ]
then	
P="margin"
t=1
elif [ $tc -eq 2 ]
then
P="middle"
t=2
else
P="low"
t=3
fi
echo 'input temperature enviroment'
read -a te
echo PROCESS BEGIN
echo if training temp reached enter yes
read -a J_T
if [ "$J_T" = "yes" ]
then
rm log.txt edc.log log.yml
t_state_set.sh $t
memt mciodebugindi 0x0 | grep -E '^(0x004|0x005|0x00d)'
fi

# edc error don't clear up
#a=`memt mciodebugindi 0x0 | grep "0x00a" | awk 'BEGIN{FS=","} {print $2}'`
#let "b=$a+0x40"
#b=`printf "%x" $b`
#b=`echo 0x$b`
#echo $b
#memt mciodebugind 0xa $b 

echo if test temp reached and clock is correct enter yes
read -a J_T1
if [ "$J_T1" = "yes" ]
then
date >> logs/report_$te$P$name.log
./menu/7-0 0 1
./menu/4-0 0 1
fi
sleep 60
date >> logs/report_$te$P$name.log
# rename and output report to service
t_error_find.sh 
t_error_find.sh >> logs/report_$te$P$name.log
#cp ./report_$te$P$name.log /software/temp/yjshao/report
cp log.txt logs/$te$P$name.log
cp log.yml logs/$te$P$name.yml
#cp ./$te$P$name.log /software/temp/yjshao/report
cp edc.log logs/edc_$te$P$name.log
#cp ./edc_$te$P$name.log /software/temp/yjshao/report
pkill -9 "t_Mstatus"
echo whole process comleted

