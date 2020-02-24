#!/bin/bash
echo *****welcome to our System Admin Program*****
clear;
while true
 do
 PS3="Enter Choice: ";
 select choice in "Process Management" "Service Management" "User Management" "Software Management" "Network Management" "Sequrity" "Quit"

 do
   case $choice in
	"Process Management")
	 clear;
	 . ProcessManagement.sh	

	 break;	
	;;
	"Service Management")
	 clear;
	 . ServiceManagement.sh
	 break;		
	;;
	"User Management")
	 clear;
	 . userManagement.sh 
	 break;		
	;;
	"Software Management")
	 clear;
	 ./softwaremanage.sh 
	 break;		
	;;
	"Network Management")
	 clear;
	 . network.sh			
	 break;		
	;;
	"Sequrity")
	 clear;
	 . sequrity.sh
	 break;		
	;;
	"Quit")
	 clear;
	
	 break 2;		
	;;

   esac
 done
done




















