#!/bin/bash

if [ -d .repo/manifests ] ; then
  rm -rf .repo/manifests
fi

if [ -d .repo/repo ] ; then
  rm -rf .repo/repo
fi

repo init -u https://github.com/LineageOS-UL/android.git -b lineage-21.0 --git-lfs

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

cd device/lineage/sepolicy
  git fetch "https://github.com/Professor-Berni/android_device_lineage_sepolicy" lineage-21.0 && git cherry-pick 105b3b4a3f3206ccce3b4ccf6aa999aa5612866f^..008ccd26ffb966fccdf544355ba5f3a323acbbe3
cd ../../..

cd system/sepolicy
  git fetch "https://github.com/Professor-Berni/android_system_sepolicy" lineage-21.0 && git cherry-pick 2b44a13c752da9806c10267f72f560236c6310e2^..e7a355abb79a0f15f6da8c67f22930b2ad0d1204
cd ../..
