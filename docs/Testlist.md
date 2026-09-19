This document contains a non-comprehensive list of things needed to be tested prior to a release or major update.

System support:

* The game should start and work properly on Windows 10 and 11 with x86_64 architecture, assuming hardware requirements are satisfied and OpenGL 3.3 (or later) drivers are present.
* The game should start and work properly on x86_64 GNU/Linux systems with X Window system or Wayland, assuming hardware requirements are satisfied and OpenGL 3.3 (or later) drivers are present.
* No administrator/root privileges should be necessary.
* No extra library dependencies should be present except system libraries (like kernel32.dll, libc), libraries shipped together with *panzer_mortyr* (like *FFmpeg*) or *glibc* (on GNU/Linux).
* On Windows the *panzer_mortyr* executable should have non-empty icon.

Command line:

* Running *panzer_mortyr* executable with *--help* and *-h* options should show a help message desribing command line options, the game itself should not start in such case.
* Running with *--new-game* option should immediately start a new game without entering main menu.
* Running with *--map* option should immediately start the given map without entering main menu.
* *--skill* option should properly set skill level for games started with *--new-game* and *--map* commands.
* *--config* option should allow specifying custom config file. Values from it should be read and written.
* *--game-directory* option should allow specifying game directory (where data is located) and should have priority over other directories in game data search.

Logging:

* `panzer_mortyr.log` file should we written on each launch.
* If there is already such file, it should be overwritten.
* The log file should contain the same log entries as shown in the terminal (if launched from one) and in the in-game console (with rare exceptions).
* Fatal errors (causing termination) should be logged properly.

Game data search:

* If there is a file *main.hal* in the current directory, it should be found and used.
* If there is a *Data* directory in the current directory and it contains a *main.hal* file, it should be found and used.
* If there is a file *main.hal* in the directory where *panzer_mortyr* executable is located, it should be found and used.
* If there is a *Data* directory the directory where *panzer_mortyr* executable is located and it contains a *main.hal* file, it should be found and used.
* If there is a file *main.hal* in the directory specified via *--game-directory* option, it should be found and used.
* If there is a *Data* directory in the directory specified via *--game-directory* option and it contains a *main.hal* file, it should be found and used.
* Case of the *Data* directory and the *main.hal* file should be irrelevant, *data*, *Data*, *DATA* directories should be accepted as valid data directories, *main.hal* and *MAIN.HAL* files should be handled equally.
* If game data is detected in more than one places, game data directory specified via *--game-directory* option should have priority over other directories.

Localization:

* English and Polish versions of the original game should be supported.
* All menu texts should use proper localization including texts added in PanzerMortyr and missing in the original game.
* In-game text notifications (like about pick-ups, weapon switching) should use proper localization (with a couple of exceptions like unavailable weapons).
* Notes should use proper localization.
* In-game messages about key requirements and secret areas should use proper localization.
* Console commands, internal setting names, console messages, fatal error message boxes should use English.

Cinematics:

* Game developer/publisher cinematics should be shown at game start, unless the game is started with *--new-game* and *--map* options.
* Intro cinematic should be shown upon starting a new game - via menu, console command or command line option.
* Outro cinematic should be shown upon finishing the last map of the game.
* Video playback should be smooth and contain (almost) no delays.
* Video and sound should remain synchronized.
* It should be possible to interrupt video playback by pressing escape, enter, space buttons or by closing the game window.
* If sound is disabled in settings videos should be still played properly (but without sound).

Menu:

* Menu should be somewhat scaled for large resolutions.
* Menu cursor should be properly shown on all pages. On pages with small text it should be small, on pages with large text it should be large.
* Navigation should be possible by using up and down keys or mouse wheel.
* Selecting a menu item should work by using enter key or left mouse button.
* Going back should be possible by using escape key or right mouse button.
* Closing menu should be possible by using escape key on the main page or right mouse button.
* The menu sound should be emitted while navigating and selecting menu items (unless sound is disabled).
* The menu sound should be emitted while changing settings in menu (boolean values, variants, sliders).
* Skill selected in the new game menu should be applied properly.
* Load/Save menu pages should contain several slots with user-defined slot names. Empty slots should be marked properly.
* Load/Save menu pages should contain a small screenshot for the corresponding saved game.
* Some stats for the selected save slot should be shown on load/save menu pages, including level name, skill, number of kills and the total number of enemies.
* Saving the game via save page should work properly. Loading it via load page should work too.
* Multiplayer page should be a stub.
* Parental lock/adult mode page should be a stub.
* It should be possible to change boolean settings on the options pages by pressing enter, left key and right arrow keys, left mouse button.
* It should be possible to change numeric and slider values on the options pages using left and right arrow keys. There should be limits for sliders and numeric values.
* Setting key bindings should work for keyboard keys, mouse buttons and mouse wheel.
* Pressing escape key when editing of a key binding is active should cancel editing.
* It shouldn't be possible to use escape key and ~ as key binding.
* All sound options should be functional.
* Video settings including video mode, fullscreen on/off, display index, etc. should work properly.
* Non-key-binding controls menu should work properly.
* Advanced options menu should work properly - all options should be editable and have effect.
* Before quitting a quit message should be shown. The message text should be selected randomly. It should be possible to quit by pressing enter or Y, it should be possible to abort quitting by pressing escape or N.

