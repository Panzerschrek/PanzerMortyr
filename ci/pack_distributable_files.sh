#!/bin/bash

mkdir -p build_packed &&\
# Copy build artifacts
cp build/release/panzer_mortyr build_packed/panzer_mortyr &&\
cp build/release/panzer_mortyr_ffmpeg.so build_packed/panzer_mortyr_ffmpeg.so &&\
cp build/release/cd_image_extractor build_packed/cd_image_extractor &&\
# Copy licenses
mkdir -p build_packed/licenses &&\
cp LICENSE build_packed/licenses/PanzerMortyr_LICENSE &&\
cp SDL/LICENSE.txt build_packed/licenses/SDL_LICENSE.txt &&\
cp FFmpeg/LICENSE.md build_packed/licenses/FFmpeg_LICENSE.md &&\
cp docs/FXAA_LICENSE.txt build_packed/licenses/FXAA_LICENSE.txt &&\
# Copy README
cp README.md build_packed/README.md &&\
# Copy some docs
mkdir build_packed/docs &&\
cp docs/Building_PanzerMortyr.md build_packed/docs/Building_PanzerMortyr.md &&\
cp docs/PanzerMortyr_improvements_and_changes.md build_packed/docs/PanzerMortyr_improvements_and_changes.md &&\
# Copy files with game logic fixes
mkdir -p build_packed/Data &&\
git clone https://github.com/Panzerschrek/MortyrGameLogicFixes &&\
cp MortyrGameLogicFixes/*.STD build_packed/Data/
