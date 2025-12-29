#version 330

uniform sampler2D fu_texture;

in vec2 f_texture_coordinates;

out vec4 color;

void main()
{
	color= texture( fu_texture, f_texture_coordinates );
}
