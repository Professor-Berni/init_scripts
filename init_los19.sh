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
	git fetch "https://github.com/TARKZiM/android_frameworks_av" lineage-19.1 && git cherry-pick 79733533ce2a023c238cd6761d1870befb9623a0^..1220f837bce2c3e6e277967519ded8329edc6423
cd ../..

cd frameworks/base
	git fetch "https://github.com/LineageOS/android_frameworks_base" refs/changes/92/326692/1 && git cherry-pick FETCH_HEAD
	git fetch "https://github.com/TARKZiM/android_frameworks_base" lineage-19.1 && git cherry-pick 543a7ee8c1879cdbdf768616c8c7a111e4e80dcb^..66f6ec99790e720d962d0c23abb43d7494e4e746
cd ../..

cd frameworks/opt/telephony
	git fetch "https://github.com/TARKZiM/android_frameworks_opt_telephony" lineage-19.1 && git cherry-pick 02f99089f13b2a31a6d504e72528cb5721acf89b^..1aa194286690c4a39f4de4b918a4e7a57a9f28f2
cd ../../..

cd hardware/qcom-caf/msm8994/audio/
	git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/modules/adb/
	git fetch "https://github.com/LineageOS/android_packages_modules_adb" refs/changes/85/326385/3 && git cherry-pick FETCH_HEAD
cd ../../..

cd packages/modules/Permission/
	git fetch "https://github.com/TALUAtGitHub/android_packages_modules_Permission" lineage-19.1 && git cherry-pick fd0ecc1385bce4b3110a0fe3b41d70ef8ff2aecc
cd ../../..

cd packages/modules/NetworkStack
	git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

cd system/bpf
	git fetch "https://github.com/TALUAtGitHub/android_system_bpf" android-12L && git cherry-pick 8a3b12ec0c79193abca280741d469ba26085f029^..a15ffea764407ad7a36edf10c939dc4a44b41d9b
cd ../..

cd system/core
	git fetch "https://github.com/TARKZiM/android_system_core" lineage-19.1 && git cherry-pick 15fe4b9e544c389d2d9b88d9396745e4f4af4f9b
	git fetch "https://github.com/LineageOS/android_system_core" refs/changes/12/317912/2 && git cherry-pick FETCH_HEAD
cd ../..

cd system/netd
	git fetch "https://github.com/LineageOS/android_system_netd" refs/changes/92/320592/2 && git cherry-pick FETCH_HEAD
	git fetch "https://github.com/TALUAtGitHub/android_system_netd" lineage-19.1 && git cherry-pick d34ea34ba94a1832608119a384610eec91cb4f37
cd ../..

cd vendor/lineage
	git fetch "https://github.com/TARKZiM/android_vendor_lineage" lineage-19.1 && git cherry-pick 80ddec1a9f6bf2368a5a391f5bd44140158f3c53
	git revert 8f67d055b36d992f2f09aa6f733aa06ee3d5b917
	git revert f224255cd9869d289e9d3a186a40c51d1ea8876c
cd ../..
