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
	git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-20.0 && git cherry-pick 0f7cfdc932cc54960e33aa242eeae229ebe50883
cd ../..

cd hardware/qcom-caf/msm8994/audio/
	git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/modules/Permission/
	git fetch "https://github.com/TALUAtGitHub/android_packages_modules_Permission" lineage-20.0 && git cherry-pick e186106e85bd013a47c85b6766b30499004a785b
cd ../../..

cd packages/services/Telecomm/
	git fetch "https://github.com/TARKZiM/android_packages_services_Telecomm" lineage-20.0 && git cherry-pick 285e29350fd7f19086fff6c52beaccafd0852176
cd ../../..
