This list contains things to be done.

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
* Invisitage command-line options of the original game.

Gameplay investigation:

* Investigate ammo/health kit/armor search behavior of enemies.
* Investigate how enemies spot the player - their field of view, view distance, spot chance, etc.
* Investigate what some unknown fileds of entity description format mean, especially ones which affect state transitions.
* Investigate how different entity parameters affect their behavior.
* Investigate misfire behavior.
* Investigate how many armor points enemies have, how their armor protects them and how many armor points they can pick-up.
* Investigate where maximum amount of current armor (not inventory armor) is specified.
* Investigate whether armor absorbs flame damage.
* Investigate what kinds of entities are affected by gravity (what in an entity description turns gravity on and off).
* Investigate what "zarowka" entity property is and whether it's actually used.
* Investigate whether it's possible for the player to drown in water by spending too much time in it.
* Investigate whether bullet holes may be disabled by material properties.

PanzerMortyr general:

* Support loading game data files directly (not only from the game archive). It seems that the original game can do this.
* Allow changing shot and zoom controls (change mouse buttons and maybe even use key buttons).
* Consider allowing playing cooperative/multiplayer maps as usual singleplayer ones. Maybe add a main menu item for this.
* Consider writing some kind of alternative installer - a tool, which depacks game data from the original game ISO or mdf/mds files.
* Draw loading screen before performing transition to the next level in game code and corresponding game and rendering resource loading.
* Consider embedding git revision into the game executable and showing it somewhere in the game.
* Allow turning off some costly effects via settings - breaking glass, fog, dynamic lighting, etc.
* Consider performing even more advanced game data search - with more hardcoded paths, Windows registry fetches, etc.
* Ensure PanzerMortyr works properly on Wayland-based systems.
* Consider writing console messages into a file - to simplify troubleshooting.
* Consider optimizing code performing serialization/deserialization (for game saving) - read/write scalars and arrays of scalars as byte arrays.
* Consider implementing autosaves - create an autosave upon entering a level, upon picking-up a key, etc. Allow loading such saves from the load menu.
* Consider preventing saving or disabling save menu if no game is active.
* Prevent user input being used by game logic code if user deactivates a menu page by pressing a key.
* Allow taking screenshots by pressing some key (like F11 or F12, maybe PrintScreen), so that no external tool is needed for taking screenshots.

PanzerMortyr game logic:

* Implement multiplayer game logic with client/server.
* Implement multiplayer-specific game modes.
* Make singleplayer mode tweaks for cooperative mode support.
* Consider enabled step movement on collisions with slightly-inclined walls, which should fix movement in some tricky places on some maps.
* Implement rare animation types used for some entities (barrel roll, flies).
* Implement logic elements specific for dog enemies.
* Implement logic elements specific for gestapo enemies.
* Implement logic specific for multiplayer entities.
* Implement weapon amplifier (multiplayer-only power-up).
* Implement omni protection (multiplayer-only power-up).
* Implement CTF flags (multiplayer).
* Consider using fixed point arithmetic for game calculations in order to make game logic deterministic (across different machines) and thus allowing multiplayer mode with client-side game logic calculations.
* Implement remaining entity state transitions (used only by some enemy types).
* Implement ammo/health kit/armor seeking behavior for enemies.
* Break glass quads and quads with breakable materials while applying spash damage.
* Implement jetpack tool.
* Implement invisibility tool (false documents) and enemy properties allowing to uncover the player having invisibility.
* Implement flame particles emitted by explosive decorations ("wybuch_benzyny"/"plomienie").
* Rework code doing first person weapon idle/walking animations. Consider adding states where no animation is played at all.
* Spawn bubble sprites while swimming in water.
* Spawn bubble sprites for projectiles moving in water.
* Spawn water splash particles if a projectile hits water surface.
* Spawn water circles if a projectile hits water surface.
* Do something with unconditional entity state transition "w_zasiegu_strzalu_b" - try making it somewhat random.
* Perform alarm-based enemy state transition with a delay, where it makes sense.
* Consider creating patches for ZINF-files for fixing some errors in them.
* Implement misfire - sometimes enemies don't shoot, even if shooting animation is playing.
* Consider storing a bounding box of the current attack target of an entity in the entity struture.
* Adjust rotation angles for grenade projectiles, so that they look nicely.
* Tune granades exposion delay.
* Tune projectiles maximum age.
* Implement behavior specific for the mind control weapon - with enemies attacking their allies.
* Consider performing proper player to entity visibility check while doing entity state transition based on "w_zasiegu_widocznosci" property.
* Make sure muzzle flashes are drawn as close to the original game as possible (their position is correct).
* Consider disabling all or at least some weapons of the player if weapon shot start position is in water or other liquid. The original game allow shooting in water, but PanzerMortyr probably shouldn't allow this.
* Consider extinguishing damaging flames on entities located inside liquids.
* Consider despawning flamethrower projectiles in liquids.
* Consider reducing brightness of Volkssturm smoking lights - they are way to bright.
* Perform camera rotation upon player's death as the original game does. It seems to be a full circle azimuth rotation and a rotation to some fixed elevation.
* Consider disabling burning effect for non-enemy entities. It doesn't look well for things made of iron or other non-burnable materials.
* Implement some sort of collision avoidance for enemies - to fix cases where enemies block each other in their movement. Maybe use global navigation graph for this and mark occupied edges or nodes.
* Consider optimizing global navigation graph calculation even more - to reduce map loading time.
* Consider not creating edges in global navigation graph requiring jumping down too deep (to avoid fall damage).
* Avoid creating global navigation graph nodes located in liquids, but allow them in shallow water (but not acid or lava).

