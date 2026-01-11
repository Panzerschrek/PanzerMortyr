PanzerMortyr requires game physics, which includes player and enemies movement, collision detection, buttons/platforms/doors movement, shots tracing, etc.
This document describes what and how should be implemented.

### Original game physics

It's experimentally proven that the player uses axis-aligned bounding box for world collision.
It can be seen, that the minimum possible stay distance to an axis-aligned wall is shorter then to a wall at 45 degrees angle.
Collision boxes for entities are specified in the entities description file in form of a box too, almost always with identical X and Y dimensions, which can suggest, that an axis-aligned bounding box is used for entities too.

Experiments have shown, that the player can't push an enemy and an enemy can't push the player.
But there are pushable entities, like barrels or crates.
They can be pushed and even collisions like player->crate->wall are properly resolved, but not collisions like player->crate->crate.
Also map polygonal objects (buttons/doors/platforms) should push entities.

The player can climb stairs or any other places with slight floor height difference.
While performing climbing the camera position moves slightly up and down.
Pushable objects can climb stairs too.
Enemies should be also able to climb stairs.

Map files contain quads which are not axis-aligned.
Collisions with them work as expected - the player can slide along a non-aligned wall and can climb ramps.

The original game tolerates some tricky physics cases, like one of the walls on map 33, which can be crossed from behind but not back.
PanzerMortyr should handle such cases or at least add a hack for them (like ignoring some specific polygon on some specific map).


### Possible collision implementation approaches

Generally collisions detection and movement code in PanzerMortyr should be simple compared to more satisficated approaches used in modern games.
The fact that the majority of colliders are aligned bounding boxes allows using these boxes in calculations.
One of the possible ways of doing this is to use Minkowski sums of colliders to simplify box<->box collisions using point<->box collisions instead.
Non-trivial map quads may require slightly more advanced collision code - it's necessary to build polyhedra slightly more complex than a box (with more planes).

Entity<-> entity collisions and player<->entity collisions can be done in steps.
In each step movement of one entity is processed and all other entities are assumed to be non-movable.
Doing so will naturally lead to impossibility of entities to move each other.
The only exception should be done for pushable entities.

Performing collisions with map polygonal objects (buttons, doors, platforms) is a little bit trickier.
It may require calculations in object's reference frame, where it is assumed to be stationary and all entities around are assumed to be moving.

Stairs require extra logic.
This may require checking for climbing possibility if an entity can't move forward.
If it's possible to climb, it should be done.
The exact logic should be similar to one which Quake uses.

Jumping requires performing detection of in-air/on-ground state.
It should be allowed to jump only while staying on ground.
Additionally it should be not allowed to jump on too inclined (almost vertical) ramps.

Typical collision resoulution for an entity should work in the following way:

1. Calculate new position based on entity logic, but preserve the old one.
2. Cast a ray from the entity old position towards its new position and find the nearest intersection with map geometry and other entities, including normal of the collision point.
   The current entity is assumed to be a zero-sized point, other entities and map geomtry are extended using bounding box of the current entity.
3. Move the entity towards the intersection point, or to the new position if no intersection was detected.
4. If it's not possible to move full length, it should be checked if it's possible to move slightly up (using step height constant) and forward.
   If the resulting movement distance is greater than one without up move, up move should be performed.
   This can allow simulating stairs climbing.
5. Subtract from remaining movement vector the component parallel to the normal of the collision point and move the entity further using resulting vector.
6. If an entity moves with non-constant speed (can accelerate or decelerate) its speed should be clamped using normal of the nearest collision point.
7. Repeat steps 2 to 6 several times (at least 2 or maybe even 3 or 4), which is necessary to resolve collisions in complex cases like walking towards a sharp angle.

Additionally some tricky cases should be solved.
This includes the case when an entity is for some reason slightly inside a collider (like due to numerical errors) and cases where it was inside and moved outside.

### Possible solution for pushers

Pushers are dynamic clusters (doors, elevators, buttons) for the player and enemies and the player for pushable entities (like crates).
Pusher physic objects may be processed in some different way compared to regular ones.

One of the possible ways is to allow pushing other objects while processing logic for a pusher object.
But this pushing should check if a pushed object can be pushed.
This check may be performed recursively (up to some depth) in order to be able to push one pushable object via another one.
If it's possible to push the whole chain of objects - a push should be performed, otherwise the current pusher should stop.
This logic may be useful for elevators - when the players stays in an elevator shaft and the elevator travels down its movement should be stopped in order to prevent crushing the player.


### Performance considerations

Collisions detection/movement code should be well-optimized.

For entity<->world collisions world polygons should be rejected on per-cluster basis - in order to skip all clusters which can't possibly affect an entity (which are too far away).
Additional early checks may be also useful - like for checking for box intersection before performing collision with a complex polyhedron.

Bullets collision calculation should be also somehow optimized, which may be a little bit tricky.
It may require calculating the intersection of a cluster bounding box with the bullet ray - in order to skip checking collisions against cluster geometry if the ray doesn't intersect cluster at all.

Entity<->entity and player<->entity collisions can't be such easily optimized.
It may require building a per-frame hierarchy, in order to avoid performing collisions of each entity with each other entity (which has quadratic time complexity).
But maybe no special consideration should be done, since the amount of entities with colliders are usually pretty low - no more then 50 per map, which requires 2500 collision checks on each step.


### Theoretical knowledge required

Of course physics code requires some maths.
This includes following algorithms:

* Finding an intersection between a ray and a triangle.
* Finding an intersection between a ray and an axis-aligned box.
* Finding an intersection between a ray and a convex polyhedron (defined by its planes).
* Checking if a point is inside an axis-aligned box.
* Checking if a point is inside a convex polyhedron (defined by its planes).
* Calculating Minkowski sum for two axis-aligned boxes.
* Calculating Minkowski sum for an axis-aligned box and a triangle or a planar quad.
