#version 330

uniform sampler2D fu_texture;

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

	vec3 texture_color= texture( fu_texture, f_texture_coordinates ).rgb;

	color= vec4( texture_color * light, 1.0 );

	if( false )
	{
		color= vec4( normal_normalized * 0.5 + vec3( 0.5, 0.5, 0.5 ), 1.0 );
	}
}
