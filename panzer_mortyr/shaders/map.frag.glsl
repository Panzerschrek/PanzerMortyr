#version 330

uniform sampler2DArray fu_texture;

in vec2 f_texture_coordinates;
in vec3 f_light;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	color= vec4( texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) ).rgb * f_light, 1.0 );
}
