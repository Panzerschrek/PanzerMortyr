:: First param (%~1) of this script is expected to be a path to the FFmpeg source directory.
:: Second param (%~2) of this script is expected to be a path to the build directory.
@ECHO OFF

set SOURCE_DIR=%~1
set BUILD_DIR=%~2

:: It's needed to inherit all PATH variables.
set MSYS2_PATH_TYPE=inherit

:: It's needed for preserving current directory while launching bash.
set CHERE_INVOKING=1

:: Use a hardcoded path to msys64 bash here.
"C:\msys64\usr\bin\bash.exe" -l "%~dp0/configure_and_make_ffmpeg_windows.sh" "%SOURCE_DIR%" "%BUILD_DIR%"

cd "%BUILD_DIR%"
cd ".."

:: Run MSVC linker using cmd, not bash.
link "%BUILD_DIR%/libavformat/avformat.lib" "%BUILD_DIR%/libavcodec/avcodec.lib" "%BUILD_DIR%/libavutil/avutil.lib" "%BUILD_DIR%/libswscale/swscale.lib" /DEF:"%BUILD_DIR%/ffmpeg.def" bcrypt.lib Ws2_32.lib /DLL /OUT:panzer_mortyr_ffmpeg.dll /MACHINE:x64 /defaultlib:msvcrt
