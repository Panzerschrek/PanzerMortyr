This documents describes what and roughly how should be rendered.

### Main map geometry

This includes the most map polygons which are static.
Rendering them isn't difficult - it requires drawing polygons with textures (which all have identical size), and per-vertex precalculated light.
No blending or other tricks are necessary.

Map geometry should be generally clipped - by using frustum culling and clusters visibility information.

### Map polygons with animation

There are a couple of special materials enabling frame-based texture animation.
Map polygons having these materials should be properly processed (animated).
They may require CPU-side texture coordinates update and separate draw pass.


### Dynamic map clusters

Polygons belonging to dynamic clusters should be drawn separately using slightly different way.
They can be moved and thus require an extra draw call with individual transformation matrix specified.
They have no precalculated tessellated data (containing lighting), which requires calculating lighting for them dynamically, even from static light sources.
It's even necessity, since lighting should be different in different positions.

Dynamic clusters should be culled, but it looks like they can't use clusters visibility information and thus their visibility check should be based on visibility of static clusters where they are located (fully or partially).


### Semitransparent map polygons

Polygons with glass material (and other semitransparent materials) should be drawn with alpha-blending.
This may require sorting - in order to ensure correct back-to-front blending order and not only for such polygons, but for all objects with blending.

Semitransparent polygons seems to have no lighting.
It looks like original light for such polygons is always constant.
And they aren't affected by dynamic lights (like flashlight).


### Breakable world polygons

Map polygons which can be broken (like glass or windows) should be not displayed if they are broken.
This may require creating a separate per-cluster index buffer for such polygons and modifying this buffer on each draw - in order to exclude drawing broken polygons.

Such polygons can be also semitransparent, which makes things even more complex.


### Map water polygons

Water polygons require alpha-blending.
They have no lighting (use only constant light), even from dynamic sources.
Additionally water polygons use texture coordinates animation which shifts coordinates using some kind of sinwave pattern.


### Underwater caustics

Map polygons which are located in water volumes should be drawn with caustic effects.
This effect is likely drawn via an animated texture, which modulates polygon lighting.

A special shader may be used for achieving this.
Alternatively a separate draw pass (with equal depth test) may be used for drawing caustic effects atop of previously draw geometry.


### Sky

Sky requires rendering some sort of sky-geometry with special shader, which projects sky texture and mixes it with background color.
Also sun/moon should be displayed (depending on map resources).

The original game files contain some panoramic texture representing horizon, it requires further investigation how this texture is used.

Also an investigation is required to find how the original game draws sky geometry.
It may draw sky only where sky polygons are placed, or maybe sky is draw in the whole top hemisphere.


### Triangular models

Triangular models are used for the most of game object.
They use single unique texture (with size varying from model to model).
They also use per-vertex animation.
Models require special shader doing per-vertex animation (with two frames blending).

Lighting for models should be calculated dynamically.
It can be done on CPU, some sort of spherical harmonics can be calculated and passed to the models shader, where per-vertex normals are used to perform lookup from these harmonics.
Additionally a small amount of the most influential light sources may be passed to the shader to calculate light from them directly.
Per-vertex normals should be precalculated, using original ones isn't correct, since they are sometimes broken.


### First-person weapon

First-person weapon models require some Z hacks.
Additionaly they may require drawing some sprites (for muzzle flashes).


### Light billboards

Some map static light sources have billboards associated with them - flames or coronas.
Flames require framed animation (there are several animation frames) and should be aligned towards camera, but only with Z axis rotation.
Coronas require full orientation to camera, but use single static texture.

These billboards require blending and thus require sorting (among each other and among other objects requiring sorting).
Also it should be investigated what kind of blending is used for light-related billboards.


### Dynamic flame and smoke billboards

Dynamic flame and smoke billboards require blending and thus ordering.
Smoke billboards require lighting, but it can be calculated per-billboard basis on CPU.


### Decals on map geometry

