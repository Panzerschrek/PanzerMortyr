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
:: Copy README
copy README.md build_packed\README.md
:: Copy some docs
mkdir build_packed\docs
copy docs\Building_PanzerMortyr.md build_packed\docs\Building_PanzerMortyr.md
copy docs\PanzerMortyr_improvements_and_changes.md build_packed\docs\PanzerMortyr_improvements_and_changes.md
:: Copy files with game logic fixes
mkdir build_packed\Data
git clone https://github.com/Panzerschrek/MortyrGameLogicFixes
copy MortyrGameLogicFixes\*.STD build_packed\Data\

:: Also pack 32-bit build.

mkdir build_packed_32
:: Copy build artifacts
copy build\i686-pc-windows-msvc\release\panzer_mortyr.exe build_packed_32\panzer_mortyr.exe
copy build\i686-pc-windows-msvc\release\cd_image_extractor.exe build_packed_32\cd_image_extractor.exe
:: Copy licenses
mkdir build_packed_32\licenses
copy SDL\LICENSE.txt build_packed_32\licenses\SDL_LICENSE.txt
copy FFmpeg\LICENSE.md build_packed_32\licenses\FFmpeg_LICENSE.md
copy docs\FXAA_LICENSE.txt build_packed_32\licenses\FXAA_LICENSE.txt
:: Copy README
copy README.md build_packed_32\README.md
:: Copy some docs
mkdir build_packed_32\docs
copy docs\Building_PanzerMortyr.md build_packed_32\docs\Building_PanzerMortyr.md
copy docs\PanzerMortyr_improvements_and_changes.md build_packed_32\docs\PanzerMortyr_improvements_and_changes.md
:: Copy files with game logic fixes
mkdir build_packed_32\Data
copy MortyrGameLogicFixes\*.STD build_packed_32\Data\
