				POSIX Shell Display Manager NOTICE File


The POSIX Shell Display Manager is a minimal script written in POSIX-compliant shell that utilizes a set of programs
written for Linux-based distributions to quickly run desktop environments
or window managers directly from the TTY, eliminating the need for display managers and written
with universal compatibility in mind. It can be used with the
Bourne Shell (SH), the Bourne Again Shell (BASH), Z Shell (ZSH), Debian Almquist Shell (dash), Korn Shell (ksh), and more.
For licensing and copyright notices, please refer to the included LICENSE file.

### INSTALLATION
To install the POSIX Shell Display Manager, either copy the file "posixsdm" into /usr/bin/ and add "exec posixsdm -r" for standard usage, or "exec posixsdm -x/-w (INSERT WM/DE)" for the direct start of a window manager/desktop environment of your choice to your local shell .profile config, or install it via the included installation script.

### REMOVAL
To uninstall the scripts is as simple as installing them; either remove them manually, or run the uninstall script.

### DEPENDENCIES
The following programs are required for this suite of scripts to work:

- xauth
- xorg
- xorg-xinit (optional)
- sx (implemented; default)
- bash (optional; default)
- dash (optional)
- ksh (optional)
- zsh (optional)
- wayland
- wayland-protocols
- wayland-utils
