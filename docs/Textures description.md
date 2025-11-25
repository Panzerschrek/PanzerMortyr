*TXTAB.STD* file contains texture descriptions.
It's split into blocks, a map uses textures from one of these blocks.

Texture files are listed via "mipmapa" keyword.
Each texture file adds 4 actual textures, arranged into a quad 2x2 actual textures.
For each quad its material may be specified.

Each quad in a map file has index of used texture.
Additionally there are special (numbered) textures with numbers above 1000, like for water, sky, glass, lava, etc.
A "mipmapa" entry may set one actual texture to be such actual texture.
For example setting "set_niebo_data" makes this texture a sky texture.

Known special textures:
* set_niebo_data
* set_plakat_data
* set_woda_data
* set_podloga_data
* set_rusztowanie_data
* set_wentyl_data
* set_lustro_data
* set_okno_data
* set_lawa_data
* set_klaws_data
* set_szyba_data
* set_swiatlo_data
* set_film_data
* set_kwas_data

Sky is drawn like a flat quad with the moon atop of it.
Texture coordinates at large angles are clamped.
