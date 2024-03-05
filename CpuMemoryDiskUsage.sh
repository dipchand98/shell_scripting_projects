#!/bin/bash


#Author : Dipchand
#version:v1
#A script that monitors system resources (CPU usage, memory, disk space) and generates reports


#creating file with name system_monitor.txt
touch system_monitor.txt
system_monitor="system_monitor.txt"
echo "-----------------System monitor---------------------"


#monitoring system ram information and storing data  inside a system_monitor.txt
monitor_ram=$(free -m | grep 'Mem:' | awk '{print "total memory : " $2 "   used  memory : "$3" free memory" $4}')
echo " ram information : $monitor_ram" >> "$system_monitor"
echo "---------------------------------------------------"

#monitoring system top five process information with cpu usage and and storing data  inside a system_monitor.txt
top_five_process=$(ps -eo pid,%cpu,time --sort=-%cpu | head -n6)
echo "top five process running with high CPU : $top_five_process" >> "$system_monitor"
echo "---------------------------------------------------"

#monitoring system storage information and and storing data  inside a system_monitor.txt
storage_space=$(df -h | grep '/dev/nvme0n1p5' | awk '{print "total memory : "$2 "   Available memory:  "$4  "   used memeory : "$3}')
echo "$storage_space" >> "$system_monitor"



