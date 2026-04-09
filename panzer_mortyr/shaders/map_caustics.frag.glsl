#version 330

uniform sampler2DArray fu_texture;
uniform sampler3D fu_caustics_texture;
uniform float fu_caustics_layer;

in vec2 f_texture_coordinates;
in vec3 f_light;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec3 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) ).rgb;

	float caustics_value= texture( fu_caustics_texture, vec3( f_texture_coordinates, fu_caustics_layer ) ).r;
	float light_scale= 0.5 + caustics_value * 2.0;

	color= vec4( texture_color * ( f_light * light_scale ), 1.0 );
}
