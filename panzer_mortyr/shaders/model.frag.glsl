#version 330

uniform sampler2DArray fu_texture;

in vec2 f_texture_coordinates;

out vec4 color;

void main()
{
	color= vec4( 1.0, 0.0, 1.0, 1.0 );
}
