#!/bin/sh

### POSIX Shell Login Manager Uninstall Script
### Licensed Under: GNU General Public License v3.0

## POSIX script uninstaller & cleanup

uninstall()
{
printf 'The following files will be removed:\n'
find ~/.config/posixslm && rm -r ~/.config/posixslm && printf 'The scripts have been removed.\n'|| printf 'No posixslm folder was found. Continuing...\n'
printf 'Removing POSIXSLM from .profile...\n'
sed -i 's+exec sh ~/.config/posixslm/posixslm.sh++g' ~/.zprofile 2>/dev/null
sed -i 's+exec ~/.config/posixslm/posixslm.sh++g' ~/.zprofile 2>/dev/null
sed -i 's+sh ~/.config/posixslm/posixslm.sh++g' ~/.zprofile 2>/dev/null
sed -i 's+exec sh ~/.config/posixslm/posixslm.sh++g' ~/.profile 2>/dev/null
sed -i 's+exec ~/.config/posixslm/posixslm.sh++g' ~/.profile 2>/dev/null
sed -i 's+sh ~/.config/posixslm/posixslm.sh++g' ~/.profile 2>/dev/null
exit
}

## Warning prompt

prompt()
{
printf 'This is the uninstall script for the POSIX Shell Login Manager.\n'
printf 'Removal of this suite of scripts after installation can cause issues.\nIt is recommended that you create a backup or install an alternative login manager.\n'
printf 'Do you want to proceed? (Y/N) '
while read -r yn; do
	case $yn in
		[Yy]* ) printf '\nRemoving .config POSIXSLM folder...\n'
		uninstall;;
		[Nn]* ) printf '\nExiting...\n'
		exit;;
		* ) printf '\nIncorrect input detected, repeating prompt...\n';;
	esac
done
}

prompt
