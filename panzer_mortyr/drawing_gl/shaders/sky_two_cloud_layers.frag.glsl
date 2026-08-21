#version 330

uniform sampler2DArray fu_texture;
uniform float fu_texture_layer= 0.0;
uniform vec2 fu_texture_shift= vec2( 0.0, 0.0 );

in vec2 f_tex_coord;
in vec3 f_color;

out vec4 color;

void main()
{
	vec3 layer0_tc= vec3( f_tex_coord + fu_texture_shift, fu_texture_layer );
	vec3 layer1_tc= vec3( f_tex_coord + fu_texture_shift * 2.0, fu_texture_layer + 1.0 );

	vec3 tex_value0= texture( fu_texture, layer0_tc ).rgb;
	vec3 tex_value1= texture( fu_texture, layer1_tc ).rgb;

	color= vec4( ( tex_value0 + tex_value1 ) * f_color, 1.0 );
}
