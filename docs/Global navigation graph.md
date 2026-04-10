### The problem

PanzerMortyr uses navigation graphs of the original game for enemies movement.
These graphs are individually-calculated for each enemy.
They have up to 128 navigation nodes and a precalculated routing table containing index for a node which should be taken to reach some target node staying at some other node.

In many cases routing with these graphs works as expected.
Unfortunately there are cases, where using these graphs gives ugly results.

Problems caused by usage of the original navigation graphs:

* Navigation nodes are spaced in a (almost) regular grid with large gaps, so that no nodes are placed in some tight corridors at all and thus these corridors can't be reached by at least some enemies.
* Sometimes edges between nodes exist where it's not possible to walk at all (at least according to PanzerMortyr physics) - with too steep surfaces, with small (or not so small) obstacles, etc. This results in enemies sticking in some places trying to reach their destination indefinitely.
* 128 nodes limit makes it impossible for enemies to travel too far away from their initial positions.
* In the original game an enemy doesn't consider the player, other enemies and maybe even decorations while doing his movement. Enemies don't try walking around each other, they just pass through. PanzerMortyr does proper enemy to enemy collisions and thus some sort of walking around should be implemented, but it's impossible with individual navigation graphs (it's impossible to mark a node in a graph belonging to one enemy to be occupied by some other enemy).


### The solution

All problems described above may be solved by calculating navigation graphs in PanzerMortyr instead of using precalculated ones.
More precisely, single global navigation graph should be precalculated.
This graph should be precalculated in such a way so that movement between its nodes is possible according to PanzerMortyr physics.

Instead of using precalculating routing tables, proper graph route search should be used.
Some well-known algorithm (like A-star) can be used, for example.

It should be possible to mark navigation graph nodes as occupied by one or maybe a couple of entities.
Such nodes should be excluded from route search - to allow for one enemy finding a way around another.


### Navigation graph building

For each horizontal map quad (with inclination below some threshold) initial navigation graph nodes should be created using a regular grid with some spacing.
This spacing should be small enough to allow placing nodes even in tightest corridors, but not too small to avoid creating too much nodes, which may lead to too much memory consumption and too costly route search.

It should be checked for each node that a bounding box of human size (used by most enemies in the game) can be placed atop of it without colliding with map geometry.
The lower plane of this bounding box should be lifted up to allow placing nodes on stairs.
If it's impossible to place a node, its position may be moved sideways slightly to 4 to 8 base directions to achieve such placement.
It's necessary to perform such movement to center nodes in tight corridors.

Additionally it should be checked that a human-sized bounding box for each node stays mostly on the floor and doesn't stay on a ledge.
This is necessary to avoid ugly movement on ledges when an enemy seems to be mostly in air.

Edges between nearby nodes should be created.
At least 8 nearby nodes should be checked, to allow not only edges with 90 degree angle, but also with 45 degree.
Even farther connections may be considered to allow creating connections in tricky cases.
An edge between two nearby nodes should be created if it's possible to move between them using a human-sized bounding box.
To be able to perform effective neighbor search a quadtree including all nodes should be built.

Graph edges should contain distance in some units - representing real distance in horizontal direction.
It's necessary to have such distances to allow searching the shortest path using something like Euclidian distance, not Manhatten distance.

To allow movement of enemies with larger than human size, extra data should be calculated and stored for the navigation graph.
Each node should include maximum box size (width and height), which can be placed in it.
Each edge should include such sizes too.
Calculating maximum possible size isn't that practical, some small set of sizes (based on sizes actually used by the enemies) should be used instead.

Patrolling points used for enemy movement and stored in the original navigation graphs (or in ZPOZ.ANT files) should be re-attached to the new graph nodes.
It's necessary to allow patrolling movement.


### Navigation graph using

Flying decorations should use old navigation graphs or something derived from them.
Other enemies should use the new graph.

For finding a route proper graph search algorithm should be used.
It should be limited to avoid visiting too many nodes if it's hard or impossible to find a way.
In such case some fallback should be used instead of proper search result, maybe some kind of approximation.

Since it's costly to perform graph search compared to simple table lookup used previously, such search shouldn't be performed too often.
The route found should be stored in the entity state structure, at least its first several nodes.
Route recalculation should be triggered only if a navigation target was changed, a target was reached, the end of the stored route was reached or if some obstacle stays in the way.

Each enemy having a bounding box should mark as occupied navigation graph nodes with bounding boxes intersecting his own bounding box.
While doing route calculation nodes occupied by other enemies should be considered to be unreachable, so that enemies can find a way around each other.

If an enemy has bumped into another enemy (or the player) while performing his own movement, he should recalculate his route to find a way around.
But this may lead to tricky cases where two enemies going in opposite directions decide to go to the same direction to find a way around each other.
Some mechanism should be introduced to avoid such cases, maybe one using some random decisions.


### Savegame and networking stability

As long as floating-point calculations are used for calculating navigation graphs, it's possible that a calculated graph may be different for different machines or even on the same machine having different floating point flags enabled from run to run.
Thus storing indices of nodes in entity state may lead to problems if such indices were saved/loaded or transferred via network and they are no longer match with the navigation graph calculated in the current game run.
To avoid such problems it should be considered to store precalculated navigation graphs in save files and (for network game modes) to transfer them via network.


### Performance considerations

Calculating navigation graphs in a way described above isn't trivial and requires some computational time.
But it's assumed that this can be done in loading stage and it doesn't take too long to finish.
It it takes way too long, some sort of on-disk caching can be used (like in Half-Life 2 with its famous _Node graph out of date. Rebuilding..._ ).

The initial node placement algorithm has linear time complexity proportional to the number of floor map quads and their overall area.
Checking for possibility of node placement adds extra logarithmic scale, since it requires querying map quads hierarchy.

The edges creation algorithm has basic linear complexity proportional to the number of navigation nodes created.
Extra logarithmic scale is applied too - to query nearby nodes using nodes quadtree and for querying quads hierarchy for reachability check.

Performing graph search in runtime isn't generally cheap, since it requires visiting many navigation graph nodes.
So, this algorithm should be very well optimized.
It should not require enumerating all nodes for doing a search (like for resetting a distance table).
It should not use recursion, since recursive calls add extra cost.
The size of data structures used by it should be minimized - to improve cache-locality.
It should use some heuristics (like A-star implementations do) in order to allow moving mostly towards the target without enumerating all nodes nearby.
Lastly it should use some hard limit for number of nodes visited, so that the entire graph isn't visited in case if no route can be found.
