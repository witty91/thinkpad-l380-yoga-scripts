thinkpad-yoga-scripts
=====================

A collection of scripts and systemd units to restore functionality of the Lenovo ThinkPad Yoga S1.

Tested on Arch Linux with MATE Desktop Environment.

# Scripts should fix:

- Screen rotation with accelerometer, including touchscreen, Wacom, and Touchpad/TrackPoint geometries
- Disabling of Touchscreen with proximity of Wacom digitizer
- Disabling of Clickpad and TrackPoint when moving to tablet mode

# TODO:
- Write the systemd units and PKGBUILD

# Dependencies
- acpid
- xinput
- xsetwacom
- onboard (optional for onscreen keyboard)
