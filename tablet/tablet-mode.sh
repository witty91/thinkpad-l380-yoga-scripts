#!/bin/bash
# When converted to tablet, switch off touchpad, trackpoint, and launch onboard
# Since opening and closing tabletmode is signaled by the same ACPI event, the script toggles parameters.
#
# https://github.com/admiralakber/thinkpad-yoga-scripts
#
# Acknowledgements:
# Modified from source: djahma - https://forum.manjaro.org/index.php?topic=9671.0
# and oggy-/thinkpad-yoga-rotate

export XAUTHORITY=`ls -1 /home/*/.Xauthority | head -n 1`
export DISPLAY=":`ls -1 /tmp/.X11-unix/ | sed -e s/^X//g | head -n 1`"

touchpad=$(xinput list-props "SynPS/2 Synaptics TouchPad" | grep "Device Enabled" | awk -F ":" '{print $2}')
if [ $touchpad -eq 1 ]; then
	xinput --set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 0
	xinput --set-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 0
	sudo -b -u \#1000 onboard
else
	xinput --set-prop "SynPS/2 Synaptics TouchPad" "Device Enabled" 1
	xinput --set-prop "TPPS/2 IBM TrackPoint" "Device Enabled" 1
	killall onboard
fi
