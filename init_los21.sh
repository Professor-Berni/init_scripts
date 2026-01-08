#!/bin/bash

if [ -d .repo/manifests ] ; then
  rm -rf .repo/manifests
fi

if [ -d .repo/repo ] ; then
  rm -rf .repo/repo
fi

repo init -u https://github.com/Professor-Berni/android.git -b lineage-21.0 --git-lfs

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
  git fetch "https://github.com/Professor-Berni/android_device_lineage_sepolicy" lineage-21.0 && git cherry-pick 8b80ef55573d308da4a4254b3764557b6d6decc1^..990fc85267829576204725f1e63fcd7380de3be7
cd ../../..

cd system/sepolicy
  git fetch "https://github.com/Professor-Berni/android_system_sepolicy" lineage-21.0 && git cherry-pick 974da58cc64c99be80d102124f9b37c58b1967eb^..2ba145fc84cf8ad49ed5e89876f4de050576cd99
cd ../..
