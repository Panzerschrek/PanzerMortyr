#!/bin/bash

mkdir -p build_packed &&\
cp build/release/panzer_mortyr build_packed/panzer_mortyr &&\
cp build/release/panzer_mortyr_ffmpeg.so build_packed/panzer_mortyr_ffmpeg.so &&\
cp build/release/cd_image_extractor build_packed/cd_image_extractor &&\
mkdir -p build_packed/licenses &&\
cp SDL/LICENSE.txt build_packed/licenses/SDL_LICENSE.txt &&\
cp FFmpeg/LICENSE.md build_packed/licenses/FFmpeg_LICENSE.md &&\
cp docs/FXAA_LICENSE.txt build_packed/licenses/FXAA_LICENSE.txt &&\
mkdir -p build_packed/Data
