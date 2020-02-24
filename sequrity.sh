#!/usr/bin/bash

function displayMode {
 
	getenforce ;
}

function changeModeTemp {

 setenforce 0 ;
}



function displayFirewallStatues {

	sudo iptables -L -n;
}

function enableFirewall {
	
	sudo ufw enable;
	
}

function disableFirewall {

	sudo ufw disable;
}


function addService {
	
echo "enter name of service";
read service;


echo "enter description";
read desc;


firewall-cmd --permanent --service=$service --set-description=$desc;


echo "enter port numbr";
read portNum;

firewall-cmd --permanent --service=$service --add-port=$portNum;

echo "enter your protocol";
read protocol;

firewall-cmd --permanent --service=$service --add-protocol=$protocol;

echo "enter source port number";
read sourcePortNum;

firewall-cmd --permanent --service=$service --add-source-port=$sourcePortNum;

echo "enter module";
read module;

firewall-cmd --permanent --service=$service --add-module=$module;

}

function addPort {


echo "enter port number you want to add";
read port;


firewall-cmd --permanent --add-port=$port;
}









while true
 do
 PS3="Enter Choice: ";
 select choice in "selinux mode setting" "change mode temporary" "change mode permenant" "firewalld status" "enable firewall" "disable firewall" "add services into firewall" "add port into firewall" "Back to main menu"

 do
   case $choice in
	"selinux mode setting")
	 clear;
	 displayMode;
	

	 break;	
	;;
	"change mode temporary")
	 clear;
	 changeModeTemp;	

	 break;		
	;;
	"change mode permenant")
	 clear;
	 changeModePrem;	

	 break;		
	;;
	"firewalld status")
	 clear;
	 displayFirewallStatues;
	
	 break;		
	;;

	"enable firewall")
	clear;
	enableFirewall;
	break;
	;;


	"disable firewall")
	clear;
	disableFirewall;
	break;
	;;

	"add services into firewall")
	clear;
	addService;
	break;
	;;

	"add port into firewall")
	clear;
	addPort;
	break;
	;;


	"Back to main menu")
	 clear;		
	 break 2;


   esac
 done
done




