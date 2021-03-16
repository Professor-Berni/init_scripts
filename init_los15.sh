#!/bin/bash

# ****************************************
# *** Got to the working directory!!!! ***
# ****************************************

rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b lineage-15.1

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
  cd vendor/fdroid
    ./get_packages.sh
  cd ../..
fi
