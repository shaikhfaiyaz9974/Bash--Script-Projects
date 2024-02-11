#!/bin/bash

############ Project -01 ##############

<< Comment
This Bash script serves as a versatile tool for user management and backup tasks, 
enhancing system administration efficiency. With a user-friendly menu interface, 
it offers options to create new users with customized passwords, delete existing users, 
add users to specific groups, and create backups of designated directories.
Comment

echo "Choose Below Option to Perform the Task"
echo
echo " 1 - for Create New User and Set password"
echo
echo " 2 - for Delete The User"
echo
echo " 3 - Add a user to a group"
echo
echo " 4 - Create Backup for Specific Directory"
echo 

read -p "Enter your Choise Here: " choice

case $choice in
	1)
		read -p "Enter The User name: " name
		sudo useradd $name
		sudo passwd $name
		echo "$name Successfully Created"
		;;
	2)
		read -p "Enter The User name: " delusr
		sudo userdel $delusr
		echo "$delusr removed"
		;;
	4)
		read -p "Enter The new file name: " new
		file=$(date +"%Y-%m-%d_%H-%M-%S").tar.gz
		newfile=($new$file)
		read -p "Enter the Souce Backupfile path: " souce
		read -p "Enter The Destination Path of Backupfile: " des
		tar -czf "$des/$newfile" $souce
		echo "Backup Successfully created"
		;;
	3)
		read -p "Enter the User name: " username
		read -p "Enter Group Name: " group
		sudo usermod -aG $group $username
		echo "$username Successfully Added to $group"
		;;

esac
