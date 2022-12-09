#!/bin/sh

### POSIX Shell Login Manager Install Script
### Licensed Under: GNU General Public License v3.0
### Published & Written By Mephres

## ZShell-specific setup for POSIXLM

zshell()
{
chmod +x ./xinitrc
chmod +x ./.posixlm
chmod +x ./.waylandrc
cp ./xinitrc ~/
cp ./.posixlm ~/
cp ./.waylandrc ~/
find ~/.zprofile || printf "Can't find user ZShell profile, creating .zprofile...\n" && touch ~/.zprofile
printf 'sh ~/.posixlm' >> ~/.zprofile
printf "The scripts have been installed.\n"
printf "Please uninstall your current login manager and reboot your machine to run POSIXLM.\n"
exit
}

## POSIX shell-specific setup for POSIXLM

posix()
{
chmod +x ./xinitrc
chmod +x ./.posixlm
chmod +x ./.waylandrc
cp ./xinitrc ~/
cp ./.posixlm ~/
cp ./.waylandrc ~/
find ~/.profile || printf "Can't find user UNIX Shell profile, creating .profile...\n" && touch ~/.profile
printf 'sh ~/.posixlm' >> ~/.profile
printf "The scripts have been installed.\n"
printf "Please uninstall your current login manager and reboot your machine to run POSIXLM.\n"
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
printf "This is the install script for the POSIX Login Manager.\n"
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
