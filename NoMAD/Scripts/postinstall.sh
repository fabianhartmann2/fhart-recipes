#!/bin/bash

#title          :postinstall.sh
#description    :Preinstall Script for NoMAD wit LaunchAgent
#author         :Fabian Hartmann
#date           :2018-02-26
#version        :0.1
#usage          :./postinstall.sh
#notes          :
#bash_version   :
#============================================================================



#============================================================================
### Revision History:
##
##	Date	Version			Personnel			Notes
##	----	-------			----------------	-----
##	2018-02-26	0.1			Fabian Hartmann Script created
##
#============================================================================
#
SCRIPT_NAME=`basename "${0}"`
SCRIPT_PATH=`dirname "${0}"`
loggedInUser=$(python -c 'from SystemConfiguration import SCDynamicStoreCopyConsoleUser; import sys; username = (SCDynamicStoreCopyConsoleUser(None, None, None) or [None])[0]; username = [username,""][username in [u"loginwindow", None, u""]]; sys.stdout.write(username + "\n");')
# Name of the Log File
logfilename="$SCRIPT_NAME"
# Log to a File if true
logtofile="false"

su $loggedInUser -c "launchctl load /Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"
