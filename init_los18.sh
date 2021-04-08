#!/bin/bash


rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b lineage-18.1

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
  cd vendor/fdroid
    ./get_packages.sh
  cd ../..
fi

cd bionic
  git fetch "https://github.com/TALUAtGitHub/android_bionic" lineage-18.1 && git cherry-pick cda74f189b1688d400707040d1090cdc6e1a93fe
cd ..

cd frameworks/av
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_av" lineage-18.1 && git cherry-pick 095f49d8f4a4e3a90fa2600c872d49e994092beb^..452b3ac84364fb11ed5e31321612b0775f8d8178
cd ../..

cd frameworks/base
  git fetch "https://github.com/TALUAtGitHub/android_frameworks_base" lineage-18.1 && git cherry-pick 38a0f8f9050f699bae2a2622c95bb239c2f93fdd
cd ../..

cd system/core
  git fetch "https://github.com/TALUAtGitHub/android_system_core" lineage-18.1 && git cherry-pick d87cb62446be1730660b0584e488652d0d4dfcb5^..0343cc039c31f6101d5c90ec446670ab983ae3e5
cd ../..

cd system/netd
  git fetch "https://github.com/TALUAtGitHub/android_system_netd" lineage-18.1 && git cherry-pick f7fd7b48358e44d7237ee4529f407ca215b55823
cd ../..

cd system/vold
  git fetch "https://github.com/TALUAtGitHub/android_system_vold" lineage-18.1 && git cherry-pick caf9a84d0f5d762276df859646f2957092ec30ad
cd ../..

cd packages/modules/NetworkStack
  git fetch "https://github.com/DerpFest-11/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..

cd vendor/lineage
  git fetch "https://github.com/TALUAtGitHub/android_vendor_lineage" lineage-18.1 && git cherry-pick bde1cf6a69314fa0527b23a80e1f7a42b2ebcafc
cd ../..
