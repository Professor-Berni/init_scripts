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
	git fetch "https://github.com/TARKZiM/android_frameworks_av" lineage-19.1 && git cherry-pick e1f0d03b51a02e8c47aab2ff2c34065c02fbdcf0^..7e0c1c30c4aad9e142d8e2d0299852d21afafa6d
cd ../..

cd frameworks/base
	git fetch "https://github.com/LineageOS/android_frameworks_base" refs/changes/92/326692/1 && git cherry-pick FETCH_HEAD
	git fetch "https://github.com/TARKZiM/android_frameworks_base" lineage-19.1 && git cherry-pick 82bd67643442f9d9142da546b2f9d4249afdf9ed^..7ac28ba2921bb932bc94b2aa11fbe4ae3ee1136b
cd ../..

cd frameworks/opt/telephony
	git fetch "https://github.com/TARKZiM/android_frameworks_opt_telephony" lineage-19.1 && git cherry-pick 99504822011a7d87c01199c4b046548bca33a8b0^..6fe481ab5120cad9434768f44aca3e7e7ac393c0
cd ../../..

cd hardware/qcom-caf/msm8994/audio/
	git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/modules/adb/
	git fetch "https://github.com/LineageOS/android_packages_modules_adb" refs/changes/85/326385/3 && git cherry-pick FETCH_HEAD
cd ../../..

cd packages/modules/Permission/
	git fetch "https://github.com/TALUAtGitHub/android_packages_modules_Permission" lineage-19.1 && git cherry-pick cfa9ac0810f58002840b6090af9b5a5b4b0adf84
cd ../../..

cd packages/modules/NetworkStack
	git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

cd system/bpf
	git fetch "https://github.com/LineageOS/android_system_bpf" refs/changes/91/320591/2 && git cherry-pick FETCH_HEAD
cd ../..

cd system/core
	git fetch "https://github.com/TARKZiM/android_system_core" lineage-19.1 && git cherry-pick 15fe4b9e544c389d2d9b88d9396745e4f4af4f9b
	git fetch "https://github.com/LineageOS/android_system_core" refs/changes/12/317912/2 && git cherry-pick FETCH_HEAD
cd ../..

cd system/netd
	git fetch "https://github.com/LineageOS/android_system_netd" refs/changes/92/320592/2 && git cherry-pick FETCH_HEAD
cd ../..

cd vendor/lineage
	git fetch "https://github.com/TARKZiM/android_vendor_lineage" lineage-19.1 && git cherry-pick 80ddec1a9f6bf2368a5a391f5bd44140158f3c53
	git revert 8f67d055b36d992f2f09aa6f733aa06ee3d5b917
cd ../..