PanzerMortyr rendering:

* Apply additional tessellation for tessellated polygons in order to perform smoother light values interpolation (naively triangulating them doesn't produce good result always).
* Use smooth animation for animated models (with two or more frames interpolation).
* Draw animated water circle decals on map quads with "wet" property enabled in points where a rain particle hits such quad.
* Suport light soruces with conic shape and use such source kind of source for flashlight.
* Draw some fullscreen burning effect if the player is burning.
* Add support for MSAA (with proper support of fullscreen effects like fog).
* Somehow distort/colorize the whole image while swimming in water. Maybe even add or alter global fog if camera is in water volume.
* Consider optimizing calculating light from point light sources for models - avoid enumerating all lights.
* Consider drawing blob shadows under models (as some sort of decal?).
* Allow changing brightness, maybe by tuning lights power.
* Consider drawing map polygons with detail textures (generate such textures somehow).
* Consider drawing some sort of fullscreen frame-like image of the acid protection suit mask if this powerup is active.
* Consider colorizing the whole image while the acid protection suit is active.
* Consider drawing some extra effects for the night vision mode, like fullscreen radial brightness gradient or something similar.
* Make sure clouds have proper scale and speed (similar to the original game).
* Consider optimizing dynamic lighting even more by using stencil test for them.
* Consider limiting the number of active dynamic light sources - to avoid huge performance drops.
* Consider applying dynamic light to glass quads.
* Consider optimizing drawing snow/rain - reject snow/rain particles for non-visible clusters and clusters located far away.
* Allow turning global fog for snow/rain off.
* Modyfy pixels of alpha-tested textures having zero alpha, so that their color is equal to average color of adjacent pixels with non-zero alpha. This is needed to avoid black borders on alpha-tested billboards and decals.
* Allow switching to a fullscreen mode with refresh rate change.

PanzerMortyr menus and HUD:

* Implement loading screen.
* Draw a screenshot for each save slot in load/save menus.
* Allow changing HUD position via settings menu.
* Allow setting inverted mouse via settings menu.
* Allow enabling/disabling mouselook via settings menu.
* Implement some stub page for parental lock menu.
* Make advanced options menu functinal.
* Extend existing setting menus/add new ones for extra options specific for PanzerMortyr.
* Consider allowing specifying custom window resolution in for windowed mode on video settings page.
* Show low health and armor numbers in HUD using red color.
* Consider displaying in HUD amounts of tools in inventory, at least important ones - health, ammo.
* Consider drawing active tools at some edge (left or right) of the screen.
* Allow configuring crosshair kind, investigate what kinds of crosshairs are available in the original game.
* Display short game-related mesages (as the original does).
* Consider displaying some sort of a progress bar while going close to the map exit trigger - as RtCW does.
* Consider displaying some screen with map stats (completion time, killed enemies) at the end of a map - as Quake does.

PanzerMortyr sound:

* Play player's out-of-ammo sounds (if the original game does this).
* Play CD music and/or music files ripped from the original CD. It's not so complex, since FFmpeg is already used in PanzerMortyr.
* Allow disabling Mortyr's voice (there is a menu option for this).
* Consider implementing occlusion-based sound volume attenuation (reduce volume of a sound located behind a wall or in some other room).
* Allow selecting audio device via settings.
* Tune volume attenuation params and volumes of various game sounds.
* Consider adding some workaround for cases when a game is loaded, but a restored sound source can't be started due to some other source with the same ID, which removal is still in progress.
* Consider emitting a sound while entering acid or lava different from the sound played upon water entering.
* Ensure player damage sounds are played as in the original game.

PanzerMortyr cinimatics:

* Consider reading/decoding video files in a separate thread to avoid blocking the main thread due to disk access.
