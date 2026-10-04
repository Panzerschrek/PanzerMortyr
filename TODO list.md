This list contains tasks to be done or tasks which may be done, but aren't strictly necessary.
Tasks affecting recreation of the original game have generally higher priority.
Tasks affecting overall result quality are also important.
Enhancements adding something new (like graphical effects) are of lesser priority.

Map format investigation:

* Investigate meaning of remaining fields of "ZvoxFogVolume" struct.
* Investigate meaning of remaining fields of "ZvoxTriggerVolume" struct.
* Investigate meaning of remaining fields of "ZpozEntityNavigationInfo" struct.
* Investigate what remaining fields of ZvoxCluster structure mean.
* Investigate exact meaning of many ZpozEntity fields.
* Investigate meaning of remaining fields of "ZpozMultiplayerSpawnPoint" struct.
* Investigate exact meaning of remaining fields of navigation graph structures.
* Investigate what remaining fields of "ZmapLamRainDroplet" struct mean.

Models format investigation:

* Investigate how LODs are stored and processed in models in #5 format variant.
* Investigate why HD textures are stored three times with no noticeable difference.

Other investigation:

* Investigate save files format - it may be useful.
* Investigate differences between regional versions.
* Investigate how original game console works (supported commands, history).
* Investigate command-line options of the original game.

Gameplay investigation:

* Investigate how enemies spot the player - their field of view, view distance, spot chance, etc.
* Investigate what some unknown fields of entity description format mean, especially ones which affect state transitions.
* Investigate misfire behavior.
* Investigate what kinds of entities are affected by gravity (what in an entity description turns gravity on and off).
* Investigate what "zarowka" entity property is and whether it's actually used.
* Investigate what "ponowny_atak" entity property means, how it affects enemies and what is its default value.

PanzerMortyr general:

* Consider performing even more advanced game data search - with more hardcoded paths, Windows registry fetches, etc.
* Ensure PanzerMortyr works properly on Wayland-based systems.
* Consider optimizing code performing serialization/deserialization (for game saving) - read/write scalars and arrays of scalars as byte arrays.
* Allow taking screenshots by pressing some key (like F11 or F12, maybe PrintScreen), so that no external tool is needed for taking screenshots.
* Consider selecting one of several possible camera positions for the spectator mode (on game startup) randomly, not always only the best position.
* Consider adding slight camera rotations for the spectator mode.

Support of the Russian game version (published by 1С):

* Detect this version properly.
* Convert contents of loaded text files containing strings displayed in UI from Windows-2151 to UTF-8.
* Hardcode font data for letters of the Russian alphabet, maybe even extract this hardcoded data from the executable of this version.
* Create Russian translations for hardcoded strings (displayed in menu).
* Consider supporting extracting data of this version in the CD image extractor.

PanzerMortyr game logic:

* Fix entity effects emitted at zero operation step. For some reason the number of steps from operation start is almost never zero.
* Consider implementing misfire - in the original game enemies sometimes don't shoot, even if shooting animation is playing.
* Consider optimizing global navigation graph calculation even more - to reduce map loading time.
* Consider not creating edges in global navigation graph requiring jumping down too deep (to avoid fall damage).
* Avoid creating global navigation graph nodes located in liquids, but allow them in shallow water (but not acid or lava).
* Consider implementing some physics or data hack to allow leaving a shallow pit with inclined walls on map 19.
* Consider making the false document tool better (compared to the original game) - don't treat it as dumb and magic invisibility.

PanzerMortyr multiplayer-specific game logic:

* Consider allowing playing cooperative/multiplayer maps as usual singleplayer ones. Maybe add a main menu item for this.
* Implement multiplayer game logic with client/server.
* Implement multiplayer-specific game modes.
* Make singleplayer mode tweaks for cooperative mode support.
* Implement logic specific for multiplayer entities.
* Implement weapon amplifier.
* Implement omni protection.
* Implement CTF flags.
* Consider using fixed point arithmetic for game calculations in order to make game logic deterministic (across different machines) and thus allowing multiplayer mode with client-side game logic calculations.

PanzerMortyr rendering:

* Support restarting video subsystem (in order to apply settings).
* Consider applying additional tessellation for tessellated polygons in order to perform smoother light values interpolation (naively triangulating them doesn't produce good result always).
* Consider optimizing calculating light from point light sources for models - avoid enumerating all lights.
* Consider performing some smoothing while applying ambient light (stored in 4x4x4 grid for each room cluster) to models.
* Consider drawing blob shadows under models (as some sort of decal?).
* Consider limiting the number of active dynamic light sources - to avoid huge performance drops.
* Allow switching to a fullscreen mode with refresh rate change.
* Implement visual effect specific for omni-protection item (multiplayer-only power-up).
* Consider speeding-up rain and snow particles fetching by cutting the fetch bbox by the view frustum.
* Consider speeding-up rain circles fetching by cutting the fetch bbox by the view frustum.
* Consider reducing power of local fog volumes (additive) due to global fog.
* Consider using the same code for local fog calculation for semitransparent geometry and for other geometry in software mode.

PanzerMortyr OpenGL rendering:

* Consider implementing multisample antialiasing (with proper support of fullscreen effects like fog).
* Consider drawing map polygons with detail textures (generate such textures somehow).
* Consider optimizing dynamic lighting even more by using stencil test for dynamic lights.
* Consider drawing mirror reflections in water surfaces (the original game has only reflective floors).

PanzerMortyr software rendering:

* Consider drawing remaining test primitives - triangles and sprites.
* Fix issues with hall-of-mirrors effect visible at some places on some maps where sky quads are missing or aren't large enough to cover the entire sky.
* Consider using textures dithering (as Unreal does).

PanzerMortyr menus and HUD:

* Consider allowing specifying custom window resolution for windowed mode on video settings page.
* Consider displaying in HUD amounts of tools in inventory, at least important ones - health, ammo.
* Consider drawing active tools at some edge (left or right) of the screen.
* Consider displaying some sort of a progress bar while going close to the map exit trigger - as RtCW does.
* Consider displaying some screen with map stats (completion time, killed enemies) at the end of a map - as Quake does.

PanzerMortyr sound:

* Consider implementing occlusion-based sound volume attenuation (reduce volume of a sound located behind a wall or in some other room).
* Allow selecting audio device via settings.
* Consider adding some workaround for cases when a game is loaded, but a restored sound source can't be started due to some other source with the same ID, which removal is still in progress.
* Consider emitting a sound while entering acid or lava different from the sound played upon water entering.

PanzerMortyr cinimatics:

* Consider reading/decoding video files in a separate thread to avoid blocking the main thread due to disk access.

CD image extractor:

* Consider supporting images in MDF/MDS format.
* Consider handling more CUE commands (investigate which commands are actually used in Mortyr CUE files).
* Consider adding more validation for contents of the given ISO file - make sure it's really a Mortyr ISO and not something else.

CI builds:

* Consider adding FreeBSD build.
* Consider adding OS X build.
