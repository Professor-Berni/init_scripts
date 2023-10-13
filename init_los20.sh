#!/bin/bash

rm -rf .repo/manifests

repo init -u https://github.com/LineageOS-UL/android.git -b lineage-20.0 --git-lfs

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
	cd vendor/fdroid
		./get_packages.sh
	cd ../..
fi

if [ -d vendor/microG ] ; then
  cd vendor/microG
    ./get_packages.sh
  cd ../..
fi

cd frameworks/base
	git fetch "https://github.com/K9100ii/android_frameworks_base" lineage-20.0 && git cherry-pick fff62bd11cbfd2432a84088680ffd508a8238c77
cd ../..

cd hardware/qcom-caf/msm8994/audio/
	git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/modules/Permission/
	git fetch "https://github.com/K9100ii/android_packages_modules_Permission" lineage-20.0 && git cherry-pick 35c3ad52a0b1af32d308762bd8c63f3eb5a02aba
cd ../../..
