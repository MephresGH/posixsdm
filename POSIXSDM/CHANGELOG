## RELEASES

Version: v1.0
- Initial release

Version: v1.1
- replace $userinput grep sed with sed only

Version: v1.2
- Move comments to DOCUMENTATION.txt
- Remove if-elif-else code; re-implement as switch statements or short-circuit logical operators
- Merge CHANGELOG information
- Remove startx and sx dependencies
- Implement adjusted sx shell script

Version: v1.3
- Remove unnecessary "sh" from install script
- Rename NOTICE.txt to README.txt
- Remove double-arrows in scripts
- Replace home directory approach "~/" with "$HOME"

Version: v2.0
- Renaming of the project
- Replaced more "if-else" condition checks with switch statements
- Removed POSIXSDM folder
- Simplified and optimized sx script
- Added parameters
- Re-inserted comments and removed the DOCUMENTATION.txt file
- Introduced $wcheck and $xcheck for instant starting of desktops if only one .desktop file is found

Version: v2.1
- Further reduced amount of if-else segments
- Added failsafe in wrun() and xrun() in case the user has no desktop environment installed
- Added failsafe in new install and uninstall script prompts
- Implemented more elegant condition checks in all scripts
- Removed folder deletion segment in uninstall script

Version: v2.2
- Fixed the call of a non-existent function within POSIXSDM (introduced in v2.1; "posixslm" to "sdmlogin")
- Changed the default directory for local user-dependant sxrc config files ($HOME/.config/sx/sxrc)
- Replaced all if-else statements with switch segments
- Expanded -x and -w parameters to include full names (--xorg, --wayland)
- Updated README.md to adjust for the newest changes

Version: v2.3
- Changed default directory for sxrc and xauthority file
- Changed back multiple switch condition checks to if-else for performance reasons
- Replaced dbus-launch commands in posixsdm with dbus-run-session for stability reasons
- Replaced the uninstall script's precise sed pattern deletion with universal pattern deletion
- Fixed an error in the install script that tried to create a .profile file even if one already existed
- Minor adjustments for readability
- Replaced "w" with "who" for readability and cleaner output

Version: v2.4
- Changed the display-related switch statement to an if-else statement
- printf fixes
- Minor cleanup
- Replaced all switch statements with if statements in sx script

Version: v2.5
- Reverted dbus-run-session $wm back to dbus-launch --exit-with-session $wm as no difference can be found
- Unified both uninstall and install scripts to a singular setup script

Version: v3.0
- Added basic color formatting for critical errors and important information
- Added condition check for either a WM/DE that was given by user, or if only one WM/DE exists in xrun() and wrun()
- Added condition check for $XCHECK and $WCHECK variables for rare excpetions of the user not having installed any graphical environments
- Added handling and adjusting of the $XDG_SESSION_TYPE variable
- Added failsafe for the -x and -w user options flags in the posixsdm script
- Added quotations to most variables inside the scripts to avoid globbing and odd behaviors
- Added multiple whitespace detections in setup and posixsdm
- Both wrun() and xrun() now print out the DE/WM of the user's choice into console
- Changed ">" overwrite operator with ">>" append operator in setup script
- Changed usage of sed to affect any .profile-related files in setup script
- Changed order of multiple condition checks in the setup script install section and the posixsdm script
- Changed sx and sxrc locations back to pre-v2.2
- Clean up and improve printf contents and comments
- Fixed a switch condition oversight in the wrun() function
- Fixed an issue in the -x and -w functions that would send the user to the main menu when using posixsdm not on TTY1
- Fixed spelling/grammar mistakes
- Fully implemented user option flags in the setup and posixsdm scripts
- Overhauled condition handling
- printf no longer calls variables directly
- Removed a condition check in setup script if no shell profile was found
- Removed a prompt in the setup script that was called whenever sx was already installed
- Removed a nested if-else statement in concheck() for simplification and performance reasons
- Reduced duplicated code and unnecessary whitespace in posixsdm and setup script
- Reduced usage of unnecessary commands and variables
- Replaced ls command with find command
- Reverted v2.4 switch to if-else replacements
- Split xrun() into xrun() and xsetup(), same for wrun() and wsetup()
- Updated README

