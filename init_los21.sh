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
  git fetch "https://github.com/Professor-Berni/android_device_lineage_sepolicy" lineage-21.0 && git cherry-pick fd626833804450dadb057d838a78f5b0f7756edb^..02cc887fdc94cec0201e6dfbfe12d37b41d2ef86
cd ../../..

cd system/sepolicy
  git fetch "https://github.com/Professor-Berni/android_system_sepolicy" lineage-21.0 && git cherry-pick ca6ecbf2127062924476ac06d8df96cecdde68a6
cd ../..
