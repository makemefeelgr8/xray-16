#!/bin/sh
SDK_CMAKE_VERSION="3.10.2.4988404" # Can be found in ${HOME}/Android/Sdk/cmake/
NDK_VERSION="21.3.6528147" #Can be found in ${HOME}/Android/Sdk/ndk/

NDKDIR=~/Android/Sdk/ndk/$NDK_VERSION
NDKBIN=$NDKDIR/toolchains/llvm/prebuilt/linux-x86_64/bin
NDKCROSS=$NDKBIN/arm-linux-androideabi-
NDKCC=$NDKBIN/aarch64-linux-android30-clang++
make HOST_CC="gcc -m64" CROSS=$NDKCROSS \
     STATIC_CC=$NDKCC DYNAMIC_CC="$NDKCC -fPIE -fPIC" \
     TARGET_LD=$NDKCC