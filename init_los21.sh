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

cd frameworks/base
	git fetch "https://github.com/K9100ii/android_frameworks_base" lineage-21.0 && git cherry-pick a17792870dce4aa0af9a5ec6a9c130bf5e078de2
cd ../..

