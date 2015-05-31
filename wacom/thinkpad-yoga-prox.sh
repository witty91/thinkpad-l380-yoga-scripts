#!/bin/bash

# Deactivate touchscreen when wacom pen is in proximity
# Activate touchscreen when wacom pen gets out

sleeptime="0.3s"
lastPenPosition="Proximity=Out"

if xinput --list | grep -q "ELAN Touchscreen"
then
    touchscreen="ELAN Touchscreen"
else
    touchscreen="SYNAPTICS Synaptics Touch Digitizer V04"
fi

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
                    xinput --disable "$touchscreen"
                    lastPenPosition=$inout
                fi
                ;;
            "Proximity=Out" )
                if [ $lastPenPosition != $inout ]
                then
                    xinput --enable "$touchscreen"
                    lastPenPosition=$inout
                fi
                ;;
        esac
    fi
    sleep $sleeptime
done
