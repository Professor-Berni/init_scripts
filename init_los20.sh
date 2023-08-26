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
	git fetch "https://github.com/K9100ii/android_frameworks_base" lineage-20.0 && git cherry-pick 45ef73108dd9f7da60bd980bc86766487ffc223a
cd ../..

cd hardware/qcom-caf/msm8994/audio/
	git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/modules/Permission/
	git fetch "https://github.com/K9100ii/android_packages_modules_Permission" lineage-20.0 && git cherry-pick 19391070bb616e0a54586ddc2c4388ddf68fd509
cd ../../..
