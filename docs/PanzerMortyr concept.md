This document describes what *PanzerMortyr* should be and what it should achieve.


### Definition

*PanzerMortyr* is the name of a planned recreation of the executable file of the game *Mortyr: 2093 - 1944*.
It should be written from scratch, should use resources of the original game and recreate it as close as possible.
Basically *PanzerMortyr* should be for the original what *PanzerChasm* is for the game *Chasm: the Rift*.


### Goals

The main goal is to allow running the game *Mortyr: 2093 - 1944* on modern operating systems (including at least Windows and GNU/Linux).
This includes avoiding fighting with original game DRM (disk-based) and compatibility problems (since the original game was written for pretty-old Windows 95/98 systems).
Additionally some quality-of-life improvements may be done, like higher screen resolutions support.

The original gameplay should be recreated as close as possible.
The singleplayer campaign should be passable, some small hacks may be done in order to achieve this.
Multiplier may be recreated too, as soon as it's possible and viable.

Graphical features of the original should be preserved as close as possible.
Additional graphical features may be implemented, but only the ones which only improve original quality (like better textures filtering and higher screen resolution) should be turned on by default.

*PanzerMortyr* should be able to run on low-end consumer devices, but not all devices able running the original.
This means it shouldn't consume too much memory and computation resources, or at least there should be low-quality settings allowing this.
It's expected that a PC from year like 2011 with WindowsXP os should be able to run it.


### Estimated development time

It's expected that something playable may be developed in around a year of a single developer doing it in his free time.
This includes time for investigation of original data formats and behavior.
Final polishing and tweaks may require roughly one more year.


### Opensourcing

Initially *PanzerMortyr* may be developed as a closed source project.
But after main features are implemented, in may be opensourced under the terms of GNU GPL v3.
It's also possible to make a commercial version of *PanzerMortyr* - with closed sources, but this requires rejecting thirdparty contributions in order to be able to do this.
