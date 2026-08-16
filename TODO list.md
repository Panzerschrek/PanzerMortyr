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
* Investigate misfire behavior.
* Investigate what kinds of entities are affected by gravity (what in an entity description turns gravity on and off).
* Investigate what "zarowka" entity property is and whether it's actually used.
* Investigate what "ponowny_atak" entity property means, how it affects enemies and what is its default value.

PanzerMortyr general:

* Add controls for selecting next and previous weapon (from available weapons).
* Consider embedding git revision into the game executable and showing it somewhere in the game.
* Consider performing even more advanced game data search - with more hardcoded paths, Windows registry fetches, etc.
* Ensure PanzerMortyr works properly on Wayland-based systems.
* Support russian version of the original game (published by 1С).
* Consider writing console messages into a file - to simplify troubleshooting.
* Consider optimizing code performing serialization/deserialization (for game saving) - read/write scalars and arrays of scalars as byte arrays.
* Consider implementing autosaves - create an autosave upon entering a level, upon picking-up a key, etc. Allow loading such saves from the load menu.
* Consider preventing saving or disabling save menu if no game is active.
* Allow taking screenshots by pressing some key (like F11 or F12, maybe PrintScreen), so that no external tool is needed for taking screenshots.
* Draw loading screen when transitioning to the next level and when loading audio data and world drawing data for it.
* Consider selecting one of several possible camera positions for the spectator mode (on game startup) randomly, not always only the best position.
* Consider adding slight camera rotations for the spectator mode.

PanzerMortyr game logic:

* Ensure all entity properties affecting state transitions are implemented.
* Break glass quads and quads with breakable materials while applying spash damage. The original game doesn't do this and it doesn't look right.
* Implement flame particles emitted by explosive decorations ("wybuch_benzyny"/"plomienie").
* Spawn water splash particles if a projectile hits water surface.
* Spawn water circles if a projectile hits water surface.
* Do something with unconditional entity state transition "w_zasiegu_strzalu_b" - try making it somewhat random.
* Perform alarm-based enemy state transition with a delay, where it makes sense.
* Consider creating patches for ZINF-files for fixing some errors in them.
* Implement misfire - sometimes enemies don't shoot, even if shooting animation is playing.
* Adjust rotation angles for grenade projectiles, so that they look nicely.
* Consider performing proper player to entity visibility check while doing entity state transition based on "w_zasiegu_widocznosci" property.
* Consider disabling all or at least some weapons of the player if weapon shot start position is in water or other liquid. The original game allow shooting in water, but PanzerMortyr probably shouldn't allow this.
* Perform camera rotation upon player's death as the original game does. It seems to be a full circle azimuth rotation and a rotation to some fixed elevation. Sometimes it's even a 180 degree flip.
* Consider disabling burning effect for non-enemy entities. It doesn't look well for things made of iron or other non-burnable materials.
* Consider optimizing global navigation graph calculation even more - to reduce map loading time.
* Consider not creating edges in global navigation graph requiring jumping down too deep (to avoid fall damage).
* Avoid creating global navigation graph nodes located in liquids, but allow them in shallow water (but not acid or lava).
* Consider implementing some physics or data hack to allow leaving a shallow pit with inclined walls on map 19.
* Consider making the false document tool better (compared to the original game) - don't treat it as dumb and magic invisibility.

PanzerMortyr multiplayer game logic:

* Consider allowing playing cooperative/multiplayer maps as usual singleplayer ones. Maybe add a main menu item for this.
* Implement multiplayer game logic with client/server.
* Implement multiplayer-specific game modes.
* Make singleplayer mode tweaks for cooperative mode support.
* Implement logic specific for multiplayer entities.
* Implement weapon amplifier (multiplayer-only power-up).
* Implement omni protection (multiplayer-only power-up).
* Implement CTF flags (multiplayer).
* Consider using fixed point arithmetic for game calculations in order to make game logic deterministic (across different machines) and thus allowing multiplayer mode with client-side game logic calculations.

PanzerMortyr rendering:

