#!/bin/bash

# ****************************************
# *** Got to the working directory!!!! ***
# ****************************************

rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b lineage-17.1

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
  cd vendor/fdroid
    ./get_packages.sh
  cd ../..
fi

cd frameworks/base
  git fetch "https://github.com/K9100ii/android_frameworks_base" lineage-17.1 && git cherry-pick 25ce89d201f939ff4f7fcbc4e23cc27ec7c37465
cd ../..
