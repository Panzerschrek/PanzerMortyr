This list contains things to be done.

Map format investigation:

* Investigate the exact way per-quad texture scale is specified.
* Investigate how surfaces with emissive flag work.
* Investigate meaning of remaining fields of "ZvoxFogVolume" struct.
* Investigate meaning of remaining fields of "ZvoxTriggerVolume" struct.
* Investigate what Struct1 in "ZVOX.ANT" file actually is.
* Investigate what remaining fields of ZvoxCluster structure mean.
* Ensure light color is properly read from ZvoxLightSource structure.
* Investigate what data[1] of ZvoxLightSource means.
* Investigate how exactly light-related sprites (flames, coronas) are defined.
* Investigate how light source power is stored.
* Investigate exact meaning of many ZpozEntity fields.
* Investigate what ZpozStruct1 is and how it may be connected with navigation graphs in "MAPA*.LEM" file.
* Investigate meaning of remaining fields of "ZpozMultiplayerSpawnPoint" struct.
* Investigate what exact kind of visibility data is stored in ZPOZ file and why it seems to have 4 blocks of such data for each cluster.
* Investigate exact meaning of per-cluster sky-related data in "ZMAP.LEM" file.
* Investigate how buttons and doors function.
* Investigate how sky quads affect surrounding lighting.
* Investigate whether there is ambient light value stored somewhere on per-quad or per-cluster basis.
* Investigate how navigation graphs are used by enemies AI.
* Investigate exact meaning of remaining fields of navigation graph structures.
* Investigate how light shafts are represented in map data.
* Investigate what remaining fields of "ZmapLamRainDroplet" struct mean.

Textures/materials investigation:

* Identify more special material kinds.
* Investigate how sky works on quads with sky materials and on broken glasses.
* Investigate how lava texture affects lighting of surrounding geometry.
* Investigate how water surface is drawn.
* Investigate how underwater caustics work.
* Investigate how surfaces with planar reflections (reflective floors) are defined.

Models format investigation:

* Find exact framerate of per-vertex model animations. Maybe it's stored somewhere, or is just hardcoded for all models.
* Investigate how LODs are stored and processed in models in #5 format variant.
* Investigate why HD textures are stored three times with no noticeable difference.
* Calculate per-vertex normals based on triangle normals, since normals stored in the model file are sometimes broken

Lighting investigation:

* Investigate how dynamic lights work (weapon flashes, alarms) - including attenuation formula, line of sight check, surface angle-related attenuation.
* Investigate how dynamic model objects (characters, pick-ups) are lit (both by static and dynamic lights).
* Investigate how dynamic map objects (doors, lifts, buttons) are lit (both by static and dynamic lights).

PanzerMortyr general:

* Support loading game data files directly (not only from the game archive). It seems that the original game can do this.
* Perform more advanced search for the game installation directory by using current directory, current executable directory or even registry entries.
* Implement console.
* Implement menus.
* Implement settings (via some config file saved on-disk).
* Extend existing setting menus/add new ones for extra options specific for PanzerMortyr.
* Allow changing controls.
* Allow changing window size.
* Allow setting fullscreen mode (with possible resolution changing).
* Play cinematics at start.
* Share resources (like map data, models if necessary) among server and client code.
* Cache map files to avoid reloading them and recreating corresponding GPU resources if game is reloaded.
* Cache or even preload weapon models to avoid reloading them after level transition.

PanzerMortyr game logic:

* Implement items which can pic picked-up.
* Implement interactions with buttons, doors, elevators.
* Implement enemies - including their AI, navigation, movement, death.
* Implement player's weapons logic (shooting, ammo management).
* Implement player's death.
* Implement transition to next level.
* Implement game state save/loading.
* Implement multiplayer game logic with client/server.
* Implement multiplayer-specific game modes.
* Make singleplayer mode tweaks for cooperative mode support.
* Implement note items logic - show note text (it's actually an image) and pause the game while it's shown.

PanzerMortyr rendering:

* Create separate sub-meshes for clusters and render world polygons per-cluster.
* Draw tessellated geometry (from ZMAP*.LAM file) with per-vertex lighting.
* Apply additional tessellation for tessellated polygons in order to perform smoother light values interpolation (naively triangulating them doesn't produce good result always).
* Determine current cluster where camera is located and draw only clusters visible from it (using visibility information).
* Draw water quads properly.
* Draw underwater caustics properly.
* Draw sky properly where sky quads are located.
* Draw sky quads where windows are broken.
* Draw glass materials properly (with transparency).
* Draw light source sprites (flames, coronas).
* Draw fog where it should be.
* Draw map polygons and other objects (models, sprites) requiring blending in back to front order.
* Draw reflections in reflective surfaces (usually floors).
* Draw quads which are actually triangles (with pair of identical vertices) as single triangle.
* Draw items (pick-ups).
* Draw enemies (including animation).
* Draw first-person weapon.
* Draw projectiles (like Panzerfaust).
* Apply lighting to map quads.
* Apply lighting to models.
* Draw decals (bullet holes, blood).
* Implement dynamic lights (gun flashes, explosions).
* Draw weather effects (rain, snow).
* Draw breaking window animation (with falling splinters).

PanzerMortyr sound:

* Play event sounds - shots, footsteps, enemy sounds.
* Play main character speech (he says something sometimes).
* Play ambient sounds.
* Play CD music and/or music files ripped from the original CD.
* Implement 3D sounds - with distance-based attenuation and separate volume for left and right channel depending on head orientation.
* Perform smooth volume transition (smaple-by-sample) for sound sources which can change their volume (positional ones, for example).
* Cache or preload sound files to avoid starting playing a sound which isn't loaded yet.
