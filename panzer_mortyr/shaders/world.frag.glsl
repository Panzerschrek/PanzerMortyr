#version 330

uniform sampler2DArray fu_texture;

in vec2 f_texture_coordinates;

out vec4 color;

void main()
{
	color= texture( fu_texture, vec3( f_texture_coordinates, 0.0 ) );
}