* Apply additional tessellation for tessellated polygons in order to perform smoother light values interpolation (naively triangulating them doesn't produce good result always).
* Somehow distort/colorize the whole image while swimming in water. Maybe even add or alter global fog if camera is in water volume.
* Consider optimizing calculating light from point light sources for models - avoid enumerating all lights.
* Consider drawing blob shadows under models (as some sort of decal?).
* Consider limiting the number of active dynamic light sources - to avoid huge performance drops.
* Consider applying dynamic light to glass and water quads.
* Allow turning global fog for snow/rain off.
* Allow turning breaking glass particles off.
* Modyfy pixels of alpha-tested textures having zero alpha, so that their color is equal to average color of adjacent pixels with non-zero alpha. This is needed to avoid black borders on alpha-tested billboards and decals.
* Allow switching to a fullscreen mode with refresh rate change.
* Implement visual effect specific for omni protection item (multiplayer-only power-up).

PanzerMortyr OpenGL rendering:

* Add support for MSAA (with proper support of fullscreen effects like fog).
* Consider drawing map polygons with detail textures (generate such textures somehow).
* Consider optimizing dynamic lighting even more by using stencil test for them.
* Consider optimizing drawing snow/rain - reject snow/rain particles for non-visible clusters and clusters located far away.
* Fall-back to software rendering if failed to create OpenGL context.

PanzerMortyr software rendering:

* Try speeding-up rasterization code by using fixed-point arithmetic for edges calculation.
* Try seeeding-up rasterization code by using depth buffer in u32 or even u16 format.
* Try speeding-up rasterization by correcting color and depth equations, so that it's not need to clamp interpolated color and depth values.
* Draw test primitives.
* Prepare alpha of map textures, including special ones (for liquids, atlases).
* Prepare special textures used by billboards and decals.
* Draw highlighted clusters.
* Draw map quads with caustics.
* Draw breakable map quads properly (don't draw broken ones).
* Draw glass geometry.
* Draw liquids.
* Draw light shafts.
* Draw models.
* Draw billboards.
* Draw decals.
* Draw snow.
* Draw rain.
* Draw water circles.
* Draw global fog.
* Draw local fog.
* Apply dynamic lighting to the wolrd, models, decals.
* Draw sky (with clouds).
* Draw sun/moon.
* Draw stars.
* Draw mirrors.
* Draw models covered with blood.
* Draw burning models.
* Implement night vision mode.
* Implement infrared vision mode.
* Apply world brightness setting.
* Consider using textures dithering (as Unreal does).
* Draw fullscreen blending effect (for pain, burning and other similar effects).
* Consider speeding-up software world drawing by performing drawing using multiple threads, when each thread writes into its own framebuffer and the master thread then combines these buffers together.

PanzerMortyr menus and HUD:

* Allow changing HUD position via settings menu.
* Implement some stub page for parental lock menu.
* Consider allowing specifying custom window resolution for windowed mode on video settings page.
* Consider displaying in HUD amounts of tools in inventory, at least important ones - health, ammo.
* Consider drawing active tools at some edge (left or right) of the screen.
* Allow configuring crosshair kind, investigate what kinds of crosshairs are available in the original game.
* Consider displaying some sort of a progress bar while going close to the map exit trigger - as RtCW does.
* Consider displaying some screen with map stats (completion time, killed enemies) at the end of a map - as Quake does.
* Consider allowing navigating menu using mouse left/right button clicks and mouse wheel.

PanzerMortyr sound:

* Consider implementing occlusion-based sound volume attenuation (reduce volume of a sound located behind a wall or in some other room).
* Allow selecting audio device via settings.
* Tune volume attenuation params and volumes of various game sounds.
* Consider adding some workaround for cases when a game is loaded, but a restored sound source can't be started due to some other source with the same ID, which removal is still in progress.
* Consider emitting a sound while entering acid or lava different from the sound played upon water entering.

PanzerMortyr cinimatics:

* Consider reading/decoding video files in a separate thread to avoid blocking the main thread due to disk access.

CD image extractor:

* Consider supporting images in MDF/MDS format.
* Consider writing a log file.
* Consider handling more CUE commands (investigate which commands are actually used in Mortyr CUE files).
* Consider adding more validation for contents of the given ISO file - make sure it's really a Mortyr ISO and not something else.
