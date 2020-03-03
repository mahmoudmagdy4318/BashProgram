#!/usr/bin/bash

function listAllRunningServices {
 
 systemctl  list-units --type=service --state=running;
}

function listAllStoppedServices {

 systemctl  list-units --type=service --state=inactive;
}

function listAllFailedServices {

 systemctl  list-units --type=service --state=failed;
}

function displayMoreInfoAboutSpecificService {

 systemctl status sshd

}

function manageSpecificService {
sudo apt-get update
sudo apt-get -y upgrade

}



while true
 do
 PS3="Enter Choice: ";
 select choice in "List All Running Services" "List All Stopped Services" "List All Failed Services" "Display More Info About Specific Service" "Manage Specific Service" "Quit"

 do
   case $choice in
	"List All Running Services")
	 clear;
	 listAllRunningServices;

	 break;	
	;;
	"List All Stopped Services")
	 clear;
	 listAllStoppedServices;	

	 break;		
	;;
	"List All Failed Services")
	 clear;
	 listAllFailedServices;	

	 break;		
	;;
	"Display More Info About Specific Service")
	 clear;
	 displayMoreInfoAboutSpecificService;
	
	 break;		
	;;
	"Manage Specific Service")
	 clear;
	 manageSpecificService;
	
	 break;		
	;;


	"Quit")
	clear;
	break 2;
	;;
   esac
 done
done




