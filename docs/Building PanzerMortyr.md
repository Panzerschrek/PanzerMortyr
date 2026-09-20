### Supported systems

*PanzerMortyr* can be built for *Windows* and for *GNU/Linux*.
For now only x86_64 and (with complications) x86 architectures are supported, but adopting it for other systems and architectures shouldn't be that hard.


### Submodules update

Don't forget to `git submodule update --init` before building *PanzerMortyr*!


### Installing dependencies

*PanzerMortyr* is written in Ü.
You need the latest Ü version for your system available [here](https://github.com/Panzerschrek/U-00DC-Sprache/).

On *Windows* Ü requires *MSVC* installation (if the Ü build system was built with MSVC).
On *GNU/Linux* Ü requires *libc*.

*PanzerMortyr* uses *SDL2* for interacting with the system.
It ships its own source copy of the *SDL2* (using a submodule), so that you don't need to install it yourself.
But building it requires some dependencies.
This includes a C compiler (*GCC* or *MSVC*, *clang* may work too).
Also *CMake* and *ninja* are needed.
Lastly, *SDL2* may require some system-wide dependencies for some of its subsystems (like *X11*, *Wayland*, *alsa*, *pulseaudio* etc.).
If they are missing, *SDL2*  may be still built, but without these dependencies and thus something may not work correctly in the result *PanzerMortyr* executable.
See *SDL2* documentation for more details.

*PanzerMortyr* uses *raylib* for some of its tools (using a submodule).
This library is optional and its usage may be disabled.
Building it also requires a C compiler, *CMake* and *ninja*.
Also it may require installing some additional system-wide dependencies.

*PanzerMortyr* uses *FFmpeg* for cinematics playback (using a submodule).
Its usage may be disabled, in such case no cinematics will be played.
Building *FFmpeg* on *GNU/Linux* requires nothing special - a C compiler and *make*.
Building *FFmpeg* on *Windows* requires *MSYS2*, *make* installed within it (`pacman -S make`) and *MSVC*.
*MSYS2* should be installed in *C:\msys64*, this path is hardcoded in build scripts.


### Executing the build

Before performing the build process it's recommended to generate a file containing git revision.
Run `git rev-parse HEAD > git_revision.txt` in order to do this.
This file will be used by the build script later.
This step may be skipped, in that case the result *PanzerMortyr* executable will contain no proper version.

On *GNU/Linux* executing the build is easy.
It just requires launching the Ü build system (`u.._build_system1 build`) in the root source directory of the project (where the *build.u* file is located).
A debug build may be performed by providing `--build-configuration debug` option.

On *Windows* it's more complex.
The proper environment should be prepared first.
You need to call the *vcvarsall.bat* script provided with your *MSVC* installation with target architecture specified (like `amd64`).
Also make sure that *CMake* and *Ninja* are accessible via the `PATH` environment variable.
Then you need to run the Ü build system in the same console window or build script, so that it sees the environment prepared on the steps described above.

For x86_64 don't forget to use `--target-cpu skylake` option, so that the Ü compiler can better optimize result code by using newer CPU instructions.
For x86 builds (32-bit) use `--target-cpu pentium4` option for the same purpose.


### Building the result package

After a build is successfully finished, its results may be shipped.
You should take the following files and put them into the result archive (zip-file) for further redistribution:

* `panzer_mortyr` executable
* `panzer_mortyr_ffmpeg` shared library
* `cd_image_extractor` executable
* SDL license file
* FFmpeg license file
* FXAA license file
