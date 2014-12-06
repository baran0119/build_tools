count=0
curr_folder="$PWD"
patches=(
                'frameworks/av frameworks_av.patch'
                'frameworks/base frameworks_base.patch'
                'frameworks/native frameworks_native.patch'
                'frameworks/opt/net/wifi frameworks_opt_net_wifi.patch'
                'frameworks/opt/telephony frameworks_opt_telephony.patch'
                'hardware/broadcom/libbt hardware_broadcom_libbt.patch'
                'packages/apps/Settings packages_apps_Settings.patch'
                'packages/services/Telephony packages_services_Telephony.patch'
                'system/core system_core.patch'
		'external/icu external_icu.patch'
		'packages/providers/MediaProvider packages_providers_MediaProvider.patch'
	)

while [ "x${patches[count]}" != "x" ]
do
	curr="${patches[count]}"
	patch=`echo "$curr" | awk '{print $2}'`
        folder=`echo "$curr" | awk '{print $1}'`

	cd "$folder"

	if [ "$1" = "reset" ]; then
		git reset --hard;
	else
		git apply "$curr_folder/$patch"
	fi

	cd "$curr_folder"

	count=$(( $count + 1 ))
done
