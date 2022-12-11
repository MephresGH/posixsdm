#!/bin/sh

### POSIX Shell Login Manager Install Script
### Licensed Under: GNU General Public License v3.0
### Published & Written By Mephres

## ZShell-specific setup for POSIXSLM

zshell()
{
mkdir ~/.config/posixslm
chmod +x ./xinitrc
chmod +x ./posixslm.sh
chmod +x ./waylandrc
cp ./xinitrc ~/.config/posixslm
cp ./posixslm.sh ~/.config/posixslm
cp ./waylandrc ~/.config/posixslm
find ~/.zprofile || printf "Can't find user ZShell profile, creating .zprofile...\n" && touch ~/.zprofile
printf 'sh ~/.config/posixslm/posixslm.sh' >> ~/.zprofile
printf "The scripts have been installed.\n"
printf "Please uninstall your current login manager and reboot your machine to run POSIXSLM.\n"
exit
}

## POSIX shell-specific setup for POSIXSLM

posix()
{
mkdir ~/.config/posixslm
chmod +x ./xinitrc
chmod +x ./posixslm.sh
chmod +x ./waylandrc
cp ./xinitrc ~/.config/posixslm
cp ./posixslm.sh ~/.config/posixslm
cp ./waylandrc ~/.config/posixslm
find ~/.profile || printf "Can't find user UNIX Shell profile, creating .profile...\n" && touch ~/.profile
printf 'sh ~/.config/posixslm/posixslm.sh' >> ~/.profile
printf "The scripts have been installed.\n"
printf "Please uninstall your current login manager and reboot your machine to run POSIXSLM.\n"
exit
}

main()
{
while true; do
printf "Is your login shell ZSH, Bash or SH? (Z/S/N) "
read -r zsn
	case $zsn in
		[Zz]* ) printf "\nInstalling ZSH profile...\n" && zshell;;
		[Ss]* ) printf "\nInstalling SH profile...\n" && posix;;
		[Nn]* ) printf "\nExiting...\n" && return && exit;;
		* ) printf "\nIncorrect input detected, repeating prompt...\n";;
	esac
done
}

prompt()
{
printf "This is the install script for the POSIX Shell Login Manager.\n"
printf "Please read the NOTICE.txt file for more information before installation.\n"
while true; do
printf "Do you want to install this program? (Y/N) "
read -r yn
	case $yn in
		[Yy]* ) printf "\nContinuing with the installation...\n" && main;;
		[Nn]* ) printf "\nExiting...\n" && return && exit;;
		* ) printf "\nIncorrect input detected, repeating prompt...\n";;
	esac
done
}

prompt
