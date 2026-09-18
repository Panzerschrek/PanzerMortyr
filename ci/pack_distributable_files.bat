mkdir build_packed
copy build\release\panzer_mortyr.exe build_packed\panzer_mortyr.exe
copy build\release\panzer_mortyr_ffmpeg.dll build_packed\panzer_mortyr_ffmpeg.dll
copy build\release\cd_image_extractor.exe build_packed\cd_image_extractor.exe
mkdir build_packed\licenses
copy SDL\LICENSE.txt build_packed\licenses\SDL_LICENSE.txt
copy FFmpeg\LICENSE.md build_packed\licenses\FFmpeg_LICENSE.md
copy docs\FXAA_LICENSE.txt build_packed\licenses\FXAA_LICENSE.txt
mkdir build_packed\Data
