#!/bin/sh

case $WM in
plasma)
	exec dbus-run-session /bin/startplasma-x11;;
gnome)
	exec dbus-run-session /bin/gnome-session;;
i3)
	exec dbus-run-session /bin/i3;;
fluxbox)
	exec dbus-run-session /bin/fluxbox;;
openbox)
	exec dbus-run-session /bin/openbox-session;;
awesome)
	exec dbus-run-session /bin/awesome;;
esac
