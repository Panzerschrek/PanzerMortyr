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
If something is broken, it's fine to trigger a graceful crash of the game, but not to trigger undefined behavior.
Some investigation of original game files should be done in order to determine what is correct (what are limitations and special cases in original data).


### Client-server architecture

Since the original game has multiplayer support, *PanzerMortyr* should have multiplayer support too.
This may be achieved by using client-server architecture, where one game instance works like a server (performs all game logic calculations) and all clients connected to it display results of these calculations.
Singleplayer code should be implemented in the client-sever way too, in order to simplify its code (avoid writing the same logic twice) and allow to play cooperative mode.


### No undefined behavior in safe code

In Ü it's possible to do dangerous stuff only in *unsafe* code.
Writing unsafe code requires some attention, one should avoid exposing unsafe behavior via safe interfaces.
*PanzerMortyr* should follow this rule.
A safe interface should work as expected or it should trigger *halt*, no silent undefined behavior should be caused.
The only exception are abstractions over graphical APIs - they should be written assuming no bad stuff happens like device context loss.


### Byte order should be expected

The original game was written for x86 processors and its data files store values in byte order of this CPU.
But *PanzerMortyr* may be theoretically run on a CPU with different bytes order, for such case it should perform necessary byte order swaps while loading original game data.


### Distributed files should be minimized

For installation simplicity *PanzerMortyr* should contain as little files in its distribution package as possible.
Dynamic libraries usage should be avoided (maybe with a couple of exceptions).
Additional resources (shaders, fonts, etc.) should be embedded into its main executable.

Executable files should be obviously optimized and should contain no debug information - in order to achieve good performance and small size.
