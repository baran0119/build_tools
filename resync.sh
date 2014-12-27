#/bin/bash

repo init -u https://github.com/CyanogenMod/android.git -b cm-12.0
repo forall -c 'git reset --hard ; git clean -fdx'

# Sync repositories
repo sync -f -j16

read -p "Patching now? [y] " ans
if [ "$ans" == "y" ] ; then
	./patch.sh
fi
