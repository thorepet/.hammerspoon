#!/bin/bash

# Enable or disable the Do Not Disturb mode in macOS. The script edits the
# notification center's .plist file to toggle the mode. 
# A bug is that when disabling the mode, the notification center's icon in the
# menu bar stays greyed out. 

NCPATH=~/Library/Preferences/ByHost/com.apple.notificationcenterui
DATE="`date -u +\"%Y-%m-%d %H:%M:%S +000\"`"

if [ $1 -eq 1 ]
then
  defaults -currentHost write $NCPATH doNotDisturb -boolean true
  defaults -currentHost write $NCPATH doNotDisturbDate -date "$DATE"

  killall NotificationCenter
fi

if [ $1 -eq 0 ]
then
  defaults -currentHost write $NCPATH doNotDisturb -boolean false
  
  # When deactivating "by hand" the doNotDisturbDate field is removed.
  defaults -currentHost delete $NCPATH doNotDisturbDate

  killall NotificationCenter
fi

# https://gist.github.com/ryangreenberg/5267f68a8e7b07ea66370b4eb5580ab9
# 
# original code:
# #!/bin/bash

# set -eou pipefail

# # From https://heyfocus.com/enabling-do-not-disturb-mode and
# # https://apple.stackexchange.com/questions/145487

# if [[ $(defaults -currentHost read ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb) -eq 0 ]]; then
#   defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean true
#   defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturbDate -date "`date -u +\"%Y-%m-%d %H:%M:%S +000\"`"
#   killall NotificationCenter
#   echo "Do Not Disturb is enabled. Run $0 to turn it off (OS X will turn it off automatically tomorrow)."
# else
#   defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -boolean false
#   killall NotificationCenter
#   echo "Do Not Disturb is disabled. Run $0 to turn it on again."
# fi
