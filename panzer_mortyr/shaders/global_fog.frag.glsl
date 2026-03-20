#version 330

uniform sampler2D fu_depth_texture;
uniform vec3 fu_fog_color;

in vec2 f_tex_coord;
flat in mat4 f_inverse_projection_matrix;

out vec4 color;

void main()
{
	float depth_buffer_value= texture( fu_depth_texture, f_tex_coord ).r;
	float depth_value_symmetric= depth_buffer_value * 2.0 - 1.0; // in -1 to 1 range
	vec4 clip_space_position= vec4( ( f_tex_coord * 2.0 - vec2( 1.0, 1.0 ) ), depth_value_symmetric, 1.0 );
	vec4 view_space_position= clip_space_position * f_inverse_projection_matrix;

	// Assume that the camera is located at origin.
	float linear_distance= length( view_space_position.xyz ) / view_space_position.w;

	// Use exponential fog formula.
	float distance_scale= 1.0 / 8192.0;
	float fog_density= 1.0 - exp( -linear_distance * distance_scale );

	color= vec4( fu_fog_color, fog_density );
}
