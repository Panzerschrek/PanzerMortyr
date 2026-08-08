:: Install msys2 dependecies. They are needed for FFmpeg building.
"C:\msys64\usr\bin\bash.exe" -l "%~dp0/install_msys2_dependencies.sh"
:: Set environment variables for MSVC compier, linker and other tools. It's needed for building C dependencies.
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" amd64
:: Run Ü build system.
"compiler_windows/bin/u.._build_system1.exe" build --target-cpu skylake
:: Also run 32-bit build.
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" /clean_env
call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvarsall.bat" amd64_x86
"compiler_windows/bin/u.._build_system1.exe" build --target-triple i686-pc-windows-msvc
