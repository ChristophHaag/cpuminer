#!/usr/bin/sh

export CURL_VER=7.37.0

export CC="/opt/android-ndk/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64/bin/arm-linux-androideabi-gcc --sysroot=/opt/android-ndk/platforms/android-19/arch-arm/ -static"
./autogen.sh

wget http://curl.haxx.se/download/curl-${CURL_VER}.tar.gz
tar xfz curl-${CURL_VER}.tar.gz
cd curl-${CURL_VER}
./configure --host=arm-linux-androideabi --enable-shared=no --prefix="$PWD/install"
make
make install
cd ..

./configure --host=arm-linux-androideabi --with-libcurl=curl-${CURL_VER}/install
make

echo "$PWD/minerd is your static binary"
