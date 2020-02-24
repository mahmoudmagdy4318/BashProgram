#!/usr/bin/bash


function listInterfaces {
	ls /sys/class/net   
}

function showInterfaceInfo {
	read -p "interface name: " interface;
	 ip address show dev $interface; 
}

function modifyNetwork {  
	mapfile -t Networks < <( nmcli connection show | awk -F " " '{if(NR >1){print $1}}');
		size=${#Networks[@]}
		select option in ${Networks[@]}
		do
			if [ 1 -le "$REPLY" ] && [ "$REPLY" -le $((size)) ];
			then
				path="/etc/sysconfig/network-scripts/ifcfg-$option"
				select j in "Automatic Network Configuration" "Manual Config" "Exit"
				do
				case $j in
				"Automatic Network Configuration")
					sudo sed -i 's/BOOTPROTO=manual/BOOTPROTO=dhcp/g' "$path"
					echo "Restarting Network... "
					#systemctl restart network
				;;
				"Manual Config")
					sed -i 's/BOOTPROTO=dhcp/BOOTPROTO=manual/g' "$path"
					echo "Enter your Selected Network Interface IP "
					read ip
					echo "Enter your netmask"
					read netmask
					echo "Enter your Default gateway"
					read gateway
					echo "Enter your DNS1"
					read dns1
					echo "Enter your DNS2"
					read dns2
					sudo ifconfig "$option" "$ip" netmask "$netmask"
					sudo route add default gw "$gateway" "$option"
					echo "nameserver	$dns1" > /etc/resolve.conf
					echo "nameserver	$dns2" >> /etc/resolve.conf
					echo "Restarting The Network..."
				;;
				"Exit")
					break;
				;;
				*)
					echo "Invalid $REPLY isn't An Option"
				;;
				esac
				done
			else
				echo "Incorrect answer:Select a number 1 to $size"
			fi
		done
}



while true
 do
 PS3="Enter Choice: ";
 select choice in "list Network interfaces name" "Display info for an interface" "Modify network settings" "Back to main menu"

 do
   case $choice in
	"list Network interfaces name")
	 clear;
	 listInterfaces;

	 break;	
	;;
	"Display info for an interface")
	 clear;
	 showInterfaceInfo;	

	 break;		
	;;
	"Modify network settings")
	 clear;
	 modifyNetwork;	

	 break;		
	;;
	
	"Back to main menu")
	 clear;		
	 break 2;


   esac
 done
done