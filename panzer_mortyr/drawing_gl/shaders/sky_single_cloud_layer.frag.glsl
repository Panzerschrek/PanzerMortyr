#version 330

uniform sampler2DArray fu_texture;
uniform float fu_texture_layer= 0.0;
uniform vec2 fu_texture_shift= vec2( 0.0, 0.0 );

in vec2 f_tex_coord;
in vec3 f_color;

out vec4 color;

void main()
{
	color= vec4( texture( fu_texture, vec3( f_tex_coord + fu_texture_shift, fu_texture_layer ) ).rgb * f_color, 1.0 );
}
