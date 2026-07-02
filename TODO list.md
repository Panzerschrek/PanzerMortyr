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

* Investigate how enemies spot the player - their field of view, view distance, spot chance, etc.
* Investigate what some unknown fileds of entity description format mean, especially ones which affect state transitions.
* Investigate how different entity parameters affect their behavior.
* Investigate misfire behavior.
* Investigate how many armor points enemies have, how their armor protects them and how many armor points they can pick-up.
* Investigate where maximum amount of current armor (not inventory armor) is specified.
* Investigate what kinds of entities are affected by gravity (what in an entity description turns gravity on and off).
* Investigate what "zarowka" entity property is and whether it's actually used.
* Investigate whether bullet holes may be disabled by material properties.
* Investigate what "celnosc" entity property means and how it affects enemies.
* Investigate what "ponowny_atak" entity property means, how it affects enemies and what is its default value.
* Investigate what "dobry_wzrok" entity property means and how it affects enemies.
* Investigate what  "automatyczny_alarm" entity property means and how it affects enemies.
* Investigate how invisibility tool (false documents) works - how enemies react to the player having invisibility enabled, what happens if he shoots or attacks, what kind of whether some enemies can deactivate it and how, etc.

PanzerMortyr general:

* Allow changing shot and zoom controls (change mouse buttons and maybe even use key buttons).
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
* Make necessary changes to support working with data of the beta version of the original game.

PanzerMortyr game logic:

* Implement rare animation types used for some entities (barrel roll, flies).
* Implement logic elements specific for dog enemies.
* Implement remaining entity state transitions (used only by some enemy types).
* Implement ammo/health kit/armor seeking behavior for enemies.
* Break glass quads and quads with breakable materials while applying spash damage. The original game doesn't do this and it doesn't look right.
* Implement jetpack tool.
* Implement invisibility tool (false documents) and enemy properties allowing to uncover the player having invisibility.
* Implement flame particles emitted by explosive decorations ("wybuch_benzyny"/"plomienie").
* Damage and eventually kill the player spending too much time in water without swimming up for breathing.
* Spawn water splash particles if a projectile hits water surface.
* Spawn water circles if a projectile hits water surface.
* Do something with unconditional entity state transition "w_zasiegu_strzalu_b" - try making it somewhat random.
* Perform alarm-based enemy state transition with a delay, where it makes sense.
* Consider creating patches for ZINF-files for fixing some errors in them.
* Implement misfire - sometimes enemies don't shoot, even if shooting animation is playing.
* Adjust rotation angles for grenade projectiles, so that they look nicely.
* Consider performing proper player to entity visibility check while doing entity state transition based on "w_zasiegu_widocznosci" property.
* Make sure muzzle flashes are drawn as close to the original game as possible (their position is correct).
* Consider disabling all or at least some weapons of the player if weapon shot start position is in water or other liquid. The original game allow shooting in water, but PanzerMortyr probably shouldn't allow this.
* Consider extinguishing damaging flames on entities located inside liquids.
* Consider reducing brightness of Volkssturm smoking lights - they are way to bright.
* Perform camera rotation upon player's death as the original game does. It seems to be a full circle azimuth rotation and a rotation to some fixed elevation.
* Consider disabling burning effect for non-enemy entities. It doesn't look well for things made of iron or other non-burnable materials.
* Consider optimizing global navigation graph calculation even more - to reduce map loading time.
* Consider not creating edges in global navigation graph requiring jumping down too deep (to avoid fall damage).
* Avoid creating global navigation graph nodes located in liquids, but allow them in shallow water (but not acid or lava).
* Consider implementing some physics or data hack to allow leaving a shallow pit with inclined walls on map 19.

PanzerMortyr multiplayer game logic:

* Consider allowing playing cooperative/multiplayer maps as usual singleplayer ones. Maybe add a main menu item for this.
* Implement multiplayer game logic with client/server.
* Implement multiplayer-specific game modes.
* Make singleplayer mode tweaks for cooperative mode support.
* Implement logic elements specific for gestapo enemies (they are used only on single cooperative map 36).
* Implement logic specific for multiplayer entities.
* Implement weapon amplifier (multiplayer-only power-up).
* Implement omni protection (multiplayer-only power-up).
* Implement CTF flags (multiplayer).
* Consider using fixed point arithmetic for game calculations in order to make game logic deterministic (across different machines) and thus allowing multiplayer mode with client-side game logic calculations.

PanzerMortyr rendering:

* Apply additional tessellation for tessellated polygons in order to perform smoother light values interpolation (naively triangulating them doesn't produce good result always).
* Use smooth animation for animated models (with two or more frames interpolation).
* Draw animated water circle decals on map quads with "wet" property enabled in points where a rain particle hits such quad.
* Suport light soruces with conic shape and use such source kind of source for flashlight.
* Draw some fullscreen burning effect if the player is burning.
* Make the screen red upon taking damage.
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
* Implement visual effect specific for omni protection item (multiplayer-only power-up).

PanzerMortyr menus and HUD:

* Implement loading screen.
* Draw a screenshot for each save slot in load/save menus.
* Allow changing HUD position via settings menu.
* Implement some stub page for parental lock menu.
* Make advanced options menu functinal.
* Extend existing setting menus/add new ones for extra options specific for PanzerMortyr.
* Consider allowing specifying custom window resolution for windowed mode on video settings page.
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
