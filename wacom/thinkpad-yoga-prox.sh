#!/bin/bash

# Deactivate touchscreen when wacom pen is in proximity
# Activate touchscreen when wacom pen gets out

sleeptime="0.3s"
lastPenPosition="Proximity=Out"

while [ -z "$touchscreen" ]
do
    for touchscreen_name in "SYNAPTICS Synaptics Touch Digitizer V04" "ELAN Touchscreen"
    do
        if xinput --list | grep -q "$touchscreen_name"
        then
            touchscreen="$touchscreen_name"
            break
        fi
    done
    sleep $sleeptime
done

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
