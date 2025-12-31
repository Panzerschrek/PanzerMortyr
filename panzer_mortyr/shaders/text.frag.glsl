#version 330

uniform sampler2D fu_texture;

in vec2 f_texture_coordinates;
in vec4 f_foreground_color;
in vec4 f_background_color;


out vec4 color;

void main()
{
	color= mix( f_background_color, f_foreground_color, texture( fu_texture, f_texture_coordinates ).r );
}
