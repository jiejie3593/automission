#/bin/bash
clear
echo "##########################################################"
echo -e "\033[31m please cd your pwd to corresponding diag directory first \033[0m"
echo "            1 <memory.stf and gfx.sft test>"
echo "            2 <dpm test> "
echo "            3 <stutter mode test>"
echo "            4 <dpm state set>"
echo "            5 <remove all log>"
echo "            6 <flash vbiso>"
echo "            7 <Begin EDC error and Traning fail Recorder>"
echo "            8 <Check clk state and voltage>"
echo "            9 <Log ASIC temperature>"
echo "###########################################################"
if [ ! -d "logs" ]
then
mkdir logs
echo 'direction [logs] has been created'
fi

read -p "please input 1-9:  " a
echo
echo
echo
case  $a in
	1) 
		t_golden.sh;;
	2) 
		t_dpmsw.sh;;
	3) 
		t_stutter.sh;;
	4)
	         read -p "which state do you want to set; [1] for high state, [2] for middle state, [3] for low state:  " s	
		t_state_set.sh $s;;
	5) 
		t_rm_log.sh;;
        6)
		echo 'please make sure target vbios has been put into "/shareAll/yjshao/Linux_attach/BIOS/current/"  exclusively'	
                t_bios_flash.sh;;
        7)
                t_Mstatus_record.sh &
                echo "record begin";;
	8)
		t_checkstate.sh;;
	9)
		t_temp_read.py &;;
		
	*) 
		echo "input vaule invaild, please input 1-6";;
esac

