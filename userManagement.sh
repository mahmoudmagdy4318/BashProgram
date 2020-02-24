#!/usr/bin/bash
function addNewUser {
	
	if [ $(id -u) -eq 0 ]; then
	read -p "Enter username : " username
	read -s -p "Enter password : " password
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		read -p "Are you sure to create this user (y/n): " answer
		if [ $answer == "y" ]; then
			useradd -m -p $pass $username;
		elif [ $answer == "n" ]
		then
			echo "user not added";
			break;
		else
			echo "unexpected answer!";
			break;
			
		fi
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
		
		
	fi
	else
	echo "Only root may add a user to the system"
	fi
}
function listAllUsers {
	echo "Users:";
	awk -F: '{ print $1}' /etc/passwd;
}

function modifyUserSetting {
if [ $(id -u) -eq 0 ]; then
	read -p "username " username;
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -ne 0 ]; then
		echo "$username Not exists!"
	else
 	PS3="Enter Choice: ";
 	select choice in "Change username" "Change userpassword" "change user's home directory" "change user's ID" "Change EXPIRE_DATE" "change group ID"

 	do
   	case $choice in
		"Change username")
	 	clear;
	 	read -p "New name : " newname;
	 	usermod -l "$newname" $username;
		[ $? -eq 0 ] && echo "user's name was modified" || echo "Failed to modify user's name!"

	 	break;	
		;;
		"Change userpassword")
	 	clear;
	 	read -s -p "New password : " newpass;
	 	usermod -p "$newpass" $username;
		[ $? -eq 0 ] && echo "user's password was modified" || echo "Failed to modify user's password!"	

	 	break;		
		;;
		"change user's home directory")
	 	clear;
	 	read  -p "New directory : " newdir;
	 	usermod -m -d "$newdir" $username;	
		[ $? -eq 0 ] && echo "user's home directory was modified" || echo "Failed to modify user's home directory!"

		 break;		
		;;
		"change user's ID")
		 clear;
		 read  -p "New UID : " newID;
		 usermod -u "$newID" $username;
		 [ $? -eq 0 ] && echo "user's ID was modified" || echo "Failed to modify user's ID!"
		 break;		
		;;
		"Change EXPIRE_DATE")
		 clear;
		 echo "Hint 'The date is specified in the format YYYY-MM-DD'"
		 read  -p "New EXPIRE_DATE: " NDate;
		 usermod -e "$NDate" $username;
		 [ $? -eq 0 ] && echo "user's EXPIRE_DATE was modified" || echo "Failed to modify user's EXPIRE_DATE!"
		 break;
		;;
		"change group ID")
		 clear;
		 read  -p "New groupID: " GID;
		 usermod -g "$GID" $username;
		 [ $? -eq 0 ] && echo "user's group ID was modified" || echo "Failed to modify user's group ID!"
	
		 break;	
	


	   esac
	 done
	fi
else
	echo "Only root may modify user's setting"
fi
	

}


function deleteUser {
if [ $(id -u) -eq 0 ]; then
	read -p "username " username;
	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -ne 0 ]; then
		echo "$username Not exists!"
	else
		read -p "Do you want to delete the user's home directory(y/n) " ans;
		if [ $ans == "y" ] 
		then
			userdel -r $username;
			[ $? -eq 0 ] && echo "user & home directory was deleted" || echo "Failed to delete user!"
		elif [ $ans == "n" ]
		then
			userdel $username;
			[ $? -eq 0 ] && echo "user was deleted" || echo "Failed to delete user!"
		else
			echo "unexpected answer"
		fi
	fi
	
else
	echo "Only root may delete user"
fi
	
}

while true
 do
 PS3="Enter Choice: ";
 select choice in "Display all users" "Add new user" "Change User Setting" "Delete user" "Back to main menu"

 do
   case $choice in
	"Display all users")
	 clear;
	 listAllUsers;

	 break;	
	;;
	"Add new user")
	 clear;
	 addNewUser;	

	 break;		
	;;
	"Change User Setting")
	 clear;
	 modifyUserSetting;	

	 break;		
	;;
	"Delete user")
	 clear;
	 deleteUser;
	
	 break;		
	;;
	"Back to main menu")
	 clear;		
	 break 2;


   esac
 done
done


