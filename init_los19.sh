#!/bin/bash

if [ -d .repo/manifests ]; then rm -rf .repo/manifests; fi

if [ -d .repo/repo ]; then rm -rf .repo/repo; fi

if [ -d .repo/projects/frameworks/base.git ]; then rm -rf .repo/projects/frameworks/base.git; fi

if [ -d frameworks/base ]; then rm -rf frameworks/base; fi

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

cd hardware/qcom-caf/msm8994/audio/
  git fetch "https://github.com/LineageOS/android_hardware_qcom_audio" lineage-18.1-caf-msm8916
  git cherry-pick ce771ebbc1988db8ccefb20615a8ca6295c3e93a
cd ../../../..

cd hardware/ril/
  git fetch "https://github.com/Professor-Berni/android_device_sony_kitakami-common" lineage-19.1
  git cherry-pick 770260ee50f46af320ea04621c469f9d974a2920
cd ../..

cd packages/modules/adb
  git fetch "https://github.com/LineageOS/android_packages_modules_adb" lineage-19.1
  git cherry-pick ff1aa1f2309bcd12750fb4838ea4ca25fe644042
cd ../../..

cd packages/modules/NetworkStack
  git fetch "https://github.com/Professor-Berni/packages_modules_NetworkStack" 11
  git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

cd system/core
  git fetch "https://github.com/LineageOS/android_system_core" refs/changes/12/317912/2
  git cherry-pick FETCH_HEAD
cd ../..
