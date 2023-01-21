#-#!/bin/sh

### POSIX Shell Login Manager
### Licensed under GNU General Public License v3.0

## Create static variables and aliases for simple repeating of code

user=$(whoami)
date=$(date)
logincheck=$(last | head -n 6)
envtty=$(readlink /proc/$$/exe)
xses=/usr/share/xsessions
wses=/usr/share/wayland-sessions

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
	*) printf "\nError: illegal input\n"
	esac
done
}


## Start a Wayland login prompt

wayland()
{
printf "\nEntered Wayland prompt\n"
while true; do
printf "\nWhat Wayland desktop environment do you want to enter?"
printf "\n\nThe following options are available:\nView .desktop files, Exit, Execute WM (v/x/INPUT) "
read -r runwm
	if [ "$runwm" = "v" ]; then
	printf "\n"
	ls -1 $wses
	elif [ "$runwm" = "x" ]; then
	ttyexit
	elif [ -z "$runwm" ]; then
	printf "\nError: input cannot be empty\n"
	else
		if grep -Rwq "$runwm" $wses; then
		exec dbus-run-session $runwm
		else
		printf "\nError: illegal input or .desktop file not found\n"
		fi
	fi
done
}

## Start an X.Org login prompt
# If sx does not exist, fall back to startx

xorg()
{
printf "\nEntered X.Org prompt\n"
while true; do
printf "\nWhat X.Org desktop environment do you want to enter?\n"
printf "The following options are available:\nView .desktop files, Exit, Execute WM (v/x/INPUT) "
read -r runwm
	if [ "$runwm" = "v" ]; then
	printf "\n"
	ls -1 $xses
	elif [ "$runwm" = "x" ]; then
	ttyexit
	elif [ -z "$runwm" ]; then
	printf "\nError: input cannot be empty\n"
	else
		if grep -Rwq "$runwm" $xses; then
			if ! command -v sx; then
			exec dbus-run-session startx $runwm
			else
			exec dbus-run-session sx $runwm
			fi
		else
		printf "\nError: illegal input or .desktop file not found\n"
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
ls -1 $xses
printf "\nThe following Wayland desktop environments are installed:\n\n"
ls -1 $wses
printf "\nNOTE: .desktop files from environments that cannot be found cannot be run.\n\n"

while true; do
printf "Do you want to run an X.Org or Wayland graphical server? (X/W/N) "
read -r xwn
	case $xwn in
	[Xx]) xorg;;
	[Ww]) wayland;;
	[Nn]) ttyexit;;
	*) printf "\nError: input empty or illegal option\n";;
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
	*) printf "\nError: input empty or illegal option\n";;
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
