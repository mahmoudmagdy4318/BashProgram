#!/usr/bin/bash


function displayProcesses {
	read -p "username: " user;
	if [ "$(grep -c $user /etc/passwd)" -eq 1 ]
	then
	ps -u $user;
	else 
	echo "user not found try again..";
	fi
}

function displayProcessDetails {
	read -p "process name: " process;
	if [ -z "$(pgrep $process)" ]
	then 
	echo "process not found!";
	else
	ps -p $(pgrep $process);
	fi
}


function killProcess {
	read -p "PID: " ID;
	read -p "SIGNAL: " signal;
	kill $signal $ID;
	clear;	
}


function changePeriority {
	read -p "PID: " ID;
	read -p "Required nice value: " niceNum;
	renice $niceNum -p $ID;
}

while true
 do
 PS3="Enter Choice: ";
 select choice in "Display all user processes" "Display process details" "Kill process" "change periority" "Back to main menu"

 do
   case $choice in
	"Display all user processes")
	 clear;
	 displayProcesses;

	 break;	
	;;
	"Display process details")
	 clear;
	 displayProcessDetails;	

	 break;		
	;;
	"Kill process")
	 clear;
	 killProcess;	

	 break;		
	;;
	"change periority")
	 clear;
	 changePeriority;
	
	 break;		
	;;
	"Back to main menu")
	 clear;		
	 break 2;


   esac
 done
done


