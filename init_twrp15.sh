#!/bin/bash

# ****************************************
# *** Got to the working directory!!!! ***
# ****************************************

rm -rf .repo/manifests

repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni -b twrp-8.1

repo sync --force-sync

