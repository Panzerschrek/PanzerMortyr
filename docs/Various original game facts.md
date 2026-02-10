This documents describes various interesting facts about the original game.

### Game plot

* It's unclear how the main character is called. In the manual his name is Sebastian, but in some game files and in the false documents item he is called Sven.
* Rudy-102 tank on map 1 is a reference to  _Czterej pancerni i pies_.
* On map 9 Hitler's speech can be heard. It seems to be a speech from 14th Semptmber 1936 in Nürnberg.
* There is a note on map 1 (the second capmagn map) with the following quote:
  ... cadent a latere tuo mille et decem milia a dextris tuis, ad te autem non appropinquabit...
  The same quote can be seen on the first exit door on map 23 (the last compagn map).

### Non-obvious gameplay facts

* Enemies have limited ammo, like panzerfaust guy having only single shot, but some enemies have really a lot of ammo (like machinegunners with 900 bullets).
* Enemies can search for health kits and armor, but this behavior is rare due to low chance of search behavior specified in the entities config.
* Enemies can search for ammo boxes if they run out of ammo, but this behavior is rarely observed or isn't observed at all.
* At least some enemies rotate towards the player while playing death animaton.
* Enemies with health level below some threshold don't chase the player, but try to flee from him.
* It looks like enemies have slightly different model scale from each other, which seems to be random.
* Rudy-102 can be destroyed, but it has a lot of health - 4500 units.
* There is a single dog enemy on some of future maps with unique dead animation - flying flies around the corpse.
* The original game has secret areas with a message "you have found a secret place" showed upon entering, but there are only a couple of such places.
* The officer enemy drops the false documents item only if killed in some states, in other states he drops a pistol.
* The player shots slightly right from the crosshair. There is an alternative behavior activated wia a console command "aim on" - which moves crosshair if necessary.
* Some decorations can be pushed (bottles, crates), but it's buggy if more than one decoration is pushed in the same time - it's possible to push a decoration into a wall.
* Сabinet decorations have incorrect collider box - it's too low and wide.
* Bullets spread for weapons is differrent for the player and for enemies - with different settings set for each weapon.

### Technical aspects

* It's possible to save during demo playing and load this save - it's fully functional.
* Demos are simulated in realtime by using pre-recorded player input. Altering the entities config or using cheats lead to demo desyncronization.
* Savegame and demo formats are almost identical and they store a copy of many map data blocks.
* Maps are numbered unsequentially, first maps are 41, 1, 30, 10.
* Enemies can't travel far from their start positions, since they use individual navigation graphs and each graph has very limited number of points.
* End-bosses can't move more than a couple of steps from their spawns, since their navigation graphs contain only two points, presumably because they are initially behind closed doors.
* In some rare places it's possible to see some map parts through a broken window - where normally only sky should be shown.
* The game maps contain a lot of out-of-the-bounds entities, which are disabled. They look like leftovers from other maps.
* Enemies use collision bounding boxes for bullet hits, so that it's not necessary to hit the model itself to deal damage. Some boxes in some animations don't even match drawn enemy position.
* Sky is a little bit strange - clouds texture is projected on sky polygons, but scale isn't tweaked. This projection is also broken on vertical sky polygons.
* Any map quad with destructible material property can be destroyed. Sky is drawn in place of destroyed quads.
* First-person weapon models use different perspective from the rest of the frame, tangent of half field of view for them is divided by 2.

### Cut or unused content

* MG-42 nest isn't used in the game, but it's listed in the manual. These enemies are placed on maps 8 and 24, but are disabled.
* Gestapo officer is listed in the manual, but he isn't used in the singlplayer game. He is present only on cooperative map 36.
* Nurse is listed in the manual, but she isn't used in the singlplayer game. Nurses are placed on maps 19, 24, 30, 37, but are disabled. Only on cooperative map 36 there are a couple of them.
* Adolf Hitler isn't listed in the manual, he is missing in many versions of the game except one or two regional editions. But he is still present in game resources. On map 13 he is placed, but disabled.
* Game files contain unfinished maps with indices 0, 22, 8000.
* Map 0 is a raw version of maps 10 and 33 combined.
* Map 22 contains elements of maps 1 and 11.
