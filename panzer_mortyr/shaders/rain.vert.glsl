#version 330

uniform float vu_movement_distance;

layout( location= 0 ) in vec3 v_position;
layout( location= 1 ) in float v_max_movement_distance;
layout( location= 2 ) in float v_movement_distance_phase;

out vec3 g_position;
out float g_movement_distance;
out float g_max_movement_distance;

void main()
{
	g_position= v_position;

	// Assume each rain particle moves along a path with such length.
	// It should be big enough to ensure rain can flow into the deepest places and small enough to avoid reducing rain density too much.
	const float c_max_path_length= 1536.0;

	// Calculate normalized distance phase.
	// It's needed to distribute rain droplets along the whole path (with maximum length).
	float individual_phase= v_movement_distance_phase / v_max_movement_distance;

	g_movement_distance= mod( vu_movement_distance + individual_phase * c_max_path_length, c_max_path_length );

	g_max_movement_distance= v_max_movement_distance;
}
