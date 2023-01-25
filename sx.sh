#!/bin/sh
# sx - start an xserver
# for documentation, see https://www.github.com/Earnestly/sx

cleanup() {
if [ "$pid" ] && kill -0 "$pid" 2>/dev/null; then
	kill "$pid"
	wait "$pid"
	xorg=$?
fi

if ! stty "$stty"; then
	stty sane
fi

xauth remove :"$tty"

if [ "$1" = exit ]; then
	exit "${xorg:-0}"
fi
}

stty=$(stty -g)
tty=$(tty)
tty=${tty#/dev/tty}
cfgdir=${XDG_CONFIG_HOME=$HOME/.config/posixslm}
export XAUTHORITY="${XAUTHORITY=$cfgdir/xauthority}"
touch "$XAUTHORITY"
xauth add :"$tty" MIT-MAGIC-COOKIE-1 "$(od -An -N16 -tx /dev/urandom | tr -d ' ')"
trap 'cleanup; trap - INT; kill -INT "$$"' INT
trap 'cleanup exit' EXIT HUP TERM QUIT
trap 'DISPLAY=:$tty exec "${@:-$cfgdir/sxrc}" & wait "$!"' USR1
(trap '' USR1 && exec Xorg :"$tty" -keeptty vt"$tty" -noreset -auth "$XAUTHORITY") & pid=$!
wait "$pid"
