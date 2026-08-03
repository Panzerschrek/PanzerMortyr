#version 330

uniform sampler2DArray fu_texture;

uniform vec3 fu_light_scale;

in vec2 f_texture_coordinates;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec4 texture_value= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) );
	color= vec4( texture_value.rgb * fu_light_scale, texture_value.a );
}
