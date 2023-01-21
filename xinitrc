#!/bin/sh

case $WM in
plasma)
	exec dbus-run-session startplasma-x11;;
gnome)
	exec dbus-run-session gnome-session;;
i3)
	exec dbus-run-session i3;;
fluxbox)
	exec dbus-run-session fluxbox;;
openbox)
	exec dbus-run-session openbox-session;;
awesome)
	exec dbus-run-session awesome;;
esac
