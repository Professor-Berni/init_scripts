#!/bin/bash

rm -rf .repo/manifests

repo init -u https://github.com/LineageOS-UL/android.git -b lineage-19.1 --git-lfs

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

cd bootable/recovery
  git revert 7c1eb300fbcf789024da690c96adb167d31aa5a5
cd ../..

cd frameworks/av
  git fetch "https://github.com/Professor-Berni/android_frameworks_av" lineage-19.1 && git cherry-pick b64c8b1c1b37e19fe31786b436c571d735aa5f76^..2b40ffe62f9daaa5ad1e284a7908da1f3996baa6
cd ../..

cd frameworks/base
  git fetch "https://github.com/Professor-Berni/android_frameworks_base" lineage-19.1 && git cherry-pick e78129f0f145bc883aec9bf5f30a4ad02c7298cb^..f37c99b92e059c3907cc157b2445a7eea347910b
cd ../..

cd hardware/qcom-caf/msm8994/audio/
  git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd packages/modules/Permission/
  git fetch "https://github.com/K9100ii/android_packages_modules_Permission" lineage-19.1 && git cherry-pick f07fcd68f11d2fbc26763985e3775f89fc7533ea
cd ../../..

cd packages/modules/NetworkStack
  git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

cd system/bpf
  git fetch "https://github.com/K9100ii/android_system_bpf" android-12L && git cherry-pick a15ffea764407ad7a36edf10c939dc4a44b41d9b
cd ../..

cd system/core
  git fetch "https://github.com/LineageOS/android_system_core" refs/changes/12/317912/2 && git cherry-pick FETCH_HEAD
cd ../..

cd system/netd
  git fetch "https://github.com/K9100ii/android_system_netd" lineage-19.1 && git cherry-pick 1f89ad475f265d2f461498cd73b36eacf2915e24
cd ../..

cd vendor/lineage
  git revert 8f67d055b36d992f2f09aa6f733aa06ee3d5b917
  git revert f224255cd9869d289e9d3a186a40c51d1ea8876c
cd ../..
