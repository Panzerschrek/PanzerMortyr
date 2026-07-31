This document contains a non-comprehensive list of things needed to be tested prior to a release or major update.

System support:

* The game should start and work properly on Windows 10 and 11 with x86_64 architecture, assuming hardware requirements are satisfied and OpenGL 3.3 (or later) drivers are present.
* The game should start and work properly on x86_64 GNU/Linux systems with X Window system or Wayland, assuming hardware requirements are satisfied and OpenGL 3.3 (or later) drivers are present.
* No administrator/root privileges should be necessary.
* No extra library dependencies should be present except system libraries (like kernel32.dll, libc), libraries shipped together with *panzer_mortyr* (like *FFmpeg*) or C++ runtime libraries.
* On Windows the *panzer_mortyr* executable should have non-empty icon.

Command line:

* Running *panzer_mortyr* executable with *--help* and *-h* options should show a help message desribing command line options, the game itself should not start in such case.
* Running with *--new-game* option should immediately start a new game without entering main menu.
* Running with *--map* option should immediately start the given map without entering main menu.
* *--skill* option should properly set skill level for games started with *--new-game* and *--map* commands.
* *--config* option should allow specifying custom config file. Values from it should be read and written.
* *--game-directory* option should allow specifying game directory (where data is located) and should have priority over other directories in game data search.

Game data search:

* If there is a file *main.hal* in the current directory, it should be found and used.
* If there is a *Data* directory in the current directory and it contains a *main.hal* file, it should be found and used.
* If there is a file *main.hal* in the directory where *panzer_mortyr* executable is located, it should be found and used.
* If there is a *Data* directory the directory where *panzer_mortyr* executable is located and it contains a *main.hal* file, it should be found and used.
* If there is a file *main.hal* in the directory specified via *--game-directory* option, it should be found and used.
* If there is a *Data* directory in the directory specified via *--game-directory* option and it contains a *main.hal* file, it should be found and used.
* Case of the *Data* directory and the *main.hal* file should be irrelevant, *data*, *Data*, *DATA* directories should be accepted as valid data directories, *main.hal* and *MAIN.HAL* files should be handled equally.
* If game data is detected in more than one places, game data directory specified via *--game-directory* option should have priority over other directories.

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
* Menu cursor should be properly shown on all pages.
* Navigation should be possible by using up and down keys.
* Selecting a menu item should work by using enter key.
* Going back should be possible by using escape key.
* Closing menu should be possible by using escape key on the main page.
* The menu sound should be emitted while navigating and selecting menu items (unless sound is disabled).
* Skill selected in the new game menu should be applied properly.
* Load/Save menu pages should contain several slots with user-defined slot names. Empty slots should be marked properly.
* Load/Save menu pages should contain a small screenshot for the corresponding saved game.
* Some stats for the selected save slot should be shown on load/save menu pages, including level name, skill, number of kills and the total number of enemies.
* Saving the game via save page should work properly. Loading it via load page should work too.
* Multiplayer page should be a stub.
* It should be possible to change boolean settings on the options pages by pressing enter, left key and right key.
* It should be possible to change numeric and slider values on the options pages using left and right keys. There should be limits for sliders and numeric values.
* Setting key bindings should work for keyboard keys, mouse buttons and mouse wheel.
* Pressing escape key when editing of a key binding is active should cancel editing.
* It shouldn't be possible to use escape key and ~ as key binding.
* All sound options should be functional.
* Video settings including video mode, fullscreen on/off, display index, etc. should work properly.
* Non-key-binding controls menu should work properly.
* Advanced options menu should work properly - all options should be editable and have effect.
* Before quitting a quit message should be shown. The message text should be selected randomly. It should be possible to quit by pressing enter or Y, it should be possible to abort quitting by pressing escape or N.

Console:

* Console should be always available by pressing ~.
* Pressing ~ second time should turn console off.
* Console should be opened/closed with smooth animation.
* A background image should be used for console.
* The game should be paused when console is opened.
* Keyboard input should be redirected to console if it's active.
* It should be possible to enter a command.
* It should be possible to repeat the last entered command by pressing up key.
* It should be possible to call console commands, including ones having arguments.
* By typing a name of a setting with no arguments its value should be displayed.
* By typing a name of a setting with single argument this setting should be set to the value of this argument.
* Autocompletion for commands and settings should work by pressing TAB. If there is more than one option, they all should be displayed.
* If a given string isn't a command or setting name, a message indicating this should be shown.
* At least some logging messages should be shown in console.
* Entered commands should be added into the console log.

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

HUD:

* HUD should be somewhat scaled for large resolutions.
* HUD icons should be displayed at the bottom of the screen.
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

