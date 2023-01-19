#!/bin/sh

### POSIX Shell Login Manager
### Licensed under GNU General Public License v3.0

## Create static variables and aliases for simple repeating of code

user=$(whoami)
date=$(date)
logincheck=$(last | head -n 6)
envtty=$(readlink /proc/$$/exe)
alias sxfix="exec startx ~/.config/posixslm/xinitrc"
alias startw="exec ~/.config/posixslm/waylandrc"

## Exit to TTY

ttyexit()
{
while true; do
printf "Do you want to return to the TTY or login menu? (T/E/L) "
read tel
	case $tel in
	[Tt]* ) printf "\nExiting to TTY shell...\n"
	exec $SHELL;;
	[Ee]* ) printf "\nExiting to TTY login...\n"
	exit;;
	[Ll]* ) printf "\nReturning to login screen...\n"
	break;;
	*) printf "\nIncorrect input detected, repeating prompt...\n"
	esac
done
}

## Start a Wayland login prompt

wayland()
{
while true; do
printf "\nWhat Wayland desktop environment do you want to enter?\n"
printf "The following options are available:\nView waylandrc, Exit, Execute WM (v/x/INPUT) "
read runwm
	if [ $runwm = "v" ]; then
	printf "\nListing waylandrc content...\n\n"
	cat ~/.config/posixslm/waylandrc
	elif [ $runwm = "x" ]; then
	printf "\nReturning to exit prompt...\n"
	ttyexit
	elif [ -z "$runwm" ]; then
	printf "\nIncorrect input detected, repeating prompt...\n"
	else
	printf "\nExecuting variable into waylandrc...\n"
	grep "runwm=$WM" ~/.config/posixslm/waylandrc > /dev/null
		if [ "$?" -eq 1 ]; then
		WM=$runwm startw
		else
		printf "\nError: invalid input or variable.\n"
		fi
	fi
done
}

## Start an X.Org login prompt

xorg()
{
while true; do
printf "\nWhat X.Org desktop environment do you want to enter?\n"
printf "The following options are available:\nView xinitrc, Exit, Execute WM (v/x/INPUT) "
read runwm
	if [ $runwm = "v" ]; then
	printf "\nListing xinitrc content...\n"
	cat ~/.config/posixslm/xinitrc
	elif [ $runwm = "x" ]; then
	printf "\nReturning to exit prompt...\n"
	ttyexit
	elif [ -z "$runwm" ]; then
	printf "\nIncorrect input detected, repeating prompt...\n"
	else
	printf "\nExecuting variable into xinitrc...\n"
	WM=$runwm sxfix
	fi
done
}

## Run a function that creates a TTY-based "display manager"

slmlogin()
{
clear
printf "\nPOSIX Shell Login Manager\n\n"
printf "You have logged into the user %s \n\n" "$user"
printf "Recent logins:\n%s\n\n" "$logincheck"
printf "The time and date is %s \n\n" "$date"
printf "The current shell in usage is %s \n\n" "$envtty"
printf "The following X11 desktop environments are installed:\n\n"
ls -1 /usr/share/xsessions/
printf "\nThe following Wayland desktop environments are installed:\n\n"
ls -1 /usr/share/wayland-sessions/
printf "\nNOTE: .desktop files from environments that cannot be found cannot be run.\n\n"

while true; do
printf "Do you want to run an X.Org or Wayland graphical server? (X/W/N) "
read xwn
	case $xwn in
	[Xx]* ) printf "\nStarting X.Org prompt...\n"
	xorg;;
	[Ww]* ) printf "\nStarting Wayland prompt...\n"
	wayland;;
	[Nn]* ) printf "\nGoing to exit prompt...\n\n"
	ttyexit;;
	* ) printf "\nIncorrect input detected, repeating prompt...\n";;
	esac
done
}

## Create warning screen

warning()
{
while true; do
printf "TTY1 was not detected.\nIt is not recommended to run a desktop environment outside of TTY1.\n"
printf "Do you want to continue? (Y/N) "
read yn
	case $yn in
	[Yy]* ) printf "\nContinuing...\n"
	login;;
	[Nn]* ) printf "\nExiting...\n"
	ttyexit;;
	* ) printf "\nIncorrect input detected, repeating prompt...\n";;
	esac
done
}

## Check for TTY window; start script
# If not TTY1, warn user from starting WM/DE

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  slmlogin
else
  warning
fi
