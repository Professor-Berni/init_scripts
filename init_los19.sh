#!/bin/bash

rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b lineage-19.1

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
	cd vendor/fdroid
		./get_packages.sh
	cd ../..
fi

cd art
	git fetch "https://github.com/LineageOS/android_art" refs/changes/97/318097/1 && git cherry-pick FETCH_HEAD
cd ..

cd bionic
	git fetch "https://github.com/Claymore1297/android_bionic" lineage-19.0 && git cherry-pick 0bd1d11aaede1f658d377e19c92d96fc709f6b95
	git fetch "https://github.com/Claymore1297/android_bionic" lineage-19.0 && git cherry-pick da090ee04042f64b96e7d15e32a80f4daf8743e6
cd ..

cd frameworks/av
	git fetch "https://github.com/TARKZiM/android_frameworks_av" lineage-19.1 && git cherry-pick 57a73f758a513c8fdbe379a438c635a42b779f33^..cf5d64d587531a13a09cb1ed3814c7d6e4e2a12f
cd ../..

cd frameworks/base
	git fetch "https://github.com/LineageOS/android_frameworks_base" refs/changes/92/326692/1 && git cherry-pick FETCH_HEAD
	git fetch "https://github.com/TARKZiM/android_frameworks_base" lineage-19.1 && git cherry-pick 43557a700ee6782f8975a9515661be706782c9ae^..5c9c6cdba014804cafe43097f94c723388fc29a8
cd ../..

cd hardware/qcom-caf/msm8994/audio/
	git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/modules/adb/
	git fetch "https://github.com/LineageOS/android_packages_modules_adb" refs/changes/85/326385/3 && git cherry-pick FETCH_HEAD
cd ../../..

cd packages/modules/NetworkStack
	git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

cd system/bpf
	git fetch "https://github.com/LineageOS/android_system_bpf" refs/changes/91/320591/2 && git cherry-pick FETCH_HEAD
cd ../..

cd system/core
	git fetch "https://github.com/TARKZiM/android_system_core" lineage-19.1 && git cherry-pick d4eb13ad0c6dda12307b242236d49b8db2ddb199
cd ../..

cd system/netd
	git fetch "https://github.com/LineageOS/android_system_netd" refs/changes/92/320592/2 && git cherry-pick FETCH_HEAD
cd ../..

cd vendor/lineage
	git fetch "https://github.com/TARKZiM/android_vendor_lineage" lineage-19.1 && git cherry-pick 80ddec1a9f6bf2368a5a391f5bd44140158f3c53
	git revert 8f67d055b36d992f2f09aa6f733aa06ee3d5b917
cd ../..
