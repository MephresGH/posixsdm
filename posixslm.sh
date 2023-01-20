#!/bin/sh

### POSIX Shell Login Manager
### Licensed under GNU General Public License v3.0

## Create static variables and aliases for simple repeating of code

user=$(whoami)
date=$(date)
logincheck=$(last | head -n 6)
envtty=$(readlink /proc/$$/exe)
alias sxfix="exec startx ~/.config/posixslm/xinitrc"
alias winit="exec ~/.config/posixslm/waylandrc"

## Exit to TTY

ttyexit()
{
printf "\nEntered exit prompt\n"
while true; do
printf "Do you want to return to the TTY or login menu? (T/E/L) "
read -r tel
	case $tel in
	[Tt]) printf "\nExiting to TTY shell...\n"
	exec $SHELL;;
	[Ee]) printf "\nExiting to TTY login...\n"
	exit;;
	[Ll]) printf "\nReturning to login screen...\n"
	break;;
	*) printf "\nError: input empty or option non-existent\n"
	esac
done
}

## Start a Wayland login prompt

wayland()
{
printf "\nEntered Wayland prompt\n"
while true; do
printf "\nWhat Wayland desktop environment do you want to enter?"
printf "\n\nThe following options are available:\nView waylandrc, Exit, Execute WM (v/x/INPUT) "
read -r runwm
	if [ "$runwm" = "v" ]; then
	printf "\nListing waylandrc content...\n\n"
	cat ~/.config/posixslm/waylandrc
	elif [ "$runwm" = "x" ]; then
	ttyexit
	elif [ -z "$runwm" ]; then
	printf "\nError: input cannot be empty\n"
	else
	printf "\nExecuting variable into waylandrc...\n"
		if grep -wq "$runwm" ~/.config/posixslm/waylandrc; then
		WM=$runwm winit
		else
		printf "\nError: illegal input"
		fi
	fi
done
}

## Start an X.Org login prompt

xorg()
{
printf "\nEntered X.Org prompt\n"
while true; do
printf "\nWhat X.Org desktop environment do you want to enter?\n"
printf "The following options are available:\nView xinitrc, Exit, Execute WM (v/x/INPUT) "
read -r runwm
	if [ "$runwm" = "v" ]; then
	printf "\nListing xinitrc content...\n"
	cat ~/.config/posixslm/xinitrc
	elif [ "$runwm" = "x" ]; then
	ttyexit
	elif [ -z "$runwm" ]; then
	printf "\nError: input cannot be empty\n"
	else
	printf "\nExecuting variable into xinitrc...\n"
		if grep -wq "$runwm" ~/.config/posixslm/xinitrc; then
		WM=$runwm sxfix
		else
		printf "\nError: illegal input"
		fi
	fi
done
}

# Run a function that creates a TTY-based "display manager"

slmlogin()
{
clear
printf "\nPOSIX Shell Login Manager\n\n"
printf "You have logged into the user %s \n\n" "$user"
printf "Recent logins:\n%s\n\n" "$logincheck"
printf "The time and date is %s \n\n" "$date"
printf "The current shell in usage is %s \n\n" "$envtty"
printf "The following X11 desktop environments are installed:\n\n"
ls -1 /usr/share/xsessions
printf "\nThe following Wayland desktop environments are installed:\n\n"
ls -1 /usr/share/wayland-sessions
printf "\nNOTE: .desktop files from environments that cannot be found cannot be run.\n\n"

while true; do
printf "Do you want to run an X.Org or Wayland graphical server? (X/W/N) "
read -r xwn
	case $xwn in
	[Xx]) xorg;;
	[Ww]) wayland;;
	[Nn]) ttyexit;;
	* ) printf "\nError: input empty or option non-existent\n";;
	esac
done
}

## Create warning screen

warning()
{
while true; do
printf "WARNING: TTY1 was not detected.\nIt is not recommended to run a desktop environment outside of TTY1.\n"
printf "Do you want to continue? (Y/N) "
read -r yn
	case $yn in
	[Yy]) slmlogin;;
	[Nn]) ttyexit;;
	* ) printf "\nError: input empty or option non-existent\n";;
	esac
done
}

## Check for TTY window; start script
# If not TTY1, warn user from starting WM/DE

[ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && slmlogin
warning
