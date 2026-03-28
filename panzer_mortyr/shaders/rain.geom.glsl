#version 330

layout( points ) in;
layout( triangle_strip, max_vertices = 3 ) out;

uniform mat4 gu_matrix;
uniform vec3 gu_camera_position;

in vec3 g_position[];
in float g_movement_distance[];

// Experimentally-found value.
const vec3 c_move_vector= vec3( 0.235, 0.235, 0.943 );

void main()
{
	vec3 position= g_position[0] + c_move_vector * g_movement_distance[0];

	// Rotate rain triangle to always face towards the camera.

	vec3 vec_to_camera= position - gu_camera_position;

	vec3 side_vector= cross( vec_to_camera, c_move_vector );
	vec3 side_vector_scaled= side_vector * ( 5.0 / max( 0.001, length( side_vector ) ) );

	vec3 v0= position + c_move_vector * (-60.0);
	vec3 v1= position + side_vector_scaled;
	vec3 v2= position - side_vector_scaled;

	gl_Position= vec4( v0, 1.0 ) * gu_matrix;
	EmitVertex();

	gl_Position= vec4( v1, 1.0 ) * gu_matrix;
	EmitVertex();

	gl_Position= vec4( v2, 1.0 ) * gu_matrix;
	EmitVertex();

	EndPrimitive();
}
