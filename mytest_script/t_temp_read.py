#!/usr/bin/python
import time
import os
import subprocess
print 'temperature record begin'
time.sleep(5)
while 1:
 a={"date":"1","temp":"2"}
 a["date"]=subprocess.check_output("date +%m_%d_%H:%M",shell=True)
 a["temp"]=subprocess.check_output("atitool -temp|awk 'NR==3{print $4}' ",shell=True)
 b=a["date"].strip('\n')+'  '+a["temp"]
 #print b
 f=open("temp.txt","a")
 f.write(b)
 #os.system("atitool -temp")
 time.sleep(3)
 f.close()

