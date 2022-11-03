#!/bin/bash

rm -rf .repo/manifests

repo init -u https://Professor-Berni@github.com/LineageOS-UL/android.git -b lineage-20.0

repo sync -c --force-sync

if [ -d vendor/fdroid ] ; then
	cd vendor/fdroid
		./get_packages.sh
	cd ../..
fi

cd frameworks/base
	git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-20.0 && git cherry-pick fedf1c233d955f137fb3b8b5f1bc7facb4a3573f
cd ../..

cd hardware/qcom-caf/msm8994/audio/
	git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/services/Telecomm/
	git fetch "https://github.com/TARKZiM/android_packages_services_Telecomm" lineage-20.0 && git cherry-pick 285e29350fd7f19086fff6c52beaccafd0852176
cd ../../..

cd vendor/lineage
	git revert 8f67d055b36d992f2f09aa6f733aa06ee3d5b917
cd ../..
