#version 330

layout( location= 0 ) in vec3 v_position;
layout( location= 1 ) in float v_max_movement_distance;
layout( location= 2 ) in float v_movement_distance_phase;

out vec3 g_position;
out float g_max_movement_distance;
out float g_movement_distance_phase;

void main()
{
	g_position= v_position;
	g_max_movement_distance= v_max_movement_distance;
	g_movement_distance_phase= v_movement_distance_phase;
}