Loading screen:

* The loading screen should look like red text "loading" (localization-dependent) on black background.
* The loading screen should be shown upon game start (before showing startup cinematics).
* The loading screen should be shown before loading the initial map for he spectator mode.
* The loading screen should be shown before starting the new game.
* The loading screen should be shown after intro cinematic and before loading the start level.
* The loading screen should be shown before loading a game.
* The loading screen should be shown before starting playing a map via "map" console command.
* The loading screen should be shown upon transition to the next map.

In-game notifications:

* Text messages about selected weapons and pick-ups should be shown in the upper left corner of the screen.
* Text messages about unavailability of a weapon and/or ammo for it should be shown while trying to switch to a weapon which player doesn't have or to which it has no ammo.
* Text messages for map leave conditions should be shown when trying leaving a map having some leave condition (like killing a boss or collecting an item).
* Messages about required keys (golden/silver/blue) should be shown while pressing a button requiring such key if the player has no such key.
* Messages about opened secret areas should be shown.

Notes:

* Map objects where notes are placed (usually tables) should be highlighted - their geometry should change brightness periodically.
* When pointing the crosshair towards such object and staying close enough, the corresponding note image should be shown.
* Moving closer should make note image bigger and reduce its transparency.
* The game process should not be paused while a note image is shown (unlike in the original game), all player controls should remain functional.

Console:

* Console should be always available by pressing ~.
* Pressing ~ second time should turn console off.
* Console should be opened/closed with smooth animation.
* A background image should be used for console.
* The game should be paused when console is opened.
* Keyboard input should be redirected to console if it's active.
* It should be possible to enter a command.
* It should be possible to repeat the last entered command by pressing up arrow key.
* It should be possible to call console commands, including ones having arguments.
* By typing a name of a setting with no arguments its value should be displayed.
* By typing a name of a setting with single argument this setting should be set to the value of this argument.
* Autocompletion for commands and settings should work by pressing TAB. If there is more than one option, they all should be displayed.
* If a given string isn't a command or setting name, a message indicating this should be shown.
* At least some logging messages should be shown in console.
* Entered commands should be added into the console log.
* Both for commands and settings - and _ symbols should be interchangeable.

Crosshair:

* Crosshair should be drawn in the screen center (if *r_fixed_crosshair* is 1) or where the weapon points.
* Crosshair should be yellow if the weapon points toward map geometry, green if it points towards sky or red if it points towards an object (enemy or decoration) having a collider.
* It should be possible to configure crosshair shape.
* Three shapes should be available - small cross, large cross, Г-shaped. Also it should be possible to select empty shape (no shape at all).
* Crosshair shape selection in menu should work properly.

Spectator mode:

* After launching the game, some level should be loaded and shown in menu background.
* The level shown should be the level which was played last time.
* After the game end is reached and the end outro cinematic has been shown, the last level should be shown in menu background.
* Camera should be located somewhere in the level and point slightly (or not so slightly) down, it shouldn't be located out of playable bounds.
* Ambient sounds and entity sounds should be there.
* World simulation should work properly - with pick-ups rotating, enemies patrolling, etc.
* World simulation and sounds shouldn't be paused even if menu or console are active.
* It shouldn't be possible to control the specator camera using regular player controls.
* It shouldn't be possible to use weapons or items.
* No HUD should be shown.

Vsync:

* There should be an option in settings allowing turning vsync on and off.
* Changing vsync option should be applied instantly and require no game restart.
* Vsync state should have effect on FPS counter (*r_show_fps* setting).

Framerate limit:

* *r_max_fps* option should exist and have effect.
* Changing *r_max_fps* option should be applied instantly and require no game restart.
* It should be possible to set framerate limit in pretty wide range.
* Framerate limit should have effect on FPS counter (*r_show_fps* setting).

Controls:

* Keyboard input should work properly regardless on current keyboard layout.
* Mouse controls should work properly, including mouse motion, mouse buttons, mouse wheel.
* Touchpads should work like mouse.
* It should be possible to turn mouse-look off via settings.
* If menu or console is active, mouse cursor shouldn't be grabbed.
* If the game window is out of focus, no keyboard or mouse input should be applied.

