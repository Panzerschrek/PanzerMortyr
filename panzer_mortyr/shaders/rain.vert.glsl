#version 330

uniform float vu_movement_distance;

layout( location= 0 ) in vec3 v_position;
layout( location= 1 ) in float v_max_movement_distance;
layout( location= 2 ) in float v_movement_distance_phase;

out vec3 g_position;
out float g_movement_distance;

void main()
{
	g_position= v_position;

	// Make looping movement within allowed movement distance.
	// It's not fully correct, since it results in greater rain density in regions with small movement distance,
	// but doing otherway isn't possible due to limitations of the precaulculated rain data of the original game.
	g_movement_distance= mod( vu_movement_distance + v_movement_distance_phase, v_max_movement_distance );
}
