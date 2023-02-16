#!/bin/sh
# sx - start an xserver
# for documentation, see github.com/Earnestly/sx

cleanup() {
if [ "$pid" ] && kill -0 "$pid" 2>/dev/null; then
	kill "$pid"
	wait "$pid"
	xorg=$?
fi

xauth remove :"$tty"

if [ "$1" = exit ]; then
	exit "${xorg:-0}"
fi
}

tty=$(tty)
tty=${tty#/dev/tty}
cfgdir="$HOME/.config/posixslm"
export XAUTHORITY="$cfgdir/.Xauthority"
touch $XAUTHORITY
xauth add :"$tty" MIT-MAGIC-COOKIE-1 "$(od -An -N16 -x /dev/urandom | tr -d ' ')"
trap 'cleanup kill -INT "$$"' INT
trap 'cleanup exit' EXIT HUP TERM QUIT
trap 'DISPLAY=:$tty exec "${@-$cfgdir/sxrc}" & wait $!' USR1
trap '' USR1 && exec Xorg :"$tty" vt"$tty" -noreset -auth "$XAUTHORITY" & pid=$!
wait $pid
