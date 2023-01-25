#!/bin/sh

### POSIX Shell Login Manager Install Script
### Licensed Under: GNU General Public License v3.0

## ZShell-specific setup for POSIXSLM

zshell()
{
mkdir ~/.config/posixslm
chmod +x ./posixslm.sh
cp ./posixslm.sh ~/.config/posixslm
cp ./sx.sh ~/.config/posixslm
find ~/.zprofile || printf 'Cannot find user ZShell profile, creating .zprofile...\n' && touch ~/.zprofile
printf 'exec sh ~/.config/posixslm/posixslm.sh' >> ~/.zprofile
printf 'The scripts have been installed.\n'
printf 'Please uninstall your current login manager and reboot your machine to run POSIXSLM.\n'
exit
}

## POSIX shell-specific setup for POSIXSLM

posix()
{
mkdir ~/.config/posixslm
chmod +x ./posixslm.sh
cp ./posixslm.sh ~/.config/posixslm
cp ./sx.sh ~/.config/posixslm
find ~/.profile || printf 'Cannot find user POSIX Shell profile, creating .profile...\n' && touch ~/.profile
printf 'exec sh ~/.config/posixslm/posixslm.sh' >> ~/.profile
printf 'The scripts have been installed.\n'
printf 'Please uninstall your current login manager and reboot your machine to run POSIXSLM.\n'
exit
}

main()
{
printf 'Is your login shell ZSH, Bash or POSIX SH? (Z/S/N) '
while read -r zsn; do
	case $zsn in
		[Zz]* ) printf '\nInstalling ZSH profile...\n'
		zshell;;
		[Ss]* ) printf '\nInstalling SH profile...\n'
		posix;;
		[Nn]* ) printf '\nExiting...\n'
		exit;;
		* ) printf '\nIncorrect input detected, repeating prompt...\n';;
	esac
done
}

prompt()
{
printf 'This is the install script for the POSIX Shell Login Manager.\n'
printf 'Please read the NOTICE.txt file for more information before installation.\n'
printf 'Do you want to install this program? (Y/N) '
while read -r yn; do
	case $yn in
		[Yy]* ) printf '\nContinuing with the installation...\n'
		main;;
		[Nn]* ) printf '\nExiting...\n'
		exit;;
		* ) printf '\nIncorrect input detected, repeating prompt...\n';;
	esac
done
}

prompt
