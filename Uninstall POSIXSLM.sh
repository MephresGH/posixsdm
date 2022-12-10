#!/bin/sh

### POSIX Shell Login Manager Uninstall Script
### Licensed Under: GNU General Public License v3.0
### Published & Written By Mephres

## POSIX script uninstaller & cleanup

alias deltxt=sh ~/.posixslm

uninstall()
{
find ~/xinitrc && rm ~/xinitrc || printf "Local xinitrc not found.\n"
find ~/.posixslm && rm ~/.posixslm || printf "Local .posixslm not found.\n"
find ~/waylandrc && rm ~/waylandrc || printf "Local waylandrc not found.\n"
printf "The scripts have been removed.\n"
exit
}

prompt()
{
printf "This is the uninstall script for the POSIX Login Manager.\n"
printf "Removal of this suite of scripts after installation might sting badly.\nIt is recommended that you create a backup or an alternative startup setup.\n"
while true; do
printf "Do you want to proceed? (Y/N) "
read -r yn
	case $yn in
		[Yy]* ) printf "\nContinuing with the uninstall script...\n" && uninstall;;
		[Nn]* ) printf "\nExiting...\n" && return && exit;;
		* ) printf "\nIncorrect input detected, repeating prompt...\n";;
	esac
done
}

prompt
