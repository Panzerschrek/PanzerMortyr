This documents describes various interesting facts about the original game.

### Game plot

* It's unclear how exactly the main character is called. In the manual his name is Sebastian, but in some game files and in the false documents item and keycard items he is called Sven.
* Rudy-102 tank on map 1 is a reference to  _Czterej pancerni i pies_.
* On map 9 Hitler's speech can be heard. It seems to be a speech from 14th September 1936 in Nürnberg.
* There is a note on map 1 (the second campaign map) with the following quote:
  ... cadent a latere tuo mille et decem milia a dextris tuis, ad te autem non appropinquabit...
  The same quote can be seen on the first exit door on map 23 (the last campaign map).
* Keycard items (future-style keys) have texts "Sven Mortyr" and "Corvin Software Studios" on them and a Mortyr logo.
* On map 10 there is a corridor with several doors. They can't be opened, but each of them contains a name. These are actual names of the game developers, which can be also seen in the help menu.

### Non-obvious gameplay facts

* Enemies have limited ammo, like panzerfaust guy having only single shot, but some enemies have really a lot of ammo (like machinegunners with 900 bullets).
* Enemies can search for health kits and armor, but this works only for some enemy types, since panic behavior often overrides health search behavior.
* Enemies can search for ammo boxes if they run out of ammo, but this behavior is rarely observed, since the most enemies have a lot of ammo and they don't live long enough to consume it all.
* At least some enemies rotate towards the player while playing death animation.
* Enemies with health level below some threshold don't chase the player, but try to flee from him.
* It looks like enemies have slightly different model scale from each other, which seems to be random.
* Rudy-102 can be destroyed, but it has a lot of health - 4500 units.
* There is a single dog enemy on map 19 with unique dead animation - flying flies around the corpse.
* The original game has secret areas with a message "you have found a secret place" showed upon entering, but there are only a couple of such places.
* The officer enemy drops the false documents item only if killed in some states, in other states he drops a pistol.
* The player shots slightly right from the crosshair. There is an alternative behavior activated via a console command "aim on" - which moves crosshair if necessary.
* Some decorations can be pushed (bottles, crates), but it's buggy if more than one decoration is pushed in the same time - it's possible to push a decoration into a wall.
* Bullets spread for weapons is different for the player and for enemies - with different settings set for each weapon.
* The volkssturm enemy (with grenades) surrenders if has no ammo left, but it's a false surrender (a notable war crime), he continues fighting and searches for more ammunition as long as the player can't see him.
* Some maps can't be left until some condition is satisfied - necessary items (Quantum Receptor piece) are collected or a boss (the Tank) is killed.
* The jetpack item is present only at one place in the whole game - on the last level just before boss battle.
* Jetpack being activated doesn't prevent fall damage.
* Enemies can pass through each other (with no collision), at least while patrolling.
* Idle animations for first-person weapons are the same as walk animations on multiplayer maps.
* Having two different idle animations for first-person weapons is supported, but no weapon actually uses it.
* Snipers and mechanical spiders (end bosses) shoot with practically no spread even on the easiest difficulty. The only way to avoid taking damage from them is to take cover or to strafe, which works because projectiles have finite speed and enemies aren't able to take player movement into account while shooting him. Such behavior may be unintentional, but a bug instead.

### Technical aspects

* It's possible to save during demo playing and load this save - it's fully functional.
* Demos are simulated in realtime by using pre-recorded player input. Altering the entities config or using cheats lead to demo desyncronization.
* Savegame and demo formats are almost identical and they store a copy of many map data blocks.
* Maps are numbered unsequentially, first campaign maps are 41, 1, 30, 10.
* Enemies can't travel far from their start positions, since they use individual navigation graphs and each graph has very limited number of points.
* The game maps contain a lot of out-of-the-bounds entities, which are disabled. They look like leftovers from other maps.
* Enemies use collision bounding boxes for bullet hits, so that it's not necessary to hit the model itself to deal damage. Some boxes in some animations don't even match drawn enemy position.
* Sky is a little bit strange - clouds texture is projected on sky polygons, but scale isn't tweaked. This projection is also broken on vertical sky polygons.
* Any map quad with destructible material property can be destroyed. Sky is drawn in place of destroyed quads.
* First-person weapon models use different perspective from the rest of the frame, tangent of half field of view for them is divided by 2.
* Many maps contain a hidden room with some items placed in it. These items are usually items which can be dropped by enemies present on this map.
* The story of the game is narrated via notes. They usually look like a table with a folder item atop of it and a note is shown if the player comes close enough. But note showing is actually activating by touching such table or generally any cluster with note type (sometimes non-table-shaped note clusters are used). The folder item is actually just a strangely-looking small health pack.

### Cut or unused content

