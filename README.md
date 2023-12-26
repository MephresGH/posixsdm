  # POSIX Shell Display Manager NOTICE File

The POSIX Shell Display Manager is a minimal script written in POSIX-compliant shell that utilizes a set of programs
written for Linux-based distributions to quickly run desktop environments
or window managers directly from the TTY, eliminating the need for display managers and written
with universal compatibility in mind. It can be used with the
Bourne Shell (SH), the Bourne Again Shell (BASH), Z Shell (ZSH), Debian Almquist Shell (dash), Korn Shell (ksh), and more.
For licensing and copyright notices, please refer to the included LICENSE file.

### INSTALLATION
To install the POSIX Shell Display Manager, either copy the file "posixsdm" into /usr/bin/ and add "exec posixsdm -r" for standard usage, or "exec posixsdm -x/-w (INSERT WM/DE)" for the direct start of a window manager/desktop environment of your choice to your local shell .profile config, or install it via the included installation script.

### USAGE
Upon installation, the script will run, if set up correctly, each time after you log into TTY1.
At the start of the script, the user is greeted with a standard TTY output that showcases the name of the script, the currently logged in user, recent logins, the currently used shell, and then shows all of the .desktop files for Xorg and Wayland-based environments that have been installed on the system.
Now, you are able to choose between Xorg (X), Wayland (W), or exiting the script (N). Upon exiting, the user is asked if you want to enter a TTY shell (usually Dash/SH), returning to the TTY login, or go back to the first part of the POSIXSDM login manager.
Once you choose a graphical server/protocol of your choice, the functionalities are identical: you get asked what environment you want to enter, which then is followed up by three options: viewing all .desktop files for the graphical server/protocol of choice (V), going to the exit prompt (X), or being asked for user input.
In the latter part of this script, the user can simply enter the full name of a .desktop file, or type a singular letter that gets followed up with an asterisk (i.e. bspwm, or b*).
After user input has been given, the script checks /usr/share/xsessions or /usr/share/wayland-sessions for all .desktop files, comparing the user-specified pattern with names from files inside of one of the mentioned directories.
Afterwards, the script uses the program "sed" to search for a line named "Exec=" inside the .desktop file and removes the "Exec=" portion of the line, only taking the executable desktop environment by name and then starting it.
If the desktop environment is terminated, then POSIXSDM will exit as well, sending you back to a TTY login screen.

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
