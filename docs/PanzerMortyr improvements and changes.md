This document describes what PanzerMortyr does better, what bugs it fixes and what is different compared to the original game.
Note that features not implemented yet are not listed here.
Update this document after something new is implemented.


### Graphics

Improvements:

* Support for windowed mode.
* Support for any possible screen resolution.
* Vsync can be turned on and off.
* 32-bit color.
* Trilinear and anisotropic texture filtering.
* Optional nearest texture filtering.
* Models are always drawn in full quality.

Fixed bugs:

* Stars (on maps with night sky) have even density in any direction. In the original game stars density straight above the head is much higher than in other directions.
* Sun and moon billboards don't rotate together with camera.
* Near Z plane clipping for first person weapon models is fixed.
* First person weapon models aren't ugly distorted while zooming.

Changes:

* Liquid surfaces use texture projection different from the original game and are animated via periodical texture coordinates shifts.
* Smoke trails look slightly different and live not so long as in the original game.
* Torch flames are slightly elongated compared to the original game.
* Light coronas are aligned in a little bit different way.
* Clouds look different, code calculating texture coordinates for them uses a more advanced formula.
* Sky background and sky elements may have slightly different brightness compared to the original.
* Lighting for models may be different from the original game, since lighting formulas are just guessed.
* Many elevators/doors/buttons are no longer pitch-dark, but their lighting is also static (doesn't change with position change).
* Glass breaking animation looks differently from the original game.


### Gameplay

Fixed bugs:

* Game speed doesn't depend on screen refresh rate.
* Elevators and doors reverse their movement if blocked, so that they don't occupy the same place as the blocker entity.

Changes:

* Crouching height seems to be slightly less compared to the original.
* Enemy navigation behavior may be somewhat different from the original game, since it's mostly guessed and not recreated exactly.
* Enemy movement and rotation speed may be different, since it's mostly guessed.
* Player movement works in a different way. Basic movement speed is the same, but acceleration/deceleration/turning may work differently.
* Swimming speed/acceleration/deceleration behavior is mostly guessed.
* Door/elevator/button movement speed may be different - it's just guessed.
* Zooming works differently - it requires holding the zoom button, maximum zoom is decreased and zooming speed is increased.
* Fire damage is calculated in a different way, so that even a single flame can hurt its target sometimes.
* Grenade throwing animation may look slightly different. The exact pattern of lowering animation in the original game is unclear.
* Sky decorations (aircrafts) move differently from the original game. It's unclear how exactly their movement should work, so, it's just guessed.


### HUD and menus

Improvements:

* HUD and menus are scaled for large screen resolutions.
* More than one active item can be displayed.
* The whole inventory is displayed when navigating it.
* Available keys are displayed.

Changes:

* HUD images use slightly different blending compared to the original game.
* Console looks differently.
* Menu cursor position may be different - it's mostly just guessed.
* A background texture pattern is displayed behind the main menu after launching the game instead of playing a prerecorded demo.


### General

Improvements:

* GNU/Linux is supported.

Fixed bugs:

* Starting a new game/a new map fully resets game state. In the original game going to a map via console preserves it.
* No player input from a prerecorded demo is applied shortly after starting a new game.

Changes:

* Console in PanzerMortyr has its own set of commands, supports changing settings, has auto-completion.
* Executable icon is different. The original one or one looking similar can't be used, since it's likely copyrighted.
