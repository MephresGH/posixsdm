#!/bin/sh

### posixsdm uninstall script
### Licensed Under: GNU General Public License v3.0

## POSIX script uninstaller & cleanup

uninstall() {
printf 'The following files will be removed:\n'
[ -d $HOME/.config/posixsdm ] && rm -r $HOME/.config/posixsdm && printf "The directory has been removed.\n" || printf "No posixsdm folder was found. Continuing...\n"
[ -f /usr/bin/posixsdm ] && sudo rm /usr/bin/posixsdm && printf "The program has been removed.\n" || printf "The program has not been found. Continuing...\n"
printf "Removing POSIXSDM from .profile...\n"
sed -i 's+exec posixsdm -r++g' ~/.zprofile 2>/dev/null
sed -i 's+sh posixsdm -r++g' ~/.zprofile 2>/dev/null
sed -i 's+posixsdm -r++g' ~/.zprofile 2>/dev/null
sed -i 's+exec posixsdm -r++g' ~/.profile 2>/dev/null
sed -i 's+sh posixsdm -r++g' ~/.profile 2>/dev/null
sed -i 's+posixsdm -r++g' ~/.profile 2>/dev/null

while true; do
printf "\nThe script has finished. Do you want to reboot the machine? (Y/N) "
read -r yn
	case $yn in
		[Yy]) reboot;;
		[Nn]) printf "\nExiting without rebooting. Please restart your system.\n"
		exit;;
		*) printf "\nIncorrect input detected, repeating prompt...\n"
	esac
done
}

## Uninstall prompt

prompt() {
printf "This is the uninstall script for the POSIX Shell Display Manager.\n"
printf "Removal of this suite of scripts after installation can cause issues.\nIt is recommended that you create a backup or install an alternative login manager.\n"
printf "Do you want to proceed? (Y/N) "

while read -r yn; do
	case $yn in
		[Yy]) printf "\nRemoving .config POSIXSDM folder...\n"
		uninstall;;
		[Nn]) printf "\nExiting...\n"
		exit;;
		*) printf "\nIncorrect input detected, repeating prompt...\n"
	esac
done
}

prompt
