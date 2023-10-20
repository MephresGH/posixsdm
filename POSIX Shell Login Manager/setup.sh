#!/bin/sh

### posixsdm setup script
### Licensed under: GNU General Public License v3.0

## POSIX script uninstaller & cleanup

uninstall() {
printf "\nRemoving POSIXSDM files and associations...\n"
if [ -f /usr/bin/posixsdm ]; then
        sudo rm /usr/bin/posixsdm
        rm -r $HOME/.config/sx 2>/dev/null
        printf "The program has been removed.\n"
else
        printf "The program has not been found. Continuing...\n"
fi

printf "Removing POSIXSDM from .profile...\n"
sed -i '/posixsdm/d' ~/.profile 2>/dev/null
sed -i '/posixsdm/d' ~/.zprofile 2>/dev/null

while true; do
printf "\nThe script has finished. Do you want to reboot the machine? (Y/N) "
read -r yn
        case "$yn" in
                [Yy]) reboot;;
                [Nn]) printf "\nExiting without rebooting. Please restart your system.\n"
                exit;;
                *) printf "\nIncorrect input detected, repeating prompt...\n"
        esac
done
}

## ZShell-specific setup for POSIXSDM

zshell() {

chmod +x ./posixsdm
sudo cp ./posixsdm /usr/bin/

while true; do
printf "\nDo you want to install a customized sx script (startx alternative)? (Y/N) "
read -r yn
	case "$yn" in
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
	case "$yn" in
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
	case "$yn" in
		[Yy]) printf "\nInstalling.\n"
		if [ ! -f /usr/bin/sx ]; then
			sudo cp ./sx /usr/bin/sx
			chmod +x ./sx
		else
			printf "sx was found. Do you want to override the current installation? (Y/N) "
			while true; do
			read -r yn
				case "$yn" in
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

install() {
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
printf "This is the setup script for the POSIX Shell Display Manager.\n"
printf "Please read the NOTICE.txt file for more information before installation.\n"
while true; do
printf "Do you want to install or uninstall POSIXSDM? (I/U/N) "
read -r yn
	case $yn in
		[Ii]) printf "\nStarting installation setup.\n"
		install;;
		[Uu]) printf "\nStarting uninstall setup.\n"
		uninstall;;
		[Nn]) printf "Exiting.\n"
		exit;;
		*) printf "\nIncorrect input detected, repeating prompt\n"
	esac
done
}

prompt
