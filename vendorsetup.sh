FDEVICE="OP6xT"
#set -o xtrace

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w $FDEVICE)
   if [ -n "$chkdev" ]; then 
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w $FDEVICE)
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then
    export TW_DEFAULT_LANGUAGE="en"
    export LC_ALL="C"
    export OF_AB_DEVICE=1
    export ALLOW_MISSING_DEPENDENCIES=true
    export TARGET_DEVICE_ALT="enchilada,fajita,OnePlus6,OnePlus6T"
    export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export OF_MAINTAINER="SIDDK"
    export OF_HIDE_NOTCH=1
    export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
    export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
    export FOX_USE_BASH_SHELL=1
    export FOX_ASH_IS_BASH=1
    export FOX_USE_TAR_BINARY=1
    export FOX_USE_SED_BINARY=1
    export FOX_USE_XZ_UTILS=1
    export OF_QUICK_BACKUP_LIST="/boot;/data;/system_image;/vendor_image;"
    export OF_KEEP_DM_VERITY=1
    export OF_DISABLE_MIUI_OTA_BY_DEFAULT=1
    export OF_SCREEN_H=2280
    export OF_STATUS_H=100
    export OF_STATUS_INDENT_LEFT=48
    export OF_STATUS_INDENT_RIGHT=48
    export OF_CLOCK_POS=1
    export OF_RUN_POST_FORMAT_PROCESS=1
    export OF_SKIP_DECRYPTED_ADOPTED_STORAGE="1"
    export FOX_VERSION="R11.1"
    export FOX_R11=1
    export FOX_ADVANCED_SECURITY=1
    export OF_USE_TWRP_SAR_DETECT=1
	# let's see what are our build VARs
	if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
  	   export | grep "FOX" >> $FOX_BUILD_LOG_FILE
  	   export | grep "OF_" >> $FOX_BUILD_LOG_FILE
   	   export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
  	   export | grep "TW_" >> $FOX_BUILD_LOG_FILE
 	fi
fi
#
