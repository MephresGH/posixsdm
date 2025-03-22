# POSIX Shell Display Manager NOTICE File

### OVERVIEW
The POSIX Shell Display Manager is a minimalistic, primitive display manager written in modern POSIX-compliant shell.
It can be used with most standard shells and is meant to run on TTY1.
For licensing and copyright notices, please refer to the included LICENSE file.

### INSTALLATION AND REMOVAL
POSIXSDM can be installed and uninstalled manually, or via the setup script.
Related parameters can be found in the USAGE section.

### USAGE
The following parameters are available for POSIXSDM:

#### POSIXSDM:
- -r, --run: Run POSIXSDM as usual
- -x, --xorg [INPUT] ([INPUT]): Directly run an Xorg-based graphical environment (supports quickstart parameters; only for advanced users)
- -w, --wayland [INPUT] ([INPUT]): Directly run a Wayland-based graphical environment (supports quickstart parameters; only for advanced users)
- -h, --help: Display an example command and all parameters

#### SETUP:
- -i, --install: Install POSIXSDM; select user of choice (shell + .profile selected automatically)
- -u, --uninstall: Uninstall POSIXSDM
- -h, --help: Display an example command and all parameters

### DEPENDENCIES
The following is required for POSIXSDM to work:

#### General:
- dbus-daemon
- dbus-run-session
- GNU coreutils
- GNU findutils
- sed
- WM/DE of choice (plus dependencies)

#### X.Org-only:
- sx (optional)
- xauth
- xorg
- xorg-xinit (recommended)

#### Wayland-only:
- wayland
- wayland-utils
- wayland-protocols

#### Shell compatibility
- ash
- bash
- dash (recommended)
- ksh
- zsh

## ADDITIONAL NOTES
POSIXSDM is installed into the user's .config directory by default, or inserted into /usr/bin, then called at the end of the user's .profile configuration.
Due to this approach, certain applications that might behave as login shells or similar will cause issues.
Tmux users will have to add conditional checks in their .profile or make sure their program of choice will call an interactive shell instead.
This is done to prevent programs like Tmux from running the .profile configuration file from the shell of your choice and reduce headaches.
I am not sure what other programs might cause complications of this kind, so I don't think I can implement checks for any of them.
Users of POSIXSDM will have to add such conditional checks or changes in their configuration files on their own to minimize friction.
If there are other methods to initialize shell scripts after TTY logins, or if there are better approaches in general here, please let me know.
