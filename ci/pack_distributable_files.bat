mkdir build_packed
:: Copy build artifacts
copy build\release\panzer_mortyr.exe build_packed\panzer_mortyr.exe
copy build\release\panzer_mortyr_ffmpeg.dll build_packed\panzer_mortyr_ffmpeg.dll
copy build\release\cd_image_extractor.exe build_packed\cd_image_extractor.exe
:: Copy licenses
mkdir build_packed\licenses
copy SDL\LICENSE.txt build_packed\licenses\SDL_LICENSE.txt
copy FFmpeg\LICENSE.md build_packed\licenses\FFmpeg_LICENSE.md
copy docs\FXAA_LICENSE.txt build_packed\licenses\FXAA_LICENSE.txt
:: Copy files with game logic fixes
mkdir build_packed\Data
git clone https://github.com/Panzerschrek/MortyrGameLogicFixes
copy MortyrGameLogicFixes\*.STD build_packed\Data\
