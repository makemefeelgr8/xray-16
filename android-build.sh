#!/bin/sh
SDK_CMAKE_VERSION="3.10.2.4988404" # Can be found in ${HOME}/Android/Sdk/cmake/
NDK_VERSION="21.3.6528147" #Can be found in ${HOME}/Android/Sdk/ndk/

rm -r CMakeFiles
rm CMakeCache.txt

# Tell configure what flags Android requires.
export CFLAGS="-fPIE -fPIC"
export LDFLAGS="-pie"


${HOME}/Android/Sdk/cmake/$SDK_CMAKE_VERSION/bin/cmake .. \
    -DCMAKE_TOOLCHAIN_FILE=/home/q/Android/Sdk/ndk/$NDK_VERSION/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=arm64-v8a \
    -DANDROID_NATIVE_API_LEVEL=28 \
    -DANDROID_TOOLCHAIN=clang \
    -DANDROID_STL=c++_static \
    -DANDROID_NDK=${HOME}/Android/Sdk/ndk/$NDK_VERSION \
    -DCMAKE_MAKE_PROGRAM=${HOME}/Android/Sdk/cmake/$SDK_CMAKE_VERSION/bin/ninja \
    -Wno-dev \
    -GNinja \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_ANDROID_STL_TYPE=c++_static \
    -DNDK_VERSION=$NDK_VERSION \
    -DSDK_CMAKE_VERSION=$SDK_CMAKE_VERSION

#/home/q/Android/Sdk/cmake/3.10.2.4988404/bin/ninja -j9 -v -k 3
