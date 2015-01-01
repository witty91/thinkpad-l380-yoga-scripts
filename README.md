thinkpad-yoga-scripts
=====================

A collection of scripts and systemd units to restore functionality of the Lenovo ThinkPad Yoga S1.

Tested on Arch Linux with MATE Desktop Environment.

# Scripts should fix:

- Screen rotation with accelerometer, including touchscreen, Wacom, and Touchpad/TrackPoint geometries
- Disabling of Touchscreen with proximity of Wacom digitizer
- Disabling of Clickpad and TrackPoint when moving to tablet mode

# TODO:
- Write PKGBUILD

# Dependencies
- acpid
- xinput
- xsetwacom
- onboard (optional for onscreen keyboard)

# Manual installation

sudo -s
git clone https://github.com/admiralakber/thinkpad-yoga-scripts /opt/thinkpad-yoga-scripts
cp /opt/thinkpad-yoga-scripts/systemd/* /etc/systemd/system/*
cp /opt/thinkpad-yoga-scripts/tablet/tablet-mode /etc/acpi/events
cp /opt/thinkpad-yoga-scripts/tablet/tablet-mode.sh /etc/acpi/actions
exit