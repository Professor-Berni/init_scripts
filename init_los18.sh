#!/bin/bash


rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b lineage-18.1

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
  cd vendor/fdroid
    ./get_packages.sh
  cd ../..
fi

cd frameworks/base
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-18.1 && git cherry-pick c24c28db5112e38ba54b06d09e9d1a6a3c8b1edf
cd ../..

cd packages/modules/NetworkStack
  git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..
