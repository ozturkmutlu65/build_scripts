rm -rf .repo/local_manifests/
#repo init rom
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
#Local manifests
git clone https://github.com/ozturkmutlu65/local_manifest-b main .repo/local_manifests

#build
/opt/crave/resync.sh
. build/envsetup.sh
riseup ginkgo userdebug 
make installclean
rise b
