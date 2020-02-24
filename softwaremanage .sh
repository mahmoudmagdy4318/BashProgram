#!/usr/bin/bash

function displayPkg {
 
	rpm -qa;
}

function displayInfo {

 rpm -qa | less;
}

function listRepos {

 sudo dnf repolist;
}

function installPkg {

echo "enter package you want to install";
read package_name;
if ! rpm -qa |grep -qw $package_name ; then
yum install $package_name
fi

}

function updatePkg {
sudo apt-get update
sudo apt-get -y upgrade

}

function removePkg {
echo "enter package you want to remov"
read package_name

yum remove $package_name

}

while true
 do
 PS3="Enter Choice: ";
 select choice in "Display all installed package" "Display more info for package" "list avaliable repos" "install new package" "update existing  package" "remove package" "Back to main menu"

 do
   case $choice in
	"Display all installed package")
	 clear;
	 displayPkg;

	 break;	
	;;
	"Display more info for package")
	 clear;
	 displayInfo;	

	 break;		
	;;
	"list avaliable repos")
	 clear;
	 listRepos;	

	 break;		
	;;
	"install new package")
	 clear;
	 installPkg;
	
	 break;		
	;;

	"update existing package")
	clear;
	updatePkg;
	break;
	;;


	"remove package")
	clear;
	removePkg;
	break;
	;;

	"Back to main menu")
	 clear;		
	 break 2;


   esac
 done
done




