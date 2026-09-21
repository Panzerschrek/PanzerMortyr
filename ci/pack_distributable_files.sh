#!/bin/bash

mkdir -p build_packed &&\
# Copy build artifacts
cp build/release/panzer_mortyr build_packed/panzer_mortyr &&\
cp build/release/panzer_mortyr_ffmpeg.so build_packed/panzer_mortyr_ffmpeg.so &&\
cp build/release/cd_image_extractor build_packed/cd_image_extractor &&\
# Copy licenses
mkdir -p build_packed/licenses &&\
cp SDL/LICENSE.txt build_packed/licenses/SDL_LICENSE.txt &&\
cp FFmpeg/LICENSE.md build_packed/licenses/FFmpeg_LICENSE.md &&\
cp docs/FXAA_LICENSE.txt build_packed/licenses/FXAA_LICENSE.txt &&\
# Copy files with game logic fixes
mkdir -p build_packed/Data &&\
git clone https://github.com/Panzerschrek/MortyrGameLogicFixes &&\
cp MortyrGameLogicFixes/*.STD build_packed/Data/
