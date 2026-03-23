#version 330

uniform sampler2DArray fu_texture;

uniform vec3 fu_light_position;
uniform float fu_light_power;

in vec3 f_position;
in vec2 f_texture_coordinates;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec3 vec_to_light= fu_light_position - f_position;

	const float light_bias= 1.0 / 255.0;
	const float min_distance= 1.0;

	// Use quadratic attenuation.
	float light_power_unbiased= fu_light_power / max( min_distance, dot( vec_to_light, vec_to_light ) );

	if( light_power_unbiased <= light_bias )
	{
		discard;
	}

	float light= light_power_unbiased - light_bias;

	vec3 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) ).rgb;

	if( false )
	{
		texture_color= texture_color * 0.0001 + vec3( 0.75, 0.75, 0.75 );
	}

	color= vec4( texture_color * light, 1.0 );
}
