#version 330

uniform sampler2DArray fu_texture;
uniform float fu_texture_layer= 0.0;
uniform vec2 fu_texture_shift= vec2( 0.0, 0.0 );

in vec3 f_position;
in vec3 f_color;

out vec4 color;

void main()
{
	vec3 view_vec_normalized= normalize( f_position );

	const float horizon_level= -0.1;
	float z_adjusted= view_vec_normalized.z + horizon_level;
	vec2 tc= view_vec_normalized.xy / ( abs(z_adjusted) + 0.05 );

	float tc_scale= 1.0; // TODO - tune it?

	color= vec4( texture( fu_texture, vec3( tc * tc_scale + fu_texture_shift, fu_texture_layer ) ).rgb * f_color, 1.0 );
}
