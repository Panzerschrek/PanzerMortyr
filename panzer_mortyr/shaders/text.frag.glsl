#version 330

in vec2 f_texture_coordinates;

out vec4 color;

void main()
{
	color= vec4( f_texture_coordinates, 0.0, 1.0 );
}
