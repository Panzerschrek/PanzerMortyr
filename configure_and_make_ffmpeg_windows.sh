#!/bin/bash

# This script is only needed for launching FFmpeg build steps relying on using "bash" and other Unix-style tools.

# Build static libraries of FFmpeg.
../FFmpeg/configure --target-os=win64 --arch=x86_64 --toolchain=msvc --prefix=../ffmpeg_install --disable-x86asm --enable-static --disable-shared --disable-debug --disable-network --disable-cuda-llvm --disable-d3d11va --disable-d3d12va --disable-dxva2 --disable-programs --disable-doc --disable-everything --disable-avdevice --disable-avfilter --disable-hwaccels --disable-swresample --enable-protocol=file --enable-decoder=cinepak --enable-decoder=indeo3 --enable-decoder=indeo5 --enable-demuxer=avi &&\
make -j 4 &&\
# Create one huge "def" file containing all functions needed to be exported.
../FFmpeg/compat/windows/makedef ../FFmpeg/libavformat/libavformat.v libavformat/*.o > ffmpeg.def &&\
../FFmpeg/compat/windows/makedef ../FFmpeg/libavcodec/libavcodec.v libavcodec/*.o >> ffmpeg.def &&\
../FFmpeg/compat/windows/makedef ../FFmpeg/libavutil/libavutil.v libavutil/*.o >> ffmpeg.def &&\
../FFmpeg/compat/windows/makedef ../FFmpeg/libswscale/libswscale.v libswscale/*.o >> ffmpeg.def
