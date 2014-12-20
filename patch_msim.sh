count=0
curr_folder="$PWD"
patches=(
                'frameworks/base frameworks_base_msim.patch'
                'frameworks/opt/telephony frameworks_opt_telephony_msim.patch'
                'packages/services/Telephony packages_services_Telephony_msim.patch'
	)

while [ "x${patches[count]}" != "x" ]
do
	curr="${patches[count]}"
	patch=`echo "$curr" | awk '{print $2}'`
        folder=`echo "$curr" | awk '{print $1}'`

	cd "$folder"

	if [ "$1" = "reset" ]; then
		git reset --hard;
		git clean -fdx;
	else
		git apply "$curr_folder/$patch"
	fi

	cd "$curr_folder"

	count=$(( $count + 1 ))
done
