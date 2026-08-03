#!/bin/bash

# This script is only needed for launching FFmpeg build steps relying on using "bash" and other Unix-style tools.

# First param ($1) of this script is expected to be a path to the FFmpeg source directory.
# Second param ($2) of this script is expected to be a path to the build directory.

mkdir -p $2 &&\
cd $2 &&\

# Build static libraries of FFmpeg.
$1/configure --toolchain=msvc --prefix=../ffmpeg_install --disable-x86asm --enable-static --disable-shared --disable-debug --disable-network --disable-cuda-llvm --disable-d3d11va --disable-d3d12va --disable-dxva2 --disable-programs --disable-doc --disable-everything --disable-avdevice --disable-avfilter --disable-hwaccels --disable-swresample --enable-protocol=file --enable-decoder=cinepak --enable-decoder=indeo3 --enable-decoder=indeo5 --enable-decoder=pcm_s16le --enable-demuxer=avi &&\
make
