#!/bin/bash


rm -rf .repo/manifests

repo init -u https://github.com/LineageOS/android.git -b lineage-18.1 --git-lfs

repo sync --force-sync

if [ -d vendor/fdroid ] ; then
	cd vendor/fdroid
		./get_packages.sh
	cd ../..
fi

if [ -d vendor/microG ] ; then
	cd vendor/microG
		./get_packages.sh
	cd ../..
fi

cd packages/modules/NetworkStack
	git fetch "https://github.com/Professor-Berni/packages_modules_NetworkStack" 11 && git cherry-pick 22fd53a977eeaf4e36be7bf6358ecf2c2737fa5e
cd ../../..
