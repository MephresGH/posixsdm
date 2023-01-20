#!/bin/sh

dir=/usr/share/xsessions
slm=~/.config/posixslm/posixslm.sh

case $WM in
plasma)
	if grep -Rwq "plasma" $dir; then
	exec dbus-run-session startplasma-x11
	else
	printf "\nError: file doesn't exist, press any key to return to prompt"
	read ans
	exec sh $slm
	fi;;
gnome)
	if grep -Rwq "gnome" $dir; then
	exec dbus-run-session gnome-session
	else
	printf "\nError: file doesn't exist, press any key to return to prompt"
	read ans
	exec sh $slm
	fi;;
i3)
	if grep -Rwq "i3" $dir; then
	exec dbus-run-session i3
	else
	printf "\nError: file doesn't exist, press any key to return to prompt"
	read ans
	exec sh $slm
	fi;;
fluxbox)
	if grep -Rwq "fluxbox" $dir; then
	exec dbus-run-session fluxbox
	else
	printf "\nError: file doesn't exist, press any key to return to prompt"
	read ans
	exec sh $slm
	fi;;
openbox)
	if grep -Rwq "openbox" $dir; then
	exec dbus-run-session openbox-session
	else
	printf "\nError: file doesn't exist, press any key to return to prompt"
	read ans
	exec sh $slm
	fi;;
awesome)
	if grep -Rwq "awesome" $dir; then
	exec dbus-run-session awesome
	else
	printf "\nError: file doesn't exist, press any key to return to prompt"
	read ans
	exec sh $slm
	fi;;
esac
