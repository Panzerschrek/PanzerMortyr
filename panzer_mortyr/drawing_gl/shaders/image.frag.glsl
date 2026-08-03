#version 330

uniform sampler2D fu_texture;
uniform float fu_alpha;

in vec2 f_texture_coordinates;

out vec4 color;

void main()
{
	vec4 tex_value= texture( fu_texture, f_texture_coordinates );
	color= vec4( tex_value.rgb, tex_value.a * fu_alpha );
}
