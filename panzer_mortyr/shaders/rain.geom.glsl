#version 330

layout( points ) in;
layout( triangle_strip, max_vertices = 3 ) out;

uniform mat4 gu_matrix;
uniform vec3 gu_camera_position;
uniform float gu_rain_droplet_size;

in vec3 g_position[];
in float g_movement_distance[];

out vec4 f_color;

// Experimentally-found value.
const vec3 c_move_vector= vec3( 0.235, 0.235, 0.943 );

const float c_max_distance_to_camera= 1536.0;

void main()
{
	vec3 position= g_position[0] + c_move_vector * g_movement_distance[0];

	// Rotate rain triangle to always face towards the camera.

	vec3 vec_to_camera= position - gu_camera_position;

	float distance_to_camera= length( vec_to_camera );

	if( distance_to_camera >= c_max_distance_to_camera )
	{
		return;
	}

	vec3 side_vector= cross( vec_to_camera, c_move_vector );
	vec3 side_vector_scaled= side_vector * ( gu_rain_droplet_size / max( 0.00001, length( side_vector ) ) );

	vec3 v0= position + c_move_vector * (-40.0);
	vec3 v1= position + side_vector_scaled;
	vec3 v2= position - side_vector_scaled;

	float fade= 1.0 - smoothstep( c_max_distance_to_camera * 2.0 / 3.0, c_max_distance_to_camera, distance_to_camera );
	vec4 base_color= vec4( 0.165, 0.513, 0.431, 1.0 ) * 0.5; // TODO - use texture fetch instead.
	f_color= base_color * fade;

	gl_Position= vec4( v0, 1.0 ) * gu_matrix;
	EmitVertex();

	gl_Position= vec4( v1, 1.0 ) * gu_matrix;
	EmitVertex();

	gl_Position= vec4( v2, 1.0 ) * gu_matrix;
	EmitVertex();

	EndPrimitive();
}