* MG-42 nest isn't used in the game, but it's listed in the manual. These enemies are placed on maps 8 and 24, but are disabled.
* Gestapo officer is listed in the manual, but he isn't used in the singleplayer game. He is present only on cooperative map 36.
* Nurse is listed in the manual, but she isn't used in the singleplayer game. Nurses are placed on maps 19, 24, 30, 37, but are disabled. Only on cooperative map 36 there are a couple of them. And they can't heal the player, they only can be killed and can drop a small health pack.
* Adolf Hitler isn't listed in the manual, he is missing in many versions of the game. He is present in the polish version. In English version he is still present in game resources. On map 13 he is placed, but disabled.
* There is a model METRO.OBB with a variation of the WCZAPCE.OBB model with slightly different texture.
* There are models KL0-47.OBB, KL48-63.OBB and KL64-87.OBB with some unused enemy type.
* There is a model TROOPE2.OBB with some unfinished enemy.
* There is a model BAZBRON.OBB with unfinished MG-42.
* There is a model HUSAR.OBB with winged husar armor, which seems to be unused.
* There is a model KOMIN.OBB, which seems to be unused.
* Game files contain unfinished maps with indices 0, 22, 8000. Trying loading maps 0 or 22 via a console command leads to game crash.
* Map 0 is a raw version of maps 10 and 33 combined.
* Map 22 contains elements of maps 1 and 11.
* Note images 14, 21, 22 aren't used.
* Game resources contain many sound files intended to be used for some specific enemies, but they are not actually used and not listed in the GLOS.STD file. It's presumably due to memory limitation, adding them manually causes the game to exit on startup with an error message reporting too much audio samples being used.
* There is an item with codename BUTLA_TLENU, which isn't used in the game. It's possible to get it via cheats, it acts like a power-up allowing breathing under water and has an icon identical to the acid protection suit item.

## Supplement material oddities

* It's mentioned on the back side of the retail box, that the game has 21 levels. But it has actually 30 singleplayer levels. But if some adjacent levels are considered to be one level (as they technically are combined in the beta version), the result number is 21.
* There is a screenshot of map 19 on the back side of the retail box with the character having MP-40 as active weapon. This is impossible to achieve, MP-40 is not obtainable on future maps.
* The original manual suggest to change crosshair mode via console by typing command `aim on`. It seems to be very strange.

### Bugs

* It's possible to shoot through walls via some weapons by staying too close to a wall.
* The movable shuttle model on map 29 has missing glass quads. They are there, but they are not displayed properly.
* The tower decoration on map 29 is missing if skill is 1. It's treated as an enemy and enemy count reduction for it isn't disabled.
* On map 23 at the final room there is a glass box miss-placed right at top of the spinning eagle logo.
* Pre-recorded player inputs in a played demo (at game start) are applied shortly after starting a new game.
* Bullet hole decals are cut by borders of a quad with hole center, even if it's not necessary (with an adjacent quad lying in the same plane).
* Bullet hole decals aren't drawn in mirrors.
* Decals (bullet holes, blood stains) aren't placed on polygons having water circles (with wet material property and rain above).
* Some maps contain holes in their geometry, where a hall-of-mirrors effect can be seen.
* Clusters visibility information is sometimes incorrectly calculated and thus a hall-of-mirrors effect can be seen due to missing clusters which should be actually drawn.
* In a couple of places (map exit door button on map 34, elevator buttons on map 3) buttons move in wrong direction.
* Many dynamic clusters (doors, buttons, elevators) are pitch-dark - no proper light is calculated for them.
* Due to buggy precalculated snow paths sometimes snow can be seen where it shouldn't be (with no sky above).
* Many decorations have incorrect collider box - it's too low and wide.
* Many pick-ups have incorrect collider box, so that they appear to be half-submerged into the ground.
* In some rare places it's possible to see some map parts through a broken window - where normally only sky should be shown.
* Perspective for first-person weapon models is broken while zooming.
* Sun and moon sprites are rotated together with camera rotation, which is incorrect.
* Dynamic map clusters (doors, elevators) move without considering blocking, so that it's possible to stay under an elevator and it will pas through.
* In future maps icons for key items are incorrect. There are golden/silver/blue keycard icons present in PANEL.BMP, but instead golden/silver swastic keys and golden keycard (instead of blue one) are used.
* The original game has some hard limit for the number of sounds playing simultaneously. This limit is reached on some future maps due to Robo Ed enemies emitting idle sounds, so that some other sounds disappear.
* Projectiles have very limited lifetime (2 seconds or so), so that panzerfaust shots may disappear before hitting something.
* Robo Ed. enemies can't sometimes navigate in tight corridors (like on map 19), because their bounding boxes are way too large.
