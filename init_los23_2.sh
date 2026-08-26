#!/bin/bash

current_dir=$(pwd)

if [ -d .repo/manifests ]; then rm -rf .repo/manifests; fi

if [ -d .repo/repo ]; then rm -rf .repo/repo; fi

repo init -u https://github.com/LineageOS/android.git -b lineage-23.2 --git-lfs

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
  cd $current_dir
fi

if [ -d vendor/microG ] ; then
  cd vendor/microG
    ./get_packages.sh
  cd $current_dir
fi

cd build/make
  git fetch "https://github.com/LineageOS-23-2-Z5P/android_build" lineage-23.2 && git cherry-pick 33da797c5a56becfa9f90119abc8ee349b139078
cd $current_dir

cd hardware/ril
  git fetch "https://github.com/Professor-Berni/android_device_sony_kitakami-common" lineage-21.0 && git cherry-pick 770260ee50f46af320ea04621c469f9d974a2920
cd $current_dir

cd system/sepolicy
  git fetch "https://github.com/Professor-Berni/android_system_sepolicy" lineage-23.2 && git cherry-pick 5818a2faf1cdf85cd5802dee354795cd0c795001
cd $current_dir

cd vendor/lineage/
  git fetch "https://github.com/Professor-Berni/android_vendor_lineage" lineage-23.2 && git cherry-pick 40b86dbda0b6095de7c3ec6b0b17d29ae1c8287f
cd $current_dir
