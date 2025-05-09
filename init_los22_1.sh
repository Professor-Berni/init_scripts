#!/bin/bash

if [ -d .repo/manifests ]; then rm -rf .repo/manifests; fi

if [ -d .repo/repo ]; then rm -rf .repo/repo; fi

repo init -u https://github.com/Professor-Berni/android.git -b lineage-22.1 --git-lfs

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

cd packages/modules/SdkExtensions/
  git fetch "https://github.com/Professor-Berni/android_packages_modules_SdkExtensions" lineage-22.1 && git cherry-pick 3f321a49ed71faae6ab3b727a9a81bcd64a02c24
cd ../../..

cd device/lineage/sepolicy
#  git fetch "https://github.com/Professor-Berni/android_device_lineage_sepolicy" lineage-21.0 && git cherry-pick 8b80ef55573d308da4a4254b3764557b6d6decc1^..a03262e910d3ede716fd2091a7b33cc5be87bb60
cd ../../..
