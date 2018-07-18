Since there's no good universal daemon for convertible laptops yet, and
since I had to make the edits to AdmiralAkber's original code to get my
own laptop working, I've posted them here to help others. This works
for me - please let me know if you encounter any issues.

For the moment since I have nothing to add to it, the following
is the original README.

Share & Enjoy,
ffejery

thinkpad-yoga-scripts
=====================

A collection of scripts and systemd units to restore functionality of
the Lenovo ThinkPad Yoga S1.

These are different from other scripts in that the screen rotation is
automated with use of the inbuilt accelerometer. Also, acpid is not
used in order to toggle between tablet mode but rather binding to the
inbuilt switches.

Tested on Arch Linux with MATE, KDE 4.14, Gnome 3.14+. See
customization.

# Scripts should fix:

- Screen rotation with accelerometer, including touchscreen, Wacom,
  and Touchpad/TrackPoint geometries

- Disabling of Touchscreen with proximity of Wacom digitizer

- Disabling of Clickpad and TrackPoint when moving to tablet mode

# Usage/Customization:

Assuming installed as per the PKGBUILD

Depending whether or not your DE rotates the Wacom orientation with
the screen automatically edit the following file accordingly:

    /opt/thinkpad-l380-yoga-scripts/rotate/thinkpad-rotate.py

If you want to use an onscreen keyboard other than onboard, or disable
opening of any keyboard when moving into tablet mode edit:

    /opt/thinkpad-l380-yoga-scripts/tablet/mouse-toggle.sh

If your home directory is not in /home/<username> or your .Xauthority
file is located somewhere other than your home directory you will need
to edit the systemd modules. Likewise if your tablets display is not
:0.

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
    git clone https://github.com/ffejery/thinkpad-l380-yoga-scripts /opt/thinkpad-l380-yoga-scripts
    cp /opt/thinkpad-l380-yoga-scripts/systemd/* /usr/lib/systemd/system/

On Ubuntu 15.04, you may need to create the above directory.

    systemctl start wacom-proximity@username.service
    systemctl start yoga-rotate@username.service
    systemctl start yoga-tablet.service
    systemctl start yoga-backlight.service
    
