thinkpad-yoga-scripts
=====================

A collection of scripts and systemd units to restore functionality of
the Lenovo ThinkPad Yoga S1.

These are different from other scripts in that the screen rotation is
automated with use of the inbuilt accelerometer. Also, acpid is not
used in order to toggle between tablet mode but rather binding to the
inbuilt switches.

Tested on Arch Linux with MATE Desktop Environment.

# Scripts should fix:

- Screen rotation with accelerometer, including touchscreen, Wacom,
  and Touchpad/TrackPoint geometries

- Disabling of Touchscreen with proximity of Wacom digitizer

- Disabling of Clickpad and TrackPoint when moving to tablet mode

# TODO:
- Test on different desktop environments (You can help!)

# Dependencies
- xrandr
- xinput
- xbindkeys
- kbd (for setkeycodes)
- systemd
- gawk
- xsetwacom (optional for wacom rotation)
- onboard (optional for onscreen keyboard)

# Manual installation

    sudo -s
    git clone https://github.com/admiralakber/thinkpad-yoga-scripts /opt/thinkpad-yoga-scripts
    cp /opt/thinkpad-yoga-scripts/systemd/* /usr/lib/systemd/system/

    systemctl start wacom-proximity@username.service
    systemctl start yoga-rotate@username.service
    systemctl start yoga-tablet.service
    