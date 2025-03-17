#!/bin/bash

if [ -d .repo/manifests ] ; then
  rm -rf .repo/manifests
fi

if [ -d .repo/repo ] ; then
  rm -rf .repo/repo
fi

if [ -d .repo/projects/frameworks/base.git ] ; then
  rm -rf .repo/projects/frameworks/base.git
fi

if [ -d frameworks/base ] ; then
  rm -rf frameworks/base
fi

repo init -u https://github.com/Professor-Berni/android.git -b lineage-19.1 --git-lfs

repo sync --force-sync

# *******************
# * Error handling: *
# *******************

status=$?
if [ $status -eq 1 ]; then
  echo "$(tput setaf 1)############################################$(tput setaf 0)"
  echo "$(tput setaf 1)# An error occurred during initialization! #$(tput setaf 0)"
  echo "$(tput setaf 1)############################################$(tput setaf 0)"
  exit
fi

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
  git fetch "https://github.com/LineageOS/android_frameworks_base" lineage-19.1 && git cherry-pick 0ae6d568dabe36c3d303849aee50ce01f58eea11^..74e3943cad42aa290e0e1bca593b0e9a356b72b3
  git fetch "https://github.com/LineageOS/android_frameworks_base" lineage-19.1 && git cherry-pick -m 1 56a3588d8b2c7002093fadd0cc80da7032203662
  git fetch "https://github.com/LineageOS/android_frameworks_base" lineage-19.1 && git cherry-pick -m 1 49397cc9b48c2fa9f0390743228a1c4017129408
  git fetch "https://github.com/LineageOS/android_frameworks_base" lineage-19.1 && git cherry-pick -m 1 d302ec78aaf1e9c448ff23e0b0535c5ff8aaddb2
cd ../..

cd frameworks/native
  git fetch "https://github.com/LineageOS/android_frameworks_native" lineage-19.1 && git cherry-pick e6ebb7ee33f1edac3d5254a77b163dbb3f3d207c^..b0d718631a8b82ccf3c21f9c63c91163ed79d0be
  git fetch "https://github.com/LineageOS/android_frameworks_native" lineage-19.1 && git cherry-pick -m 1 a94051aab5ca653f380d9ea309d37e15ed01c922
  git fetch "https://github.com/Professor-Berni/android_frameworks_native" lineage-19.1 && git cherry-pick e96ff91b4eb3b381088c791f031192b3950249dd
cd ../..

cd hardware/qcom-caf/msm8994/audio/
  git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916 && git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

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
