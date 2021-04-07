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

cd bionic/
  git fetch "https://github.com/TALUAtGitHub/android_bionic" lineage-17.1 && git cherry-pick e1e3f9df123f8777bc2831859c4b62544c777117
cd ..

cd frameworks/av
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_av" lineage-17.1 && git cherry-pick 59516cd4d9158ac5991d3beec79b4e6617b1c5b1^..f79ac375966db9bf6dc2f16be96dd02fb70d81ee
cd ../..

cd frameworks/base
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-17.1 && git cherry-pick 5d727004f90d011c033023e78da10321a94165d1^..2d3b941d9a1e77cc226c75215a5598739f8843d9
cd ../..

cd packages/apps/Eleven
  git fetch "https://github.com/LineageOS/android_packages_apps_Eleven" refs/changes/25/306325/4 && git cherry-pick FETCH_HEAD
cd ../../..

cd system/vold/
  git fetch "https://github.com/TALUAtGitHub/android_system_vold" lineage-17.1 && git cherry-pick 0a5a4c5805832c68e1e1f224db7f4bee0ac1f83d
cd ../..

