#version 330

// This shader is used for both snow and rain.
// Geometry shaders for them are different, but compatible (have the same uniforms, inputs, outputs).
//

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

	// Assume each snow/rain particle moves along a path with such length.
	// It should be big enough to ensure snow/rain can fall into the deepest places and small enough to avoid reducing snow/rain density too much.
	const float c_max_path_length= 1536.0;

	g_movement_distance= mod( vu_movement_distance + v_movement_distance_phase * c_max_path_length, c_max_path_length );

	g_max_movement_distance= v_max_movement_distance;
}
