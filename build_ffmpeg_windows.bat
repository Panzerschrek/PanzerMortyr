rem    It's needed to inherit all PATH variables.
set MSYS2_PATH_TYPE=inherit

rem    It's needed for preserving current directory while launching bash.
set CHERE_INVOKING=1

rem    Create build directory.
if not exist ffmpeg_build mkdir ffmpeg_build
cd ffmpeg_build

rem    Use a hardcoded path to msys64 bash here.
"C:\msys64\usr\bin\bash.exe" -l ../configure_and_make_ffmpeg_windows.sh

rem    Run MSVC linker using cmd, not bash.
link libavformat/avformat.lib libavcodec/avcodec.lib libavutil/avutil.lib libswscale/swscale.lib bcrypt.lib Ws2_32.lib /DLL /OUT:panzer_mortyr_ffmpeg.dll /MACHINE:x64 /defaultlib:msvcrt /DEF:ffmpeg.def
