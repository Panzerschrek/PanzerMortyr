#!/bin/bash

# This script is only needed for launching FFmpeg build steps relying on using "bash" and other Unix-style tools.

# First param ($1) of this script is expected to be a path to the FFmpeg source directory.
# Second param ($2) of this script is expected to be a path to the build directory.

mkdir -p $2 &&\
cd $2 &&\

# Build static libraries of FFmpeg.
$1/configure --toolchain=msvc --prefix=../ffmpeg_install --disable-x86asm --enable-static --disable-shared --disable-debug --disable-network --disable-cuda-llvm --disable-d3d11va --disable-d3d12va --disable-dxva2 --disable-programs --disable-doc --disable-everything --disable-avdevice --disable-avfilter --disable-hwaccels --disable-swresample --enable-protocol=file --enable-decoder=cinepak --enable-decoder=indeo3 --enable-decoder=indeo5 --enable-demuxer=avi &&\
make -j 4 &&\
# Create one huge "def" file containing all functions needed to be exported.
$1/compat/windows/makedef $1/libavformat/libavformat.v libavformat/*.o > ffmpeg.def &&\
$1/compat/windows/makedef $1/libavcodec/libavcodec.v libavcodec/*.o >> ffmpeg.def &&\
$1/compat/windows/makedef $1/libavutil/libavutil.v libavutil/*.o >> ffmpeg.def &&\
$1/compat/windows/makedef $1/libswscale/libswscale.v libswscale/*.o >> ffmpeg.def
