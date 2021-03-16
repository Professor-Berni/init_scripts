#!/bin/bash

# ****************************************
# *** Got to the working directory!!!! ***
# ****************************************

rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b cm-14.1

echo ">-- Check this repos for changes (if any -> update them):"
echo ">-- ====================================================="
echo ">-- LineageOS/android_frameworks_base;                *Level: 2021-03-02"
echo ">-- LineageOS/android_frameworks_native;              *Level: 2021-03-05"
echo ">-- LineageOS/android_packages_apps_Contacts;         *Level: 2019-08-06"
echo ">-- LineageOS/android_packages_apps_ContactsCommon;   *Level: 2019-08-06"
echo ">-- LineageOS/android_packages_apps_Dialer;           *Level: 2019-08-09"
echo ">-- LineageOS/android_packages_apps_ExactCalculator;  *Level: 2019-03-10"
echo ">-- LineageOS/android_packages_apps_PackageInstaller; *Level: 2021-01-06"
echo ">-- LineageOS/android_packages_apps_PhoneCommon;      *Level: 2019-08-06"
echo ">-- LineageOS/android_packages_apps_Settings;         *Level: 2021-02-03"
echo ">-- LineageOS/android_system_sepolicy;                *Level: 2017-09-23"
echo ">-- LineageOS/android_vendor_cm;                      *Level: 2020-03-01"
echo ""
read -p ">-- If ok, press [ENTER]!"

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
  cd vendor/fdroid
    ./get_packages.sh
  cd ../..
fi
