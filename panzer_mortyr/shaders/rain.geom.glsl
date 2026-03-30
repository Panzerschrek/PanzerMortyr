#version 330

// This shader should be interchangable with the snow shader (including the same uniforms, inputs and outputs)!
//

layout( points ) in;
layout( triangle_strip, max_vertices = 3 ) out; // Emit single triangle (or nothing).

uniform mat4 gu_matrix;
uniform vec3 gu_camera_position;
uniform vec2 gu_droplet_size;
uniform vec2 gu_texture_coordinates_start;
uniform vec2 gu_texture_coordinates_end;
uniform float gu_texture_layer;
uniform vec3 gu_light_scale;
uniform float gu_fog_distance_scale;

in vec3 g_position[];
in float g_movement_distance[];
in float g_max_movement_distance[];

out vec2 f_texture_coordinates;
out vec4 f_light;
out float f_fog_density;
out float f_additive_fog_density;
flat out float f_texture_layer;

// Experimentally-found value, which matches rain droplet paths observable in the original game.
// It should match the same constant in the snow shader!
const vec3 c_move_vector= vec3( 0.235, 0.235, 0.943 );

const float c_max_distance_to_camera= 1536.0;

void main()
{
	float movement_distance= g_movement_distance[0];
	if( movement_distance > g_max_movement_distance[0] )
	{
		return;
	}

	vec3 position= g_position[0] + c_move_vector * movement_distance;

	// Rotate rain triangle around its movement axis to always face the camera.

	vec3 vec_to_camera= position - gu_camera_position;

	float distance_to_camera= length( vec_to_camera );

	if( distance_to_camera >= c_max_distance_to_camera )
	{
		return;
	}

	vec3 side_vector= cross( vec_to_camera, c_move_vector );
	vec3 side_vector_scaled= side_vector * ( gu_droplet_size.x / max( 0.00001, length( side_vector ) ) );

	vec3 v0= position + c_move_vector * ( -40.0 * gu_droplet_size.y );
	vec3 v1= position + side_vector_scaled;
	vec3 v2= position - side_vector_scaled;

	// Smoothly make rain droplets dimmer at distances close to the max draw distance.
	float fade= 1.0 - smoothstep( c_max_distance_to_camera * 2.0 / 3.0, c_max_distance_to_camera, distance_to_camera );
	f_light= vec4( gu_light_scale, 1.0 ) * fade;

	// TODO - allow turning fog off.
	// Use exponential fog formula.
	// This code should match code calculating fog in other places!
	f_fog_density= 1.0 - exp( distance_to_camera * gu_fog_distance_scale );

	f_additive_fog_density= 0.0; // Don't use additive fog. It's too complex.

	f_texture_layer= gu_texture_layer;

	gl_Position= vec4( v0, 1.0 ) * gu_matrix;
	f_texture_coordinates= vec2( ( gu_texture_coordinates_start.x + gu_texture_coordinates_end.x ) * 0.5, gu_texture_coordinates_end.y );
	EmitVertex();

	gl_Position= vec4( v1, 1.0 ) * gu_matrix;
	f_texture_coordinates= vec2( gu_texture_coordinates_start.x, gu_texture_coordinates_start.y );
	EmitVertex();

	gl_Position= vec4( v2, 1.0 ) * gu_matrix;
	f_texture_coordinates= vec2( gu_texture_coordinates_end.x, gu_texture_coordinates_start.y );
	EmitVertex();

	EndPrimitive();
}
