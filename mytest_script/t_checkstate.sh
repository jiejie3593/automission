rm state.txt

./atitool -ppmode=1

#check memory state 0 with all sclk state 
./atitool -ppdpmforce=mclk,0
for ((i=0;i<8;i++))
do
./atitool -ppdpmforce=sclk,$i
./atitool -eng -mem
./atitool -vddc -vddci
eng=`./atitool -eng|awk -F':' '{print $2}'`
mem=`./atitool -mem|awk -F':' '{print $2}'`
vddc=`./atitool -vddc|awk -F':' '{print $2}'`
vddci=`./atitool -vddci|awk -F':' '{print $2}'`
echo "State"$i"= Eng" $eng":"$vddc" | Mem" $mem":"$vddci
echo "State"$i"= Eng" $eng":"$vddc" | Mem" $mem":"$vddci >> state.txt
sleep 1
done 

#check memory state 1 with all sclk state
./atitool -ppdpmforce=mclk,1
for ((i=0;i<8;i++))
do
./atitool -ppdpmforce=sclk,$i
./atitool -eng -mem
./atitool -vddc -vddci
eng=`./atitool -eng|awk -F':' '{print $2}'`
mem=`./atitool -mem|awk -F':' '{print $2}'`
vddc=`./atitool -vddc|awk -F':' '{print $2}'`
vddci=`./atitool -vddci|awk -F':' '{print $2}'`
echo "State"$i"= Eng" $eng":"$vddc" | Mem" $mem":"$vddci
echo "State"$i"= Eng" $eng":"$vddc" | Mem" $mem":"$vddci >> state.txt
sleep 1
done

#check memory state 2 with all sclk state
./atitool -ppdpmforce=mclk,2
for ((i=0;i<8;i++))
do
./atitool -ppdpmforce=sclk,$i
./atitool -eng -mem
./atitool -vddc -vddci
eng=`./atitool -eng|awk -F':' '{print $2}'`
mem=`./atitool -mem|awk -F':' '{print $2}'`
vddc=`./atitool -vddc|awk -F':' '{print $2}'`
vddci=`./atitool -vddci|awk -F':' '{print $2}'`
echo "State"$i"= Eng" $eng":"$vddc" | Mem" $mem":"$vddci
echo "State"$i"= Eng" $eng":"$vddc" | Mem" $mem":"$vddci >> state.txt
sleep 1
done
echo >> state.txt
./atitool -sid >> state.txt
echo
echo
echo "Dpm_state_table:"
cat state.txt

