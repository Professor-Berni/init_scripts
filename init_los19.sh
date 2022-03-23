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

cd frameworks/base
	git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-19.0 && git cherry-pick 91298ce054eac35e5d89ba7d971443c9fc4b1782
	git fetch "https://github.com/LineageOS/android_frameworks_base" refs/changes/92/326692/1 && git cherry-pick FETCH_HEAD
	git fetch "https://github.com/TARKZiM/android_frameworks_base" lineage-19.0 && git cherry-pick a01b7f3b4c98d9226ac1e054316945565df8b05e
# Caution!
# ========
# Be sure, that the files
# frameworks/base/core/res/res/values/lineage_config.xml
# and
# frameworks/base/core/res/res/values/lineage_symbols.xml
# are present before executing the next commands!
	git add .
	git commit
cd ../..

cd hardware/qcom-caf/msm8994/audio/
	git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/modules/adb/
	git fetch "https://github.com/LineageOS/android_packages_modules_adb" refs/changes/85/326385/1 && git cherry-pick FETCH_HEAD
cd ../../..

cd packages/modules/NetworkStack
	git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

cd system/bpf
	git fetch "https://github.com/LineageOS/android_system_bpf" refs/changes/91/320591/1 && git cherry-pick FETCH_HEAD
cd ../..

cd system/netd
	git fetch "https://github.com/LineageOS/android_system_netd" refs/changes/92/320592/1 && git cherry-pick FETCH_HEAD
cd ../..

