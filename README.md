## PanzerMortyr

*PanzerMortyr* is a reimplementation of the engine of the game [Mortyr 2093-1944](https://en.wikipedia.org/wiki/Mortyr).
It allows to play the original game on modern operating systems and with modern video/audio quality, assuming data of the original game is provided.


### How it's done

Data formats of the original game (archive file, map files, models) have been reverse-engineered and code loading them has been written.
Original game logic has been observed and reimplemented.
Many things required no investigation at all, since they are defined by plain text files (like entities and weapons description).
Other stuff needed (rendering, menu, input, sound) has been written around reimplemented game logic.

*PanzerMortyr* recreates logic of the original game pretty close, including behavior of enemies and other objects, balance, movement physics.
It's not an ideal copy, but practically close enough.
Since it's a recreation, it avoids some bugs present in the original game.
Obviously it improves overall quality - high resolution rendering with uncapped framerate is supported, high quality sound and a lot of other small improvements.
All (almost) changes and improvements are listed [here](docs/PanzerMortyr_improvements_and_changes.md).

*PanzerMortyr* is written mostly using the [Ü](https://github.com/Panzerschrek/U-00DC-Sprache/) programming language.
No thirdparty engine is used, anything is written from scratch.
The only exception are *SDL2* library for basic OS interaction and *FFmpeg* for cinematics playback (see more about it below).

No LLMs have been used in *PanzerMortyr* development.
All investigations of the original game have been done manually.
Each line of code is written by hand.
The overall technical design is a product of human's mind.


### System requirements

*PanzerMortyr* can work on 64-bit Windows 10 or newer.
Older Windows versions may work too, but it hasn't been tested.
GNU/Linux is also supported.

A CPU with architecture x86_64 is required.
Intel/Skylake and AMD/Zen processors or newer are supported.

800MB free disk space is needed (for both *PanzerMortyr* files and data of the original game).
At least 256MB of free memory is needed for running.

It's recommended to have a graphics card with OpenGL 3.3 support (with necessary drivers installed).
But it's not strictly necessary, since *PanzerMortyr* has also software rendering requiring no OpenGL at all.

A sound output device is recommended (a sound card, headphones/loudspeakers).
Stereo sound is supported, but nothing more complex than that.

Keyboard is necessary for controls.
Mouse/touchpad is supported, but it's not strictly necessary, it's possible to use only keyboard controls.
Joysticks and other controllers are (for now) not supported.


### Installation

Just download the archive for the latest build and unpack it.

If you already have the original game installed on your system, just copy contents of the archive into Mortyr's installation directory.
Then run `panzer_mortyr` executable, it should work properly (except music).

The recommended way of installation is to use the `cd_image_extractor` tool provided with *PanzerMortyr*.
Just put BIN/CUE files containing image of the original CD into the directory where `cd_image_extractor` executable is located and run it.
It should extract all data necessary, including music.
An ISO image can work too, but it contains no music.
If anything goes well, after the extraction the *Data* directory should contain game files (*main.hal* file, videos, music tracks).
If it's not the case, see the log file for clues what may went wrong.
After the data of the original game is successfully extracted, `panzer_mortyr` executable can be launched.

Installing from actual physical CD isn't supported yet.
If you have one, make a BIN/CUE image of it and process this image as described above.


### Settings

Various menu setting pages are implemented, a lot of stuff can be done with them.
Some settings aren't exposed in menu, but it's possible to change them by editing *panzer_mortyr.cfg* file directly.
You can, for example, choose custom windowed resolution using it.


### Gameplay tips

* Game progress is automatically saved only while going to the next level. It's recommended to save manually in other cases.
* *PanzerMortyr* is difficult to play, much like the original game. It's recommended to use "for kids'n grammas" difficulty, at least first time.
* Falling damage may hurt a lot. Be careful!
* Inventory items can be activated and deactivated (when no longer needed).
* Don't forget, that it's possible to use health and armor from the inventory!
* Defeating bosses requires nothing special, they can be killed with any weapon, but have a lot of hit-points.
* Explosive weapons and objects have huge damage radius. Make sure you stay far away from explosives.
* Cadent ā latere tuō mīlle et decem mīlia ā dextrīs tuīs, ad tē autem non appropinquābit.


### Missing features

Multiplayer isn't implemented and likely will never be implemented.
Implementing it requires substantial code redesign and a lot of testing, which doesn't worth it.

Adult mode/parental lock isn't implemented.
It's not really useless.


### Contributions

*PanzerMortyr* is a personal project of its author, not a community project.
So, no pull request and other code changes are accepted.
But bug reports and suggestions are welcome.


### Building from sources

See [the corresponding file](docs/Building_PanzerMortyr.md).

You may try building it for systems other then x86_64 Windows and GNU/Linux, but it's not guaranteed that it can be built and work properly.


### Thirdparty libraries

*PanzerMortyr* uses the following thirdparty libraries:

* [raylib](https://www.raylib.com/) is used, but only for development tools (not shipped in the result archive).
* [SDL2](https://libsdl.org/) is used for system interaction. It's statically linked.
* [FFmpeg](https://ffmpeg.org/) is used for cinematics playback. It's dynamically linked, since its license basically prohibits static linking with non-GPL code.

Their installation isn't required (they are included within *PanzerMortyr* archive), they are just mentioned for legal reasons.


### Authors

Copyright © 2025-2026 "Panzerschrek".
