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

	float tc_scale= 0.5;
	float layer1_shift_scale= 2.0;

	vec2 tc_scaled= tc * tc_scale;

	vec3 layer0_tc= vec3( tc_scaled + fu_texture_shift, fu_texture_layer );
	vec3 layer1_tc= vec3( tc_scaled + fu_texture_shift * layer1_shift_scale, fu_texture_layer + 1.0 );

	vec3 tex_value0= texture( fu_texture, layer0_tc ).rgb;
	vec3 tex_value1= texture( fu_texture, layer1_tc ).rgb;

	color= vec4( ( tex_value0 + tex_value1 ) * f_color, 1.0 );
}
