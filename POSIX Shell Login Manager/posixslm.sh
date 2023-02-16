#!/bin/sh

## For documentation, view DOCUMENTATION.txt

xses=/usr/share/xsessions
wses=/usr/share/wayland-sessions

ttyexit() {
printf "\nEntered exit prompt\n"
while true; do
printf "Do you want to return to the TTY or login menu? (T/E/L) "
read -r tel
	case $tel in
		[Tt]) printf "\nExiting to TTY shell...\n"
		exec $SHELL;;
		[Ee]) printf "\nExiting to TTY login...\n"
		exit 0;;
		[Ll]) printf "\nReturning to login screen...\n"
		slmlogin;;
		*) printf "\nError: illegal input\n"
	esac
done
}

wayland() {
printf "\nEntered Wayland prompt\n"
while true; do
printf "\nWhat Wayland desktop environment do you want to enter?\n"
printf "\nThe following options are available:\nView .desktop files, Exit, Execute WM (V/X/INPUT) "
read -r wm
	case $wm in
		[Vv]) printf "\n"
		ls -1 $wses;;
		[Xx]) ttyexit;;
		$wm) if find $wses/$wm.desktop 2>/dev/null; then
			runwm=$(sed -n 's/^Exec=//p' $wses/$wm.desktop)
			exec dbus-launch $runwm
		else
			printf "\nError: illegal input or .desktop file not found\n"
		fi;;
	esac
done
}

xorg() {
printf "\nEntered X.Org prompt\n"
while true; do
printf "\nWhat X.Org desktop environment do you want to enter?\n"
printf "The following options are available:\nView .desktop files, Exit, Execute WM (V/X/INPUT) "
read -r wm
	case $wm in
		[Vv]) printf "\n"
		ls -1 $xses;;
		[Xx]) ttyexit;;
		$wm) if find $xses/$wm.desktop 2>/dev/null; then
			runwm=$(sed -n 's/^Exec=//p' $xses/$wm.desktop)
			sx=$HOME/.config/posixslm/sx.sh
			if find $sx; then
				exec dbus-launch $sx $runwm
			else
				printf "\nCritical error: x11 cannot be run\n"
			fi
		else
			printf "\nError: illegal input or .desktop file not found\n"
		fi;;
	esac
done
}

slmlogin() {
clear
printf "\nPOSIX Shell Login Manager\n\n"
w
printf "\nRecent logins:\n\n"
last | head -n 6
printf "\nThe current shell in usage is $SHELL\n\n"
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
		*) printf "\nError: illegal input\n";;
	esac
done
}

warning() {
while true; do
printf "WARNING: TTY1 was not detected.\nIt is not recommended to run a desktop environment outside of TTY1.\n"
printf "Do you want to continue? (Y/N) "
read -r yn
	case $yn in
		[Yy]) slmlogin;;
		[Nn]) ttyexit;;
		*) printf "\nError: illegal input\n";;
	esac
done
}

[ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && slmlogin
warning