Camera controls:

* It should be possible to rotate camera using mouse (if mouselook is enabled).
* Mouse sensitivity setting should have effect.
* It should be possible to invert mouse Y axis.
* It should be possible to rotate camera using controls specified in key bindings menu. Default controls should be keyboard arrow keys.
* It should be possible to zoom.
* Zooming should be always possible - with any active weapon (even with kick and knife).
* Zooming should be smooth.
* Zooming should remain active as long as zooming key or button is pressed.

Movement controls:

* It should be possible to move forward, backward, to the left and to the right.
* Jumping should work.
* Crouching should work by pressing a corresponding key or button. Crouching should remain active as long as the corresponding button is active.
* Swimming should work much like walking. Pressing jump or crouching keys should allow swimming up or down.
* Flying with jetpack should work much like walking. Pressing jump should apply acceleration upwards.
* Keeping the running key pressed should speed-up the player.
* If "always run" mode is active, the running key should slow-down the player.

Weapon controls:

* Shooting by pressing a corresponding key/button should be possible.
* Holding shooting key/button on should allow keeping firing even for weapons firing single shots.
* Rapidly clicking a shooting key should not allow firing faster then fire rate of the current weapon.
* It should be possible to use kick weapon by pressing a corresponding key regardless on current active weapon.

Tool controls:

* It should be possible to select next/previous tool via corresponding keys/buttons.
* It should be possible to activate a tool via a corresponding key/button press.
* It should be possible to deactivate an active tool by pressing the activation key again.
* Some tools should have dedicated keys activating them - environment suit, flashlight, night vision, infrared vision, jetpack.
* Weapons should be among tools. Selecting a weapon like a tool should be possible.

Weapon selection:

* It should be possible to select a weapon using dedicated weapon keys (numeric keys by-default).
* A weapon which the player doesn't have or to which it has no ammo should not be selected and a corresponding notification message should be show.
* It should be possible to select next or previous weapon using dedicated keys (mouse wheel by default).
* Weapons which the player doesn't have or to which it has no ammo should be skipped in next/previous weapon selection.
* Next/previous weapon selection should be done in a loop.
* It should be possible to rapidly jump over several weapons in next/previous weapon selection. Like if weapon 3 is selected, pressing next weapon key 4 times should select weapon 7.

HUD:

* HUD should be somewhat scaled for large resolutions.
* HUD icons should be displayed at the bottom of the screen or at the top (depending on the setting for this, available for change in the menu).
* A health icon should be displayed left from the screen center.
* Current health value should be displayed next to the health icon.
* Health value 20 or below should be displayed in red blinking digits.
* Current weapon icon should be displayed at the center of the screen.
* The amount of ammo for the current weapon should be displayed next to the weapon icon, unless a weapon requires no ammo.
* If 10% or less of ammo is left, the ammo value should be displayed in red blinking digits.
* An armor icon should be displayed right from the screen center.
* Current armor value should be displayed next to the armor icon.
* Armor value 20 or below should be displayed in red digits.
* Right from the armor icon an icon for the currently-selected tool should be shown.
* When selecting previous/next tool icons for all available tools should be displayed (if there is space for them).
* Icons for available keys (golden, silver, blue) should be displayed at the right edge of the screen.
* For each active tool its corresponding icon should be displayed above the armor icon.
* For each active tool its remaining amount should be displayed next to its icon.

World rendering:

* Map geometry should be shown properly with textures and static lighting.
* Animated textures (like traffic lights on map 4 or CSS logos) should work properly.
* Underwater map geometry should have animated caustics texture applied to it.
* Liquid surfaces should be semitransparent.
* Textures on liquid surfaces should be seamless.
* Some texture coordinates periodic animation should be applied to liquid textures.
* Glass should be semitransparent.
* Broken glass/stained glass quads shouldn't be displayed.
* Dynamic clusters (doors, elevators, buttons) should be displayed properly where they are.
* Decals should be displayed properly - clipped when needed and with alpha-test.
* Decals shouldn't be applied to breakable geometry or glass quads (both breakable and non-breakable).
* Decals should be applied to geometry of dynamic clusters.
* Water circles should be displayed on surfaces with wet materials where it's raining.
* Snow and rain should work properly. There should be no snow/rain inside buildings, only outside.
* Sky should be displayed properly, with colored gradient, with one of two scrolling layers of clouds (when needed), with stars and moon/sun (if needed).
* Models of entities and other game objects should be drawn properly, including smooth animation.
* Injured enemies should be draw covered with blood.
* Burning effect for models should work - with animated flames covering the entire model.
* Light shafts should be displayed where needed.
* Torch billboards and light coronas should be present.
* Various billboards for explosions, flames, smoke trails, projectiles and other game effects should be displayed properly.
* Semitransparent geometry should be sorted from back to front (their blending order should be correct).
* Dynamic lights should be applied to the world (except liquids and glass), dynamic clusters, models, decals, but not to billboards, rain/snow, water circles.
* Mirror floors should work properly - reflect all the world and blend this reflection with their own texture.
* Dynamic lights should be applied to mirror floors.
* Global fog on maps where it's enabled should be applied properly to all geometry except sky and first person weapon.
* Local fog volumes should work properly and use additive blending.
* Fog should be applied to semitransparent geometry too.
* Night vision effect should make the world brighter and paint it in green.
* Infrared vision effect should paint the world in red. Models except first person weapon models should have constant orange color and no textures.
* Fullscreen color blending (for pain and burning effects) should be displayed properly.
* Rejection of invisible map geometry and dynamic objects (models, billboards) located within them should work properly. See *r_show_stats* setting, when such stats are enabled, only a fraction of total map clusters should be drawn in any given moment. Only models located in visible map parts should be drawn.
* Frustum culling for models should work properly - models displayed behind the back shouldn't be draw at all.
* World brightness setting should be applied properly and affect equally brightness of all kinds of geometry.

Graphical settings:

* It should be possible to turn fog on/off.
* It should be possible to turn mirrors on/off.
* It should be possible to change mirror alpha.
* It should be possible to turn rain/snow on/off.
* It should be possible to turn caustics on/off.
* It should be possible to turn decals on/off.
* It should be possible to turn water circles on/off.
* It should be possible to turn dynamic lights on/off.
* It should be possible to turn all blood effects on/off.
* It should be possible to turn textures trilinear filtration on/off (in OpenGL mode only).
* It should be possible to change textures anisotropy (in OpenGL mode only).
* It should be possible to turn textures nearest filtration on/off separately for world, menu, HUD (in OpenGL mode only, in software mode it should be always nearest).
* It should be possible to change antialiasing properties.

Rendering mode setting:

* OpenGL mode should work properly.
* Software mode should work properly and be pretty performant.
* If initialization of OpenGL mode fails, software mode should be used.
* Upon first launch one of two rendering modes should be selected randomly with software mode having 25% chance and OpenGL mode having 75% chance.
* Rendering mode setting should work properly (but require game restart).

Antialiasing (OpenGL only):

* SSAA should be available and give the best quality - polygon edges should be smooth.
* FXAA should be available and give medium quality - with contrast polygon edges smoothed, but with smoothing also within contrast polygons areas.
* Using no antialiasing should be also possible.

Static map light effects:

* Animated fire billboards should be drawn where they should be. Each billboard should have its own animation phase. They should be aligned to Z axis.
* Corona billboards should be drawn where they should be. They should have constant screen size and always oriented towards camera.
* Blinking corona billboards should be drawn where they should be (like on map 4). Each billboard should have its own animation phase. They should be aligned to Z axis and have constant world size.

Collision detection and character physics:

* Player, enemies and other objects should be affected by gravity.
* Player, enemies and other objects shouldn't be able to pass through walls, floors and ceilings and generally their movement should be blocked by map geometry.
* Player and enemies should be able to climb stairs up to 16 units high without needing pressing jump button.
* It shouldn't be possible to climb a step if there is no room above the head.
* Player should be able to jump up to 64 units up.
* It should be possible to slide along walls by moving mostly along, but slightly towards the wall. Such movement shouldn't create much friction.
* It shouldn't be possible to stuck in map places with sharp corners.
* It shouldn't be possible to get out of bounds, except there is a hole in map geometry allowing it.
* Player movement should be accelerated. Acceleration (and deceleration) should depend on surface properties, like with snow surfaces having less acceleration/deceleration compared to stone surfaces.
* It should be possible to climb ramps up to certain angle. But it should not be possible to climb almost vertical (but slightly inclined) surfaces.
* Jumping should be available only if there is ground under the feet. It should instantly increase vertical speed (towards up direction).
* If the player is in air (falling), there should be still a possibility to accelerate/decelerate, but with greatly reduced acceleration/deceleration compared to walking.
* Camera Z position should be somewhat smoothed while climbing a staircase unless full crouching is active.
* Crouching should work properly and effectively reduce height of the player's bbox and allow passing into tight shafts like on map 9 or into a hatch on map 29.
* Crouching phase should be changed smoothly.
* Crouching should remain active as long as crouching button is pressed.
* Crouching should be preserved if there is no place above the head to stay.
* Keeping run/walk button pressed should slow-down the player if "always run" option is enabled and speed-up him otherwise.
* It should be possible to swim in water.
* Gravity in water should be weaker compared to the normal value.
* Swimming should use acceleration and deceleration.
* Jumping while staying on the bottom of a pool should be possible.
* It should be possible to leave a pool with difference between water level and floor level above less than 32 units.
* Player and enemies shouldn'd be able to pass through each other.
* Player and enemies shouldn't be able to push each other. If one of them is stationary, the other's movement should be blocked by this stationary enemy/player.
* Enemies shouldn't be able to push decorations.
* Player should be able to push some decorations (which should be pushable).
* Pushing an pushable decoration should slow-down the player.
* It shouldn't be possible to push a decoration out of bounds.
* It shouldn't be possible to push one decoration by pushing another pushable decoration near to it.
* If player falls down, he should get some damage upon collision with the floor if height difference is high enough. Increasing falling height should increase damage. It should be possible to deal 100 damage or more by falling from large enough height.
* While jetpack is active, jumping should be disabled. Instead pressing jump key should accelerate the player up.
* It should still be possible to get falling damage while jetpack is active.
* Some forward/backward/side acceleration/deceleration should be available while jetpack is active.
* "noclip" cheat should allow player moving through obstacles (map, objects), increase his speed significantly and disable gravity.

