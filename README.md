# POSIX Shell Display Manager NOTICE File

### OVERVIEW
The POSIX Shell Display Manager is a minimalistic, primitive display manager written for modern POSIX-compliant shells.
It can be used with most standard shells and is meant to run on TTY1.
For licensing and copyright notices, please refer to the included LICENSE file.

### INSTALLATION AND REMOVAL
POSIXSDM can be installed and uninstalled manually, or via the setup script.
Related parameters can be found in the USAGE section.

### USAGE
The following parameters are available for POSIXSDM:

POSIXSDM:
-r, --run: Run POSIXSDM as usual
-x, --xorg [INPUT]: Directly run an X-based graphical environment
-w, --wayland [INPUT]: Directly run a Wayland-based graphical environment
-h, --help: Display an example command and all parameters

Setup script:
-i, --install: Install POSIXSDM; select shell of choice
-is, --install-sh: Install POSIXSDM (For Dash/Bash users)
-iz, --install-zsh: Run the installer segment (For ZSH users)
-u, --uninstall: Uninstall POSIXSDM
-h, --help: Display an example command and all parameters

### DEPENDENCIES
The following is required for POSIXSDM to work:

General:
- dbus-daemon
- dbus-run-session
- GNU coreutils
- GNU findutils
- sed
- WM/DE of choice (plus their dependencies)

X.Org-only:
- sx (optional)
- xauth
- xorg
- xorg-xinit (recommended)

Wayland-only:
- wayland
- wayland-utils
- wayland-protocols

Shell compatibility
- ash
- bash (default)
- dash (recommended)
- ksh (optional)
- zsh (optional)
