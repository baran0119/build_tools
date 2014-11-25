repo init -u https://github.com/CyanogenMod/android.git -b cm-12.0
repo forall -c 'git reset --hard ; git clean -fdx'

# Sync repositories
repo sync -f
