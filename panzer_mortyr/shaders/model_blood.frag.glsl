#version 330

uniform sampler2DArray fu_texture;
uniform float fu_texture_layer;

uniform vec4 fu_light_spherical_harmonics_r;
uniform vec4 fu_light_spherical_harmonics_g;
uniform vec4 fu_light_spherical_harmonics_b;

in vec2 f_texture_coordinates;
in vec3 f_normal;

out vec4 color;

float CalculateComponentLight( vec4 spherical_harmonics, vec3 normal_normalized )
{
	return dot( normal_normalized, spherical_harmonics.xyz ) + spherical_harmonics.w;
}

void main()
{
	vec3 normal_normalized= f_normal * inversesqrt( 0.00001 + dot( f_normal, f_normal ) );

	vec3 light=
		vec3(
			CalculateComponentLight( fu_light_spherical_harmonics_r, normal_normalized ),
			CalculateComponentLight( fu_light_spherical_harmonics_g, normal_normalized ),
			CalculateComponentLight( fu_light_spherical_harmonics_b, normal_normalized ) );

	vec4 texture_color= texture( fu_texture, vec3( f_texture_coordinates, fu_texture_layer ) );

	color= vec4( texture_color.rgb * light, texture_color.a );
}
