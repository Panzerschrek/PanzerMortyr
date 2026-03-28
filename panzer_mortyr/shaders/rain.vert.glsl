#version 330

layout( location= 0 ) in vec3 v_position;
layout( location= 1 ) in float v_max_movement_distance;

out vec3 g_position;
out float g_max_movement_distance;

void main()
{
	g_position= v_position;
	g_max_movement_distance= v_max_movement_distance;
}
