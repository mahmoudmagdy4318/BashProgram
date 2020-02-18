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
	
	 break;		
	;;
	"User Management")
	 clear;
	
	 break;		
	;;
	"Software Management")
	 clear;
	
	 break;		
	;;
	"Network Management")
	 clear;
	
	 break;		
	;;
	"Sequrity")
	 clear;
	
	 break;		
	;;
	"Quit")
	 clear;
	
	 break 2;		
	;;

   esac
 done
done




















