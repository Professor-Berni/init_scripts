#!/bin/bash

current_dir=$(pwd)

if [ -d .repo/manifests ] ; then
  rm -rf .repo/manifests
fi

if [ -d .repo/repo ] ; then
  rm -rf .repo/repo
fi

repo init -u https://github.com/LineageOS/android.git -b lineage-18.1 --git-lfs

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
  cd vendor/fdroid
    ./get_packages.sh
  cd $current_dir
fi

if [ -d vendor/microG ] ; then
  cd vendor/microG
    ./get_packages.sh
  cd $current_dir
fi

cd packages/modules/NetworkStack
  git fetch "https://github.com/Professor-Berni/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd $current_dir

cd vendor/lineage
  git fetch "https://github.com/Professor-Berni/android_vendor_lineage" lineage-19.1 && git cherry-pick 9ae43aa9cb6b529038d413a58d33d7790096dd52
cd $current_dir
