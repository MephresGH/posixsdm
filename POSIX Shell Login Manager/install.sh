#!/bin/sh

### posixsdm install script
### Licensed under: GNU General Public License v3.0

## ZShell-specific setup for POSIXSDM

zshell() {

chmod +x ./posixsdm
sudo cp ./posixsdm /usr/bin/

while true; do
printf "\nDo you want to install a customized sx script (startx alternative)? (Y/N) "
read -r yn
	case $yn in
		[Yy]) printf "\nInstalling.\n"
		if [ ! -f /usr/bin/sx ]; then
			chmod +x ./sx
			sudo cp ./sx /usr/bin/sx
		else
			printf "sx was found. Do you want to override the current installation? (Y/N) "
			while true; do
			read -r yn
				case $yn in
					[Yy]) printf "\nContinuing with the installation.\n"
					chmod +x ./sx
					sudo cp -f ./sx /usr/bin/sx
					break;;
					[Nn]) printf "\nSkipping installation of sx, continuing."
					break;;
					*) printf "\nError: invalid input\n"
				esac
			done
		fi
		break;;
		[Nn]) printf "\nAborting.\n"
		break;;
		*) printf "\nError: invalid input\n"
	esac
done

if [ ! -f $HOME/.zprofile ]; then
	printf "Cannot find user ZShell profile, creating .zprofile\n"
	> $HOME/.zprofile
fi

printf "exec posixsdm -r" > $HOME/.zprofile

while true; do
printf "The scripts have been installed. Do you want to reboot the machine? (Y/N) "
read -r yn
	case $yn in
		[Yy]) reboot;;
		[Nn]) printf "\nExiting without rebooting. Please uninstall your current login manager and reboot your machine to run POSIXSDM.\n"
		exit;;
		*) printf "\nError: invalid input\n"
	esac
done
}

## POSIX shell-specific setup for POSIXSDM

posix() {

chmod +x ./posixsdm
sudo cp ./posixsdm /usr/bin

while true; do
printf "\nDo you want to install a customized sx script (startx alternative)? (Y/N) "
read -r yn
	case $yn in
		[Yy]) printf "\nInstalling.\n"
		if [ ! -f /usr/bin/sx ]; then
			sudo cp ./sx /usr/bin/sx
			chmod +x ./sx
		else
			printf "sx was found. Do you want to override the current installation? (Y/N) "
			while true; do
			read -r yn
				case $yn in
					[Yy]) printf "\nContinuing with the installation.\n"
					chmod +x ./sx
					sudo cp -f ./sx /usr/bin/sx
					break;;
					[Nn]) printf "\nSkipping installation of sx, continuing."
					break;;
					*) printf "\nError: invalid input\n"
				esac
			done
		fi
		break;;
		[Nn]) printf "\nAborting.\n"
		break;;
		*) printf "\nIncorrect input detected, repeating prompt...\n"
	esac 
done

if [ ! -f $HOME/.profile ]; then
	printf "Cannot find user POSIX Shell profile, creating .profile\n"
	> $HOME/.profile
fi

printf "exec posixsdm -r" > $HOME/.profile

while true; do
printf "The scripts have been installed. Do you want to reboot the machine? (Y/N) "
read -r yn
	case $yn in
		[Yy]) reboot;;
		[Nn]) printf "\nExiting without rebooting. Please uninstall your current login manager and reboot your machine to run POSIXSDM.\n"
		exit;;
		*) printf "\nIncorrect input detected, repeating prompt...\n"
	esac
done
}

main() {
while true; do
printf "Is your login shell ZSH, Bash or POSIX SH? (Z/S/N) "
read -r zsn
	case $zsn in
		[Zz]) printf "\nInstalling ZSH profile.\n"
		zshell;;
		[Ss]) printf "\nInstalling SH profile.\n"
		posix;;
		[Nn]) printf "Exiting.\n"
		exit;;
		*) printf "\nIncorrect input detected, repeating prompt...\n"
	esac
done
}

prompt() {
printf "This is the install script for the POSIX Shell Display Manager.\n"
printf "Please read the NOTICE.txt file for more information before installation.\n"
while true; do
printf "Do you want to install this program? (Y/N) "
read -r yn
	case $yn in
		[Yy]) printf "\nContinuing with the installation.\n"
		main;;
		[Nn]) printf "Exiting.\n"
		exit;;
		*) printf "\nIncorrect input detected, repeating prompt\n"
	esac
done
}

prompt
