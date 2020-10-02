#!/bin/bash

NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`


while ! [ -e /tmp/IsTerminateRemoteSettingsPath.txt ]
do
	echo "start wfb_rx -c 127.0.0.1 -u 9393 -p 90  $NICS_LIST \n"
	/usr/local/bin/wfb_rx -c 127.0.0.1 -u 9393 -p 90 -K /tmp/rx.key $NICS_LIST 

	NICS_LIST=`ls /sys/class/net/ | nice grep -v eth0 | nice grep -v lo | nice grep -v usb | nice grep -v intwifi | nice grep -v wlan | nice grep -v relay | nice grep -v wifihotspot`
        echo "/usr/local/bin/wfb_rx -c 127.0.0.1 -u 9393 -p 90 Restating with:  $NICS_LIST \n"
        sleep 2
done