Decals are used for bullet holes, footsteps, blood.
Decals geometry may be generated by cutting map polygons using decal bounding box and by rendering resulting polygons with decal texture and with some depth offset (to avoid Z-fighting).

Decals require lighting.
It can be calculated dynamically - as for many other dynamic object types.
Alternatively light information can be fetched from map geometry where a decal is placed.


### Blood decals on enemies

Injured enemies are drawn with blood spots on their bodies.
This can be achieved by rendering a model with extra texture layer containing blood drawn directly into this texture.
This can be done by creating a separate shader for models using blood layer or by drawing blood layers in a separate step (with equal depth test).


### Bullets

The original game shows bullets as linear fast traveling objects.
They should be drawn somehow, presumably as quads elongated along travel direction.
They seems to require to lighting (they are always fullbright).


### Dynamic lights

The original game uses dynamic lights for things like muzzle flashes, bullet impact flashes, etc.
Thus *PanzerMortyr* should support dynamic light sources.
Since dynamic lights are relatively small, they require no shadowmaps.

Dynamic objects (models, billboards, decals) may just use dynamic lights for  per-object light calculations.

For map polygons implementing dynamic lighting is more complex.
It may require additional draw pass with special shader calculating dynamic light (with equal depth test).
Alternatively lighting can be calculated per-vertex on CPU and tranferred to GPU.


### Fog

Some maps have global fog on them.
Some maps have special fog volumes (in form of an axis-aligned bounding box).
Some maps have even several fog volumes visible in one place and global fog.
Drawing all this is tricky.

The one possible way of doing this is to support fog calculations in each shader.
This approach can work for global fog and works great even with semitransparent geometry.
But implementing fog volumes in such way requires too much costly calculations for each pixel or creating separate shader variants for fog enabled/disabled.

Another way of drawing fog is to draw it in a post-process step, which has access to scene depth buffer.
World pixel position can be calculated based on pixel depth and this information can be used to calculate fog properly - both for global fog and fog volumes.
Different fog volumes can be draw as separate passes - with fog volumes draw from back to front.
The main disadvantage of this approach is to perform proper fog calculation for semitransparent objects, or more precisely - for objects behind semitransparent objects.
Maybe in such cases fog should be applied only to opaque geometry and for semitransparent geometry it should be calculated on per-object basis (on CPU).


### Planar reflections

The original game have several places with floors having planar reflections (blended with floor texture).

Drawing reflections requires drawing the whole scene one more time, but with some tweaks.
This includes altered (reflected) view matrix, using stencil buffer and depth buffer clears (if necessary), changing triangle clipping rules (reject front instead of back triangles).
Custom clip plane may be necessary for clipping geometry by mirror surface or the front clip plane of the view matrix should be modified to be equal to mirror plane.

Extra draw step requires sorting semitransparent objects from the perspective of the reflected camera.
Maybe even clusters visibility should be recalculated.

It's unclear how fog in mirrors should be drawn.
This requires extra investigation.


### Light shafts

Light shafts are just polygons drawn with a texture and modulated by color gradient.
They also use additive blending and thus require ordering.

Fog for light shafts should be calculated in some separate step.
Maybe it's just enough to calculate per-vertex fog values on CPU side (maybe by using slightly tessellated geometry).


### Snow

Snowflakes should be draw where it is used in the original game.
They are rendered as billboards or sprites.
Original snow data contains enough information to perform per-cluster snow clipping.
Additionally distance clipping should be used - only snowflakes close to the camera should be drawn.

It's unclear whether snow requires fog calculation.
Usually snow billboards aren't drawn too far away from the camera, where global fog is noticeable.
And there is no snow in areas with local fog.

It looks like no lighting calculation is required for snow.
It snows only at well lit areas (under the sky), so constant light can be used.


### Rain

Rain is like snow, but requires extra effects.
It looks like more geometry is used for rain droplets, they are not just sprites.
Additionally water circles should be drawn at places where rain droplets hit the ground.
