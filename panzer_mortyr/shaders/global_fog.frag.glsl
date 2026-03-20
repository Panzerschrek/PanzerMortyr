#version 330

uniform sampler2D fu_depth_texture;

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

	float fog_density= min( linear_distance / 256.0, 1.0 );

	color= vec4( 1.0, 0.0, 1.0, fog_density );
}
