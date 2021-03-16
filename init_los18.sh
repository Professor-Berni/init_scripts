#!/bin/bash


rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b lineage-18.1

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
  cd vendor/fdroid
    ./get_packages.sh
  cd ../..
fi

cd bionic/
  git fetch "https://github.com/TALUAtGitHub/android_bionic" lineage-18.1 && git cherry-pick cda74f189b1688d400707040d1090cdc6e1a93fe
cd ..

cd frameworks/base
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-18.1 && git cherry-pick 1c7774156bb0da0b809b46cc4bae66e03245758b
cd ../..

cd system/vold/
  git fetch "https://github.com/TALUAtGitHub/android_system_vold" lineage-18.1 && git cherry-pick caf9a84d0f5d762276df859646f2957092ec30ad
cd ../..

cd packages/modules/NetworkStack/
  git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

