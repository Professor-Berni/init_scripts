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

cd bionic
  git fetch "https://github.com/TALUAtGitHub/android_bionic" lineage-17.1 && git cherry-pick e1e3f9df123f8777bc2831859c4b62544c777117
cd ..

cd frameworks/av
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_av" lineage-17.1 && git cherry-pick fe0f4a374df8d61ede5d880e0df08071988a4293^..f04447abfb61aee3fd817a53759277603335cc85
cd ../..

cd frameworks/base
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-17.1 && git cherry-pick 9b9e13d38b450404015067f5416f756229bf27d7^..2d10bd7a63fd7d27a93d98c030ffcc0ca07c9e04
cd ../..

cd packages/apps/Eleven
  git fetch "https://github.com/LineageOS/android_packages_apps_Eleven" refs/changes/25/306325/4 && git cherry-pick FETCH_HEAD
cd ../../..

cd system/vold
  git fetch "https://github.com/TALUAtGitHub/android_system_vold" lineage-17.1 && git cherry-pick 0a5a4c5805832c68e1e1f224db7f4bee0ac1f83d
cd ../..
