#!/bin/bash

mkdir ffmpeg_build &&\
cd ffmpeg_build &&\
# Build static libraries of FFmpeg.
../FFmpeg/configure --prefix=../ffmpeg_install --disable-x86asm --enable-static --disable-shared --disable-debug --disable-network --disable-alsa --disable-appkit --disable-avfoundation --disable-coreimage --disable-iconv --disable-libxcb --disable-libxcb-shm --disable-libxcb-xfixes --disable-libxcb-shape --disable-lzma --disable-schannel --disable-sdl2 --disable-securetransport --disable-xlib  --disable-zlib --disable-cuda-llvm --disable-libdrm --disable-v4l2-m2m --disable-programs --disable-doc --disable-everything --disable-avdevice --disable-avfilter --disable-hwaccels --disable-swresample --enable-protocol=file --enable-decoder=cinepak --enable-decoder=indeo3 --enable-decoder=indeo5 --enable-demuxer=avi &&\
make -j 4 &&\
# Combine all needed static libraries in single shared library.
gcc -shared -o ffmpeg.so -Wl,--whole-archive libavformat/libavformat.a libavcodec/libavcodec.a libavutil/libavutil.a libswscale/libswscale.a -Wl,--no-whole-archive -Wl,-lm -Wl,-s -Wl,-soname,ffmpeg.so
