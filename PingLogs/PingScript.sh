#!/bin/bash
for d in /storage/pxh18ksu/cw2/PingLogs/*; do
    if [ -d "$d" ]; then                            #Only runs on folder names
		cd $d
		name=${PWD##*/}
        echo "$d"                                   #Prints out the name of the current host
        date >> $d/full.log                         #Appends the current datetime to the logfiles
        date >> $d/summary.log
        ping -c 120 $name >> $d/full120.log               #Appends ping results to one file
        tail -3 $d/full120.log >> $d/summary120.log       #Adds summary lines to a separate file
		echo $'\n\n' >> $d/full120.log                 #Adds new lines to each file
        echo $'\n' >> $d/summary.log
		cd ..
    fi
done