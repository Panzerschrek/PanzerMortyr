#version 330

uniform sampler2D fu_texture;

uniform vec3 fu_light;

in vec2 f_texture_coordinates;

out vec4 color;

void main()
{
	color= vec4( texture( fu_texture, f_texture_coordinates ).rgb * fu_light, 1.0 );
}
