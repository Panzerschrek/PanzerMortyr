#!/bin/bash

# First param ($1) of this script is expected to be a path to the FFmpeg source directory.
# Second param ($2) of this script is expected to be a path to the build directory.

echo "Building FFmpeg located in \"$1\" using build directory \"$2\"" &&\
mkdir -p $2 &&\
cd $2 &&\

# Build static libraries of FFmpeg.
$1/configure --disable-x86asm --enable-static --disable-shared --disable-debug --disable-network --disable-alsa --disable-appkit --disable-avfoundation --disable-coreimage --disable-iconv --disable-libxcb --disable-libxcb-shm --disable-libxcb-xfixes --disable-libxcb-shape --disable-lzma --disable-schannel --disable-sdl2 --disable-securetransport --disable-xlib  --disable-zlib --disable-cuda-llvm --disable-libdrm --disable-v4l2-m2m --disable-programs --disable-doc --disable-everything --disable-avdevice --disable-avfilter --disable-hwaccels --disable-swresample --enable-protocol=file --enable-decoder=cinepak --enable-decoder=indeo3 --enable-decoder=indeo5 --enable-demuxer=avi &&\
make &&\
cd .. &&\
# Combine all needed static libraries into single shared library.
gcc -shared -o ffmpeg.so -Wl,--whole-archive $2/libavformat/libavformat.a $2/libavcodec/libavcodec.a $2/libavutil/libavutil.a $2/libswscale/libswscale.a -Wl,--no-whole-archive -Wl,-lm -Wl,-s -Wl,-soname,ffmpeg.so