Version: v3.1
- Added $wm condition check in the concheck() function to run WM/DE requests called via the -x and -w parameters
- Changed help and error output of posixsdm parameters
- Removed unnecessary condition handling in concheck() function
- Removed dbus-launch command in wrun() function
- Removed $opt variable
- Rename GitHub folder
- Replaced $srv variable with $runner variable for readability
- Small simplification of more comments

Version: v3.2
- Added ability to specify which WM/DE the user can run on startup of posixsdm via setup script
- Added an extra check in the concheck() function to run sdmlogin() when not on TTY1
- Added a warning in posixsdm if user-specified DE/WM called via -x or -w parameter does not exist
- Added extra options -is and -iz for quick installation via BASH/SH and ZSH
- Added $param variable; primitive support to run DEs and WMs with parameters (only for debugging purposes, must be set manually)
- Added $dexec to avoid closing the shell after running a desktop when $param contains any strings
- Allow for startup parameters to either be lowercase or capitalized
- Changed setup script to permit running without parameters; hint to --help to see all available parameters
- Don't create posixsdm folder in .config if not installing minisx
- Expanded prompt texts for clarity and readability
- Overhauled and simplified README
- POSIXSDM can now be installed locally (recommended approach from now on)
- Re-arranged multiple lines in posixsdm and setup
- Re-implemented read lines for modern POSIX-compliant shells to reduce printf usage in prompts
- $wm now set at the start of script instead of inside the first switch statement
- Removed custom sx script
- Removed duplicate checking of $wcheck and $xcheck variables in wrun and xrun respectively
- Removed option to run the setup script with no parameters
- Removed unnecessary calling of printf in all scripts with read -rp, singular printf calls, etc
- Removed unnecessary condition checks of variables $xcheck and $wcheck in posixsdm
- Removed unnecessary curly braces around formatting and startup-related variables
- Reverted dbus-run-session removal [v2.5]
- Replaced sed regular expression matching with GNU grep for small speed improvements
- Replaced manual naming of scripts in the "usage" info segments with the $name variable
- Replaced $sdmlogin_run with $run_once variable in posixsdm
- Simplified printing of information in some segments
- Simplified detection of startx or sx via short-circuit logical operators to reduce duplicate code
- Updated README.md

Version: v3.21 (Hotfix)
- Changed multiple commands to be used with printf via command substitution 
- Changed X.Org and Wayland prompt printf lines to run after first sanity check
- Fixed an error with grep in the wsetup() function where a space was included
- Replaced $name variable in posixsdm to $title
- Updated README to improve visibility on GitHub

Version: v3.3
- Added $wm_full variable to redirect full DE/WM into local .profile
- Added basic Makefile for quicker deployment and removal of POSIXSDM
- Added short-circuit logical operators at start of setup and posixsdm to avoid duplicate code
- Adjusted formatting of posixsdm and the setup script slightly for better readability
- Call the runner() function with $runwm directly to reduce or simplify checks
- Changed all non-environment variables to be spelled in snake_case
- Changed while-true statements to contain colons (POSIX shell built-in) instead of "true" (potentially GNU coreutils)
- Fixed a small formatting and printing error in a printf call
- Fixed issues related to quoting of several variables
- Improved general formatting
- Changed switch statements to not use X as exit choice; use E instead (X is already used for Xorg options)
- Merge wrun() and xrun() to a singular, renamed function
- Merge wsetup() and xsetup() to a singular, renamed function
- Only set $wcheck and $wcheck variables when they aren't non-zero
- Pipe setup script's $runwm grep call into head with -n1 delimiter
- Removed "entered exit prompt" printf line
- Removed $title variable; manual naming saves space and is more efficient as of now
- Removed ability to use globbing in posixsdm to start DEs/WMs (can be done more elegantly via setup)
- Removed double checks in the setup script
- Removed redundant "-n" parameters for head calls
- Removed setup checks at start of script in favor of calling functions manually
- Removed superficial mention of the GPL license in the setup script
- Removed unnecessary comments
- Removed unnecessary creations of variables when command substitutions are possible to make use of
- Replaced $WM with $wm_input
- Replaced $env variable with $desk_env to avoid confusion and potential environment conflicts
- Replaced multiple function names with partially capitalized names for readability
- Updated README to include a new "Additional notes" section and debugging parameters information
- Use an underscore instead of az for read input prompt as dummy variable

Version: v3.4
- Misc. fixes (Lost CHANGELOG file, apologies!)
