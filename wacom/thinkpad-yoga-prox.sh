#!/bin/bash

# Deactivate touchscreen when wacom pen is in proximity
# Activate touchscreen when wacom pen gets out

export XAUTHORITY=`ls -1 /home/*/.Xauthority | head -n 1`
export DISPLAY=":`ls -1 /tmp/.X11-unix/ | sed -e s/^X//g | head -n 1`"

sleeptime="0.3s"
lastPenPosition="Proximity=Out"
while true
do 
    mssg="`xinput query-state "Wacom ISDv4 EC Pen stylus" | grep Proximity`"
    if [ ${#mssg} -gt 1 ]
    then
        inout="`echo $mssg | awk '{print $3}'`"
        case "$inout" in
            "Proximity=In" )
                if [ $lastPenPosition != $inout ]
                then
                    xinput --disable "ELAN Touchscreen"
                    lastPenPosition=$inout
                fi
                ;;
            "Proximity=Out" )
                if [ $lastPenPosition != $inout ]
                then
                    xinput --enable "ELAN Touchscreen"
                    lastPenPosition=$inout
                fi
                ;;
        esac
    fi
    sleep $sleeptime
done
