#version 330

uniform sampler2D fu_texture;

in vec2 f_texture_coordinates;
in vec4 f_foreground_color;
in vec4 f_background_color;

out vec4 color;

void main()
{
	vec4 shadow_color= ( f_foreground_color + f_background_color ) * 0.5;

	vec2 texture_value= texture( fu_texture, f_texture_coordinates ).rg;

	color= mix( mix( f_background_color, shadow_color, texture_value.g ), f_foreground_color, texture_value.r );
}
