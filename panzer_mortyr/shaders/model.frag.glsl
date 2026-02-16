#version 330

uniform sampler2D fu_texture;

uniform vec3 fu_light;

in vec2 f_texture_coordinates;
in vec3 f_normal;

out vec4 color;

void main()
{
	vec3 normal_normalized= f_normal * inversesqrt( 0.00001 + dot( f_normal, f_normal ) );

	color= vec4( texture( fu_texture, f_texture_coordinates ).rgb * fu_light, 1.0 );

	if( false )
	{
		color= vec4( normal_normalized * 0.5 + vec3( 0.5, 0.5, 0.5 ), 1.0 );
	}
}
