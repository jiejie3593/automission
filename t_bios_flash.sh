#!/bin/bash
echo 'the bios name is:'`ls /shareAll/yjshao/Linux_attach/BIOS/current/`
echo 'vbios reflashed in 10 sec, ctrl\+c to cancel'
sleep 10
atiflash -p -f 0 /shareAll/yjshao/Linux_attach/BIOS/current/*
sleep 10
reboot
