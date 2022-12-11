#!/bin/sh

### POSIX Shell Login Manager Uninstall Script
### Licensed Under: GNU General Public License v3.0
### Published & Written By Mephres

## POSIX script uninstaller & cleanup

uninstall()
{
printf "The following files will be removed:\n"
find ~/.config/posixslm && rm -r ~/config/posixslm && printf "The scripts have been removed.\n"|| printf "No posixslm folder was found. Exiting..."
exit
}

prompt()
{
printf "This is the uninstall script for the POSIX Shell Login Manager.\n"
printf "Removal of this suite of scripts after installation can cause issues.\nIt is recommended that you create a backup or an alternative startup setup.\n"
while true; do
printf "Do you want to proceed? (Y/N) "
read -r yn
	case $yn in
		[Yy]* ) printf "\nRemoving .config POSIXSLM folder...\n" && uninstall;;
		[Nn]* ) printf "\nExiting...\n" && return && exit;;
		* ) printf "\nIncorrect input detected, repeating prompt...\n";;
	esac
done
}

prompt
