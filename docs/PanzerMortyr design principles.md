This document describes *PanzerMortyr* design principles and various other rules.


### Ü as source language

It's planned to develop *PanzerMortyr* using Ü programming language.
This language is memory-safe and robust and thus should provide good developer experience.

Usage of other programming languages should be minimized.
There are only a few exceptions:

* Some C library may be used for cross-platform OS interaction. SDL2, for example.
* A thirdparty library written in C or C++ may be used for decoding and playing original cinematics.
* Networking code may use a thirdparty cryptographic library, since writing own cryptography is expensive and potentially insecure.
* Some other thirdparty C or C++ code may be used for helper tools.

For other cases it should be enough to use Ü (including its standard library).


### *OpenGL* as primary graphical API

In order to achieve cross-platform support it's needed to use a cross-platform graphical API.
There are for now two such APIs - *OpenGL* and *Vulkan*.
*Vulkan* is too complicated for such simple project like *PanzerMortyr*, so it's easier to use *OpenGL*.

It's planned to use *OpenGL* version 3.3 - it's modern enough to allow some neat tricks, but not too new to make problems on old systems.
But it's possible to implement an alternative renderer using some older *OpenGL* version.

It's also possible to implement a software renderer or a renderer using some other graphical API, but this is future work, an *OpenGL*-based renderer should be written first.


### Game data is trusted

It should be expected that original game data is trusted - is generally correct and not malicious.
If something is broken, it's fine to trigger a graceful crash of the game, but not to trigger undefined behavior (via unsafe code).
Some investigation of original game files should be done in order to determine what is correct (what are limitations and special cases in original data).


### User input isn't trusted

It should be considered that users (players) can interact with *PanzerMortyr* in any practically-achievable way.
This includes usual in-game input, changes done menu, commands typed into the console and changes in the config file.
Thus such inputs should be sanitized to not cause a crash.


### Multiplayer architecture

Since the original game has multiplayer support, *PanzerMortyr* should have multiplayer support too.
This may be achieved by using client-server architecture, where one game instance works like a server (performs all game logic calculations) and all clients connected to it display results of these calculations.
Singleplayer code should be implemented in the client-sever way too, in order to simplify its code (avoid writing the same logic twice) and allow to play cooperative mode.

It should be also considered to implement client-side game logic calculation - where the server only distributes player inputs and game logic is calculated based on these inputs on each machine.
This approach requires implementing game logic in a deterministic way, which may require extra caution.


### No undefined behavior in safe code

In Ü it's possible to do dangerous stuff only in *unsafe* code.
Writing unsafe code requires some attention, one should avoid exposing unsafe behavior via safe interfaces.
*PanzerMortyr* should follow this rule.
A safe interface should work as expected or it should trigger *halt*, no silent undefined behavior should be caused.
The only exception are abstractions over graphical APIs - they should be written assuming no bad stuff happens like device context loss.


### Byte order should be expected

The original game was written for x86 processors and its data files store values in byte order of this CPU.
But *PanzerMortyr* may be theoretically run on a CPU with different bytes order, for such case it should perform necessary byte order swaps while loading original game data.


### No resource loading outside loading phase

All resources required for a particular game map (for game logic, rendering, sounds) should be loaded once at map start - without lazy loading later.
This includes resources requiring loading files from disk or resources requiring expensive computations.

The same should be for non-map related resources, like GUI and HUD images - they should be loaded once at game start.
The only exception are on-disk resources, which may be changed, like save file infos and images.

This requirement is necessary to avoid possible lags and FPS drops.


### Distributed files should be minimized

For installation simplicity *PanzerMortyr* should contain as little files in its distribution package as possible.
Dynamic libraries usage should be avoided (maybe with a couple of exceptions).
Additional resources (shaders, fonts, etc.) should be embedded into its main executable.

Executable files should be obviously optimized and should contain no debug information - in order to achieve good performance and small size.

No default config file should be shipped.
Such file with default values should be created at first launch.


### Advanced game data search

*PanzerMortyr* should require as little steps as possible to be able to work.
It should detect original game files in the current directory and in the directory where its executable is located.
Additionally it should detect original installation via registry (on Windows).

Since installing the original game first is tricky (especially on non-Windows systems) *PanzerMortyr* should be able to work with non-installed game data (disk image).
It may be achieved by adding disk image reading code into the *PanzerMortyr* executable or by writing a separate installer tool.
Only if it's very difficult to implement, end users should do depacking themselves by using a detailed instruction provided.
