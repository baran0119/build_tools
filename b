DEVICE=baffinlite
TYPE=userdebug

. build/envsetup.sh

lunch cm_${DEVICE}-${TYPE}
time brunch cm_${DEVICE}-${TYPE}
