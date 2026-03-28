#version 330

layout( points ) in;
layout( triangle_strip, max_vertices = 6 ) out;

uniform mat4 gu_matrix;
uniform vec3 gu_camera_position;
uniform vec2 gu_droplet_size;
uniform vec2 gu_texture_coordinates_start;
uniform vec2 gu_texture_coordinates_end;
uniform float gu_texture_layer;
uniform vec3 gu_light_scale;

in vec3 g_position[];
in float g_movement_distance[];
in float g_max_movement_distance[];

out vec2 f_texture_coordinates;
out vec4 f_light;
out float f_fog_density;
out float f_additive_fog_density;
flat out float f_texture_layer;

// Experimentally-found value.
const vec3 c_move_vector= vec3( 0.235, 0.235, 0.943 );

const float c_max_distance_to_camera= 1536.0;

const vec3 c_spiral_movement_spatial_frequency= vec3( -0.01, 0.02, 0.03 );
const float c_spiral_movement_amplitude= 8.0;

void main()
{
	float movement_distance= g_movement_distance[0];
	if( movement_distance > g_max_movement_distance[0] )
	{
		return;
	}

	vec3 base_position= g_position[0] + c_move_vector * movement_distance;

	// Add spiral side movement.
	float spiral_movement_phase= dot( base_position, c_spiral_movement_spatial_frequency );
	vec3 position=
		base_position +
		c_spiral_movement_amplitude * vec3( cos( spiral_movement_phase ), sin( spiral_movement_phase ), 0.0 );

	// Rotate snow quad to always face towards the camera.

	vec3 vec_to_camera= position - gu_camera_position;

	float distance_to_camera= length( vec_to_camera );

	if( distance_to_camera >= c_max_distance_to_camera )
	{
		return;
	}

	vec3 u_vector= vec3( -vec_to_camera.y, vec_to_camera.x, 0.0 );
	vec3 u_vector_scaled= u_vector * ( gu_droplet_size.x / max( 0.00001, length( u_vector ) ) );

	vec3 v_vector= cross( u_vector, vec_to_camera );
	vec3 v_vector_scaled= v_vector * ( gu_droplet_size.y / max( 0.00001, length( v_vector ) ) );

	vec4 v0= vec4( position + u_vector_scaled - v_vector_scaled, 1.0 ) * gu_matrix;
	vec4 v1= vec4( position + u_vector_scaled + v_vector_scaled, 1.0 ) * gu_matrix;
	vec4 v2= vec4( position - u_vector_scaled - v_vector_scaled, 1.0 ) * gu_matrix;
	vec4 v3= vec4( position - u_vector_scaled + v_vector_scaled, 1.0 ) * gu_matrix;

	vec2 tc0= vec2( gu_texture_coordinates_end.x, gu_texture_coordinates_start.y );
	vec2 tc1= vec2( gu_texture_coordinates_end.x, gu_texture_coordinates_end.y );
	vec2 tc2= vec2( gu_texture_coordinates_start.x, gu_texture_coordinates_start.y );
	vec2 tc3= vec2( gu_texture_coordinates_start.x, gu_texture_coordinates_end.y );

	float fade= 1.0 - smoothstep( c_max_distance_to_camera * 2.0 / 3.0, c_max_distance_to_camera, distance_to_camera );
	f_light= vec4( gu_light_scale, 1.0 ) * fade;

	// Use exponential fog formula.
	// This code (including the scale constant) should match code calculating fog in other places!
	float fog_distance_scale= 1.0 / 3072.0;
	f_fog_density= 1.0 - exp( -distance_to_camera * fog_distance_scale );

	f_additive_fog_density= 0.0; // Don't use additive fog. It's too complex.

	f_texture_layer= gu_texture_layer;

	gl_Position= v0; f_texture_coordinates= tc0; EmitVertex();
	gl_Position= v1; f_texture_coordinates= tc1; EmitVertex();
	gl_Position= v2; f_texture_coordinates= tc2; EmitVertex();
	EndPrimitive();

	gl_Position= v1; f_texture_coordinates= tc1; EmitVertex();
	gl_Position= v2; f_texture_coordinates= tc2; EmitVertex();
	gl_Position= v3; f_texture_coordinates= tc3; EmitVertex();
	EndPrimitive();
}
