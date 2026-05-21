#!/bin/bash

mkdir ffmpeg_build &&\
cd ffmpeg_build &&\
# Build static libraries of FFmpeg.
../FFmpeg/configure --target-os=win64 --arch=x86_64 --toolchain=msvc --prefix=../ffmpeg_install --disable-x86asm --enable-static --disable-shared --disable-cuda-llvm --disable-d3d11va --disable-d3d12va --disable-dxva2 --disable-programs --disable-doc --disable-everything --disable-avdevice --disable-avfilter --disable-hwaccels --disable-swresample --enable-protocol=file --enable-decoder=cinepak --enable-decoder=indeo3 --enable-decoder=indeo5 --enable-demuxer=avi &&\
make -j 4
