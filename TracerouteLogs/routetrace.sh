#!/bin/bash
#A script to save traceroutes of each host  and save the results
#A folder is created for each host and the script iterates through these
#The folder names must be the same as the addresses being pinged
for d in /storage/pxh18ksu/cw2/TracerouteLogs/*; do
    if [ -d "$d" ]; then                            #Only runs on folder names
        cd $d                                   	#Prints out the name of the current host
		name=${PWD##*/}
        date >> $d/fulltrace.log                    #Appends the current datetime to the logfiles
        traceroute $name >> $d/fulltrace.log        #Appends traceroute to logfile
        echo $'\n' >> $d/fulltrace.log              #Adds spaces to the logfile
		cd ..
    fi
done
