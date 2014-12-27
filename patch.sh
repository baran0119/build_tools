#!/bin/bash
CUR_DIR=`pwd`
echo "Your cuurent dir is $CUR_DIR"

for PATCH in $(ls patches|grep .patch); do
	PATH2PATCH=`echo $PATCH|cut -d. -f1|sed 's:_:/:g'`
	echo "Patching $PATH2PATCH with $PATCH"
	cd $PATH2PATCH
	git apply $CUR_DIR/patches/$PATCH
	cd $CUR_DIR
done

echo "Patched"
