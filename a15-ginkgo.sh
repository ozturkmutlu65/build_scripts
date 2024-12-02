#!/bin/bash

rm -rf .repo/local_manifests/

# repo init rom
repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/ozturkmutlu65/local_manifest -b main .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=mrgebesturtle 
export BUILD_HOSTNAME=shawkteam
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
riseup ginkgo userdebug
echo "============="

# Build rom
rise b

#upload
cd out/target/product/ginkgo
curl -T "RisingOS-6.0*.zip" -u :eecde83a-6624-4b7f-a227-73897e636945 https://pixeldrain.com/api/file/
