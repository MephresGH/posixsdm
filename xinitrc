#!/bin/sh

case $WM in
kde)
		exec startplasma-x11
		;;
gnome)
		exec gnome-session
		;;
i3wm)
		exec i3
		;;
fluxbox)
		exec fluxbox
		;;
openbox)
		exec openbox-session
		;;
awesome)
		exec awesome
		;;
esac
