#version 330

uniform sampler2D fu_texture;

in vec2 f_texture_coordinates;
in vec3 f_normal;

out vec4 color;

void main()
{
	vec3 light= vec3( 2.0, 2.0, 0.5 );

	vec3 texture_color= texture( fu_texture, f_texture_coordinates ).rgb;

	color= vec4( texture_color * light, 1.0 );
}
