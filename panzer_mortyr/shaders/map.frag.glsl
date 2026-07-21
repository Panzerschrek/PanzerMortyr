#version 330

uniform sampler2DArray fu_texture;

noperspective in vec2 f_texture_coordinates;
in vec3 f_light;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec3 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) ).rgb;

	color= vec4( texture_color * f_light, 1.0 );
}
