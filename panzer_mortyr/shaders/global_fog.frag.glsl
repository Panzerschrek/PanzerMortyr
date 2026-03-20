#version 330

uniform sampler2D fu_depth_texture;
uniform float fu_z_near;
uniform float fu_z_far;

in vec2 f_tex_coord;
flat in mat4 f_inverse_projection_matrix;

out vec4 color;

void main()
{
	float depth_buffer_value= texture( fu_depth_texture, f_tex_coord ).r;
	float depth_value_symmetric= depth_buffer_value * 2.0 - 1.0; // in -1 to 1 range
	float z= -2.0 * fu_z_near * fu_z_far / ( ( fu_z_far - fu_z_near ) * depth_value_symmetric - ( fu_z_near + fu_z_far ) );

	float w= z;

	vec4 coordinates_after_transformation= vec4( f_tex_coord * 2.0 - vec2( 1.0, 1.0 ), z, 1.0 ) * w;
	vec4 coordinates_before_transformation= coordinates_after_transformation * f_inverse_projection_matrix;

	// Assume that the camera is located at origin.
	float linear_distance= length( coordinates_before_transformation.xyz );

	float fog_density= min( linear_distance / 256.0, 1.0 );

	color= vec4( 1.0, 0.0, 1.0, fog_density );
}
