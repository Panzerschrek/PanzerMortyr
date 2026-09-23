:: Install msys2 dependecies. They are needed for FFmpeg building.
"C:\msys64\usr\bin\bash.exe" -l "%~dp0/install_msys2_dependencies.sh"

::Create a file containing git revision.
git rev-parse HEAD > git_revision.txt

setlocal
:: Set environment variables for MSVC compier, linker and other tools. It's needed for building C dependencies.
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" amd64
:: Run Ü build system.
"compiler_windows/bin/u.._build_system1.exe" build --target-cpu skylake
endlocal

setlocal
:: Set environment variables for MSVC compier, linker and other tools. It's needed for building C dependencies.
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" amd64_x86
:: Create configuration_options.json. Disable FFmpeg for 32-bit build, since there are problems with linking it properly.
echo { "disable_ffmpeg" : "true " } > configuration_options.json
:: Run Ü build system.
"compiler_windows/bin/u.._build_system1.exe" build --target-triple i686-pc-windows-msvc --target-cpu pentium4 --configuration-options configuration_options.json
endlocal
