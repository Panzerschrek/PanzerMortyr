#version 330

uniform sampler2DArray fu_texture;
uniform vec3 fu_fog_color;
uniform vec3 fu_fog_color_additive;

in vec2 f_texture_coordinates;
in vec4 f_light;
in float f_fog_density;
in float f_additive_fog_density;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec4 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) );

	float alpha= texture_color.a * f_light.a;
	vec3 own_color= texture_color.rgb * f_light.rgb;

	vec3 out_color_premultiplied=
		own_color * ( 1.0 - f_fog_density ) +
		fu_fog_color * ( f_fog_density * alpha ) +
		fu_fog_color_additive * ( f_additive_fog_density * alpha );

	color= vec4( out_color_premultiplied, alpha );
}