Dynamic clusters (buttons, doors, elevators):

* Only the player (but not enemies) should be able to activate dynamic clusters.
* Dynamic clusters should be activated by touching.
* There should be some delay between touching and activation.
* Activated dynamic cluster performs movement towards its destination.
* After reaching the destination, a dynamic cluster should stay there or return back (depending on cluster type).
* A dynamic cluster staying in its end position can be activated yet again to move it back.
* Buttons should activate doors/elevators assigned to them (with some delay). If there is a button for a cluster, it shouldn't be activated by touching.
* Chains of activation should be possible (like boss doors on map 23).
* Dynamic clusters should be able to push the player, enemies and other objects.
* If movement of a dynamic cluster is blocked (there is at least one object which can't be pushed further), it should reverse its movement.
* Dynamic clusters should use proper per-quad collision detection, not bbox-based.
* Buttons requiring some specific key shouldn't be activated if the player has no such key.
* Collisions of enemies/objects/projectiles with dynamic clusters should work properly regardless of their position or movement phase.
* Dynamic clusters should play a sound upon activation. The exact sound depends on cluster type.
* Dynamic clusters should block visibility checks (an enemy staying behind a closed door shouldn't see the player staying at the other side).

Projectiles:

* Projectiles (bullets, grenades, etc). should collide with map geometry, dynamic clusters, other objects and not pass through.
* A projectile should not collide with the player/enemy who fired it. This can be tested easily with bouncing projectiles.
* Projectiles should have finite velocity.
* Bullet projectiles should fly in straight line.
* Hand grenades, panzerfaust grenades, flamethrower projectiles should be affected by gravity.
* Projectiles should die at first hit of something (produce hit effects, explode if needed) with exception of bouncing projectiles.
* Bouncing projectiles (hand grenades, subatomic assault rifle projectiles, plasma launcher projectiles) should bounce from map geometry.
* Bouncing projectiles should hit objects/enemies/player (explode if needed).
* Bouncing projectiles should hit (explode if needed) breakable map quads.
* With each bounce velocity of a bouncing projectile should be reduced.
* Hand grenades should explode after some delay.
* Projectile which doesn't hit something should die after some delay (like for projectiles fired into air).
* At each bounce of a bouncing projectile a sound should be emitted.
* At projectile hit a sound effect should be emitted, which depends on kind of thing which has been hit (map geometry, object, enemy) and material properties (for map geometry).
* Smoke/fire trail effects should be emitted for some projectile kinds (depending on weapon properties).
* For projectiles traveling in liquids bubbles should be emitted (but no smoke).
* If projectile crosses a water-air boundary, splash effects should be emitted.
* Projectiles should damage the player/enemies/objects.
* Projectiles should break breakable quads (glass).
* Splash damage should be applied for nearby player/enemies/objects for projectiles with splash damage (hand grenades, panzerfaust).
* Breakable glass should be broken by nearby explosion of a projectile having splash damage.
* Smoke effects should be emitted at projectile hit position (if necessary).
* Explosion effects (like for panzerfaust or futuristic machinegun) should be emitted ad projectile hit position (if necessary).
* For flamethrower flame effects should be spawned at projectile hit position for map geometry and objects.
* If a flamethrower projectile hits an enemy, he should catch fire.
* Flamethrower projectiles should disappear in liquids.
* If a projectile hits an enemy having blood (1944 human/animal enemies, 2093 humanoids), blood particles should be emitted.
* Nearby projectile hits should alarm enemies.
* Nearby projectile hits should alarm birds and rats.
* Both the player and enemies firing a weapon should emit a short flash of light with color/brightness specific for each weapon.
* Projectiles should emit light while in flight (except rare projectile types with no light).
* Short light flash should be emitted at projectile hit position with color/brightness specific for each weapon.
* Projectiles itself should be drawn properly, using camera-aligned billboards, move axis-aligned billboards or models.
* Bullet hole decals should be spawned at projectile hit position if map geometry has been hit and bullet holes are enabled for this weapon.
* Spark particles should be spawned at projectile hit position if map geometry has been hit (machinegun, laser pistol).

Entities (general):

* Entities (enemies, pick-ups, decorations) should function properly.
* Entities should be affected by gravity (except for sky decorations).
* Enemies and objects should have colliders (with some exceptions).
* Animations should work properly (idle animations, destruction animations and others).
* Pick-ups should not have colliders.
* Some pick-ups shoould be rotated slowly. This is applicable for pick-ups floating in air and not lying on ground.
* Enemies and objects should have limited health (energy) and die after receiving enough damage.
* Light effects (sirens, lightnings) should work properly for entities.
* Explosion effects (explosive barrels) should work properly, including explosion billboards, flame effects, light, splash damage, sound.
* Sounds (sirens, destruction sounds for decorations) should work properly.
* Smoke emitters should work properly and emit smoke particles periodically.

Enemies:

* While in calm mode, enemies should move in loops between their patrolling points (except ones who are stationary).
* An enemy should be able to spot the player if he is located at front of him.
* Enemies should be alarmed by nearby shots (except shots from melee weapons).
* Enemies should be alarmed by nearby projectile hits.
* An enemy transitioning into alarmed state should alarm other enemies nearby.
* Enemies should move towards the player if he is far away.
* If right now the player isn't visible from an enemie's point of view, this enemy should go to the position where he has seen the player last time.
* If an enemy is close the the player, he should move randomly in his proximity, not going far away.
* Injured enemies should be able to seek for health packs and armor items and be able to pick-up them.
* Enemies with no ammo should be able to seek for ammo. They should use proper ammo for their weapon type. They should be able to pick-up weapons, including ones dropped by their dead allies.
* An enemy having no ammo and no ammo nearby to pick-up should be in panic mode and try moving away from the player.
* An enemy having low health and no health items nearby to pick-up should be in panic mode and try moving away from the player.
* Enemies should attack the player when he is in sight and there is ammo left.
* Enemies with mellee attacks (dogs) should attack the player properly.
* Enemies should mostly not shot if there is some obstacle (map geometry, an object or another enemy) on the ray towards the player.
* Enemies with directional moving mode (dogs, robo-spiders) should go straigt to the player, not navigating the navigation graph.
* Enemies should be able to navigate the map (find their way) in most cases. They should not stuck or move in short circles.
* If an enemy can't reach the player (no way is possible at all or it's too long to calculate), he should still move roughly towards the player and not stay stationary if movement animation is shown.
* Enemies should be able to go around other enemies and objects if they are in the way.
* Enemies should die if damaged enough.
* Some enemy types may play injury animations. The chance of such animation is specified individually for each enemy.
* Enemies should drop pick-ups properly (weapons, ammo, keys). What is dropped is specified for each enemy type individually.
* Muzzle flashes should be shown for firing enemies.
* Muzzle lights should be shown for firing enemies.
* Shot sounds should be emitted for firing enemies. The weapon's sound should be emitted, except default sounds are disabled for this kind of enemy.
* A random alarm sound (Halt oder ich schieße!) should be emitted by an enemy seeng the player first time, but not for enemies alarmed in other way.
* Alarm sounds should not be emitted for enemies with default sounds disabled.
* Injury sounds should be emitted for enemies upon taking damage unless default sounds are disabled.
* Volkssturm enemies should be able to surrender if no ammo is left. They should start seeking for more ammo as soon as the player don't see them.
* Random animations should be shown for some enemies (depending on enemy kind) in calm mode, like MP-40 guys playing with their weapons of Volkssturm guys smoking.
* Custom sounds should be emitted for enemies requiring such sounds, like futuristic enemies with idle sounds, custom alarm sounds and shooting sounds.
* Injured enemies should be covered with blood except enemies which are not alive or not humanoid.
* Enemies should be flammable (burning effect should be applicable to them).
* Accuracy of enemies should depend on their weapon (each weapon settings have a parameter for enemies accuracy) and current skill level.
* Some enemy types (snipers, robo-spiders) have additional accuracy multiplier, so that they are accurate even on skill 0.
* While shooting the player enemies should take his bounding box into account. If he is crouching, they should target the center of the bounding box in crouching state.
* Each individual enemy type should be tested if it works as expected.

The tank boss (on map 24):

* The tank boss should start its movement after entering the map.
* It should destroy the wall staying in the way.
* It should move somewhat forward.
* After reaching its destination it should be able to attack the player.
* The tank's turrent should rotate towards the player. As soon as it points correctly, it should fire.
* Projectiles fired by the tank should fly in straight light parallel to the ground.
* The body of the tank should not rotate.
* The body of the tank should have proper collider, even after the tank is defeated.
* It should be possible to destroy the tank. Eny weapon can work to do it, but it may require some time, since it has a lot of health.
* Initial movement sound should be played.
* Destruction sound should be played.
* Turret rotation sound should be played.
* Shot sound should be played.
* It shouldn't be possible to leave the map until the tank is destroyed.

Player weapons:

* Shooting should work properly.
* Ammo should be consumed (if a weapon requires ammo).
* Firing sounds should be emitted.
* Muzzle flashes should be emitted.
* Muzzle lights should be emitted.
* Projectiles should start traveling roughly from the position of the muzzle.
* Projectiles should use some random spread (depending on weapon settings), like firing a rifle should be precise, but machinegun is way less precise.
* Weapons firing more than one projectile at single trigger press should not fire more shots than there is ammo available.
* Weapon-dependent delay between shots should work properly.
* Recoil should work properly for panzerfaust (the player should be accelerated backwards).
* It should not be possible to switch to another weapon if firing is active (firing sequence isn't finished yet).
* Switching to another weapon should happen with current weapon lowered down and the new one lifted up.
* Enemies should be alarmed by shots (except for melee weapons).
* If the player stays close to a wall (so that the muzzle position is behind the wall) no projectiles should be fired.

Player weapon animations:

* Walking weapon animation should be player while walking, swimming or flying.
* Idle animations should be played from time to time while walking.
* Idle animations should be played from time to time while staying.
* Shot animation should be played properly.
* Weapon model should be moved slightly with some periodic pattern.

Melee weapons (kick, knife):

* Kick should be always available as an extra weapon.
* It should be possible to fire a weapon and kick in the same time.
* It should be possible to switch to the kick weapon explicitly. Firing it is the same as kicking.
* Melee weapons should have limited range (their projectiles travel only single game step).
* Using a melee weapon should not alarm enemies.
* Hitting something with a melee weapon should alarm enemies.

Mind control weapon:

* Non-alarmed enemies attacked with the mind control weapon should become alarmed.
* Enemies attacked with the mind control weapon should not attack the player.
* Enemies attacked with the mind control weapon should attack other enemies, except enemies which are also mind-controlled.
* Non-mind-controlled enemies should respond to fire of mind-controlled enemies.
* Mind-controll state should be limited in time (like 15 seconds or so).
* As soon as an enemy is no longer mind-controlled, it should start attacking the player.
* As soon as an enemy is no longer mind-controlled, other enemies targeting them should start attacking the player.

Birds:

* Burds should be placed in designated bird areas.
* Birds should fill their bird area semirandomly - with regular density and random angles.
* Birds should be alarmed by player walking into their placement area.
* Birds should be alarmed by nearby shots.
* Birds should be alarmed by nearby projectile hits.
* Alarmed birds should start flying in random direction mostly up. The flight or each bird should be straight.
* Flying birds should have pseudo-random animation phase (not synchronized with each other).
* No collisions with map geometry and other objects should be performed for flying birds.
* After some time flying birds should disappear.
* Birds sound shoud be emitted once birds in a particular area are alarmed.

Rats:

* Rats should be placed in designated rat areas.
* Non-alarmed rats should move randomly in their area.
* Collision detection with map geometry should work for rats.
* Rats should be alarmed by player walking into their placement area.
* Rats should be alarmed by nearby shots.
* Rats should be alarmed by nearby projectile hits.
* Alarmed rats should move fast in random directions, possible leaving their designated area.
* Alarmed rats should bounce from walls and other obstacles.
* After some time alarmed rats should disappear.

Environmental damage:

* The player should receive each second acid damage when swimming in acid, unless the acid protection suit item is active.
* The player should receive each second acid damage when swimming in lava.
* The player should start receiving suffocation damage after spending too much time in water without leaving it, unless the acid protection suit is active.
* Leaving water should stop suffocation damage.
* Armor should not absorb acid/suffocation damage.

Acid protection suit:

* It should be possible to activate and deactivate the acid protection suit item.
* With each second when the acid protection suit is active, its remaining amount should decrease.
* While the player is in acid and the acid protection suit is active, no acid damage should be delivered.
* A visual effect with screen edges slightly painted blue should be applied when the acid protection suit is active.

Flashlight:

* It should be possible to activate and deactivate the flashlight item.
* With each second when the flashlight is active, its remaining amount should decrease.
* A dynamic light source should be spawned towards player's view direction when the flashlight is active.
* The flashlight should use mostly white light.
* Power of the flashlight should slightly decrease with distance.

Night vision:

* It should be possible to activate and deactivate the night vision item.
* With each second when the night vision is active, its remaining amount should decrease.
* When the night vision is active, the world should be painted green and be slightly brighter, so that its's possible to see dark corners.

Infrared vision:

* It should be possible to activate and deactivate the infrared vision item.
* With each second when the infrared vision is active, its remaining amount should decrease.
* When the infrared vision is active, the world should be painted red and models should be highlighted with constant orange color (lighting and own texture should be ignored).

Jetpack:

* It should be possible to activate and deactivate the jetpack item.
* With each second when the jetpack is active, its remaining amount should decrease.
* When the jetpack is active, jumping should not work and instead gradual acceleration upwards should work.
* When the jetpack is active, it should be possible to accelerate/decelerate while in air.
* When the jetpack is active, gravity should still work for the player.
* When the jetpack is active, falling damage should still be applied in player collided with the ground too fast.

False documents:

* It should be possible to activate and deactivate the false documents item.
* With each second when the false documents item is active, its remaining amount should decrease.
* When the false documents item is active, enemies should not be able to see the player. But they still can be alarmed if hit by some projectile or splash damage or by nearby projectile hits.
* An enemy having state property "alarmuj_okolice" entering such state should cancel player's invisibility - the false documents item should be deactivated and its remaining count should be set to zero. Only dogs and gestapo enemies are able to do that.

Pick-ups:

* Items should be pickable.
* A picked-up item should disappear.
* Picking-up an item should increase its amount in the inventory (for ammo and other consumable items).
* If the maximum amount of an item in the inventory is reached, this item can't be picked-up.
* Picked-up weapons should also give some ammo (specific for each weapon type).
* If a weapon is picked-up and the player hasn't such weapon yet, the new (picked-up) weapon should be selected.
* Items should not be obstacles.
* Picked-up items should not be automatically activated.
* Picking-up a health pack should apply its health to the current health level and apply all health from the inventory.
* Picking-up armor should apply its value to the current armor level and apply all armor from the inventory.
* Sounds should be played for picked-up items, including unique sounds for health and armor items.

Inventory:

* It should be possible to navigate inventory using next/previous buttons.
* The currently-selected tool should be shown in HUD.
* While navigating inventory other available inventory tools should be shown in HUD.
* The menu sound should be emitted while navigating inventory.
* It should be possible to activate inventory tools.
* Activating a weapon should trigger switching to it.
* Timed tools (night vision, infrared vision, flashlight, acid protection suit, jetpack, false documents) may be activated and deactivated.
* It should be possible to activate night vision, infrared vision, flashlight, acid protection suit, jetpack tools via dedicated keys.
* Activating health tool should add it to current player's health.
* Activating armor tool should add it to current player's armor.
* Keys should not be shown in inventory.
* Ammo should not be shown in inventory.
* Kick should not be shown in inventory.

Music:

* For singleplayer maps single music track should be played in a loop (track number is specified per-map in *ICE.STD* file).
* For multiplayer maps all specified tracks should be played in a loop with random tracks order.
* It should be possible to change music volume, even set it to zero. Music volume setting should be separate from game sounds and ambient sounds.
* Starting new game, loading a game or starting a new map via console should reset currently-playing music.
* If a cinematic is playing, music should be stopped.
* Pausing the game should NOT pause music.

CD image extractor:

* When launched with `-h` or `--help` command-line option, `cd_image_extractor` should show a help message.
* If an ISO file containing an image of the original game CD is specified via command-line, its content should be extracted into `Data` subdirectory of the current directory. It should contain `main.hal` file and cinematic files.
* If a CUE file containing an image of the original game CD is specified via command-line, the same data as for an ISO file should be extracted. Additionally music tracks (in WAV format) should be extracted into the `Data` subdrirectory.
* If `cd_image_extractor` is launched with no command-line options and there is an ISO file in the current directory, it should be processed as described above.
* If `cd_image_extractor` is launched with no command-line options and there is a CUE file in the current directory, it should be processed as described above.
* If `cd_image_extractor` is launched with no command-line options and there is more than one ISO or CUE file in the current directory, nothing should be extracted.
* If `Data` directory already exists, extracting should work too. Existing files in it should be overwritten, but other files (if there are some) should be preserved.
* Original ISO/CUE/BIN files should not be affected in any case.
* `cd_image_extractor.log` file should be written in any case
