count=0
curr_folder="$PWD"
patches=(
		'hardware/broadcom/libbt 0001-Add-BT-support-for-s2ve-s2vep.patch'
		'external/chromium_org 0001-Fix-HWC-for-s2ve-s2vep.patch'
		'frameworks/av 0001-FRAMEWORKS-AV-PATCH-for-s2ve-s2vep-device.patch'
		'frameworks/native 0001-FRAMEWORKS-NATIVE-PATCH-for-s2ve-s2vep-device.patch'
		'frameworks/base 0001-Led-patch-for-s2ve-s2vep.patch'
		'packages/providers/MediaProvider 0001-PROVIDERS-MEDIA-MEDIAPROVIDER-PATCH-for-s2ve-s2vep-d.patch'
	)

while [ "x${patches[count]}" != "x" ]
do
	curr="${patches[count]}"
	patch=`echo "$curr" | awk '{print $2}'`
        folder=`echo "$curr" | awk '{print $1}'`

	cd "$folder"
	git apply "$curr_folder/$patch"
	cd "$curr_folder"

	count=$(( $count + 1 ))
done
