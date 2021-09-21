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
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-17.1 && git cherry-pick 3e618628677ae036004d6aa1b386c03f399401b3
cd ../..
