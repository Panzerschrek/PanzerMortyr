This list contains things to be done.

Map format investigation:

* Test/fix loading maps other than map 41.
* Investigate the exact way per-quad texture scale is specified.
* Investigate how surfaces with emissive flag work.
* Invetigate what Struct0 in "ZVOX.ANT" file actually is.
* Invetigate what Struct1 in "ZVOX.ANT" file actually is.
* Investigate what remaining fields of ZvoxCluster structure mean.
* Ensure light color is properly read from ZvoxLightSource structure.
* Investigate what data[1] of ZvoxLightSource means.
* Investigate how exactly light-related sprites (flames, coronas) are defined.
* Investigate how light source power is stored.
* Investigate exact meaning of many ZpozEntity fields.
* Investigate what ZpozStruct1 is and how it may be connected with navigation graphs in "MAPA*.LEM" file.
* Investigate what exact kind of visibility data is stored in ZPOZ file and why it seems to have 4 blocks of such data for each cluster.
* Investigate what and how is stored in "ZMAP.LAM" files.
* Investigate exact meaning of per-cluster sky-related data in "ZMAP.LEM" file.
* Investigate how buttons and doors function.
* Investigate how sky quads affect surrounding lighting.
* Investigate whether there is ambient light value stored somewhere on per-quad or per-cluster basis.
* Investigate how navigation graphs are used by enemies AI.
* Investigate exact meaning of remaining fields of navigation graph structures.

Textures/materials investigation:

* Identify more special material kinds.
* Investigate how sky works on quads with sky materials and on broken glasses.
* Investigate how lava texture affects lighting of surrounding geometry.
* Investigate how water surface is drawn.
* Investigate how underwater caustics work.

Models format investigation:

* Find exact framerate of per-vertex model animations. Maybe it's stored somewhere, or is just hardcoded for all models.
* Investigate how LODs are stored and processed in models in #5 format variant.
* Investigate why HD textures are stored three times with no noticeable difference.
* Calculate per-vertex normals based on triangle normals, since normals stored in the model file are sometimes broken

Lighting:

* Investigate how light is applied on per-quad basis (is it per-vertex lighting or maybe some sort of lightmap)?
* Investigate whether lights can cast shadows or lightting complete ignores line of sight checks.
* Investigate how quad normals affects lighting.
* Investigate ligth attenuation formula.
* Investigate sky-related light (if it even exist).
