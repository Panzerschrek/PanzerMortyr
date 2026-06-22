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
* Fog has higher quality - it's calculated per-pixel, not per-vertex. Only for semitransparent polygons it's calculated per-vertex (as in the original game).
* Dynamic light is calculated per-pixel (for world geometry).
* Camera position and positions and angles of game objects are calculated with sub-step precision and thus movements and rotations are smooth on high framerates (above 30fps).
* Decals aren't clipped by map quad borders where such clipping isn't necessary. They can be applied to multiple adjacent map quads.

Fixed bugs:

* Stars (on maps with night sky) have even density in any direction. In the original game stars density straight above the head is much higher than in other directions.
* Sun and moon billboards don't rotate together with camera.
* Near Z plane clipping for first person weapon models is fixed.
* First person weapon models aren't ugly distorted while zooming.
* Fog density isn't affected by zooming.
* Decals are drawn in mirrors properly.

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
* Fog looks a little bit darker (in the original game it is sometimes too bright) and its attenuation formula is likely different from the original.
* Local fog volumes use slightly different attenuation formula.
* Flat local fog volumes are box-shaped. In the original game they are always elliptical.
* Sky isn't affected by global fog at all.
* Light effects of projectile hits stay shorter for dim lights (compared to the original game).
* Snow/rain drawing params may be slightly different - this includes moving speed, density, particle size, drawing distance. But these params are generally close enough to the original game.
* Caustics look different. Different caustics texture is used, which is procedurally-generated, not the original one stored in a texture file. Caustics modulate underlying geometry light instead of adding it as the original game does.
* Bullet hit spark effects (MG-42, laser pistol) look a little bit different and use different from the original billboard.
* Clusters with notes are highlighted (their lighting is blinking), so that it's harder to miss a note.
* Entities with damaging flames attached are drawn with burning effect covering the entire body. In the original game this effect is different - it just uses flame billboards attached to a model.
* Blood covering entities are slightly darker compared to the original game.


### Gameplay

Improvements:

* Enemies navigation is slightly better - they are able to go in places impossible for enemies in the original game, they can follow the player far away from their start positions, their movement is generally smoother.

Fixed bugs:

* Game speed doesn't depend on screen refresh rate.
* Elevators and doors reverse their movement if blocked, so that they don't occupy the same place as the blocker entity.
* Pushable entities can't be pushed out of map bounds by pushing a chain of two or more entities.

Changes:

* Crouching height seems to be slightly less compared to the original.
* Enemy movement and rotation speed may be different, since it's mostly guessed.
* Player movement works in a different way. Basic movement speed is the same, but acceleration/deceleration/turning may work differently.
* Swimming speed/acceleration/deceleration behavior is mostly guessed.
* Door/elevator/button movement speed may be different - it's just guessed.
* Zooming works differently - it requires holding the zoom button, maximum zoom is decreased and zooming speed is increased.
* Fire damage is calculated in a different way, so that even a single flame can hurt its target sometimes.
* Damage from explosive entities is calculated in a different way.
* Grenade throwing animation may look slightly different. The exact pattern of lowering animation in the original game is unclear.
* Sky decorations (aircrafts) move differently from the original game. It's unclear how exactly their movement should work, so, it's just guessed.
* Notes (used for story telling) work differently. They are displayed if player is close to a note cluster and is looking towards it. Gameplay is not paused and it's possible to rotate the player's camera and move while a note is displayed. And it's possible to read the same note again, in the original game a note is shown only once by touching a note cluster and it can't be reactivated later.
* Fall damage for the player slightly differs from the original game, but is roughly the same.
* It's not possible to push an entity indirectly by pushing some another entity.
* Blood particles and blood stains work differently. Blood particles start moving in a direction roughly corresponding to the movement direction of it's parent projectile, they collide with map geometry and leave blood stain decals.
* Birds and rats may be placed and behave slightly differently compared to the original game. Their movement behavior is just guessed. Their numbers may be also different from the original game.
* Enemies affected by the mind-control weapon may behave slightly differently compared to the original game.


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
* Note images are shown at screen's center with scale and alpha depending on distance from the player's camera to the note cluster volume, not with fixed scale as the original game does.


### Sound

Improvements:

* PanzerMortyr outputs higher quality sound - with 44100Hz sample rate (by default) and 32-bit floating-point samples (where it's supported).
* More active sounds are supported compared to the original game.


Changes:

* Due to improved sound quality some sounds sound slightly differently compared to the original game.
* 3D sound params (attenuation formula, per-channel volume formula) are likely different from the original game.
* Ambient sound params (per-channel volume formula, max distance) are likely different from the original game.


### General

Improvements:

* GNU/Linux is supported.
* Cinematics playback doesn't require installation of system-wide codecs.

Fixed bugs:

* Starting a new game/a new map fully resets game state. In the original game going to a map via console preserves it.
* No player input from a prerecorded demo is applied shortly after starting a new game.

Changes:

* Console in PanzerMortyr has its own set of commands, supports changing settings, has auto-completion.
* Executable icon is different. The original one or one looking similar can't be used, since it's likely copyrighted.
* The intro cinematic is played not on game startup, but on starting a new campaign.
