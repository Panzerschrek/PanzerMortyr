This documents describes various interesting facts about the original game.

### Game plot

* It's unclear how the main character is called. In the manual his name is Sebastian, but in some game files and in the false documents item he is called Sven.
* Rudy-102 tank on map 1 is a reference to  _Czterej pancerni i pies_.
* On map 9 Hitler's speech can be heard. It seems to be a speech from 14th Semptmber 1936 in Nürnberg.

### Non-obvious gameplay facts

* Enemies have limited ammo, like panzerfaust guy having only single shot, but some enemies have really a lot of ammo (like machinegunners with 900 bullets).
* Enemies can search for health kits and armor, but this behavior is rare due to low chance of search behavior specified in the entities config.
* Enemies can search for ammo boxes if they run out of ammo, but this behavior is rarely observed or isn't observed at all.
* Rudy-102 can be destroyed, but it has a lot of health - 4500 units.
* There is a single dog enemy on some of future maps with unique dead animation - flying flies around the corpse.
* The original game has secret areas with a message "you have found a secret place" showed upon entering, but there are only a couple of such places.
* The officer enemy drops the false documents item only if killed in some states, in other states he drops a pistol.
* The player shots slightly right from the crosshair. There is an alternative behavior activated wia a console command "aim on" - which moves crosshair if necessary.

### Technical aspects

* It's possible to save during demo playing and load this save - it's fully functional.
* Demos are simulated in realtime by using pre-recorded player input. Altering the entities config or using cheats lead to demo desyncronization.
* Savegame and demo formats are almost identical and they store a copy of many map data blocks.
* Maps are numbered unsequentially, first maps are 41, 1, 30, 10.
* Enemies can't travel far from their start positions, since they use individual navigation graphs and each graph has very limited number of points.
* In some rare places it's possible to see some map parts through a broken window - where normally only sky should be shown.
* The game maps contain a lot of out-of-the-bounds entities, which are disabled. They look like leftovers from other maps.

### Cut content

* MG-42 nest isn't used in the game, but it's listed in the manual.
* Gestapo officer isn't used in the game, but he is listed in the manual.
* Nurse isn't used in the game, but she is listed in the manual.
* Adolf Hitler isn't listed in the manual, he is missing in many versions of the game except one or two regional editions. But he is still present in game resources.
* Automatic gun turret seems to be unused, but it's listed in the manual.
* Game files contain unfinished maps with indices 0, 22, 8000.
