AUTOBUILD_CONFIGURE_EXTRA="${AUTOBUILD_CONFIGURE_EXTRA:-} --arch=armel"
sed -i -E '/-armv6l$/! s/^Package: (.*)(-armv6l)*$/Package: \1-armv6l/g' debian/control
sed -i -E 's/^Depends: tvheadend/Depends: tvheadend-armv6l/g' debian/control
sed -i -E '/armv6l/! s/package=tvheadend([^ ]*)/package=tvheadend\1-armv6l/g' debian/rules
sed -i -E '/armv6l/! s/--destdir=debian\/tvheadend/--destdir=debian\/tvheadend-armv6l/g' debian/rules
EXTRA_X265_CMAKE_OPTS="${EXTRA_X265_CMAKE_OPTS:-} -DCROSS_COMPILE_ARM=1"