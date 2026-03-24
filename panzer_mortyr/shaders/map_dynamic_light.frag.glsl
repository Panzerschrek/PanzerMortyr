#version 330

uniform sampler2DArray fu_texture;

uniform vec3 fu_light_position;
uniform float fu_light_power;
uniform vec3 fu_light_color;

in vec3 f_position;
in vec2 f_texture_coordinates;
flat in float f_texture_layer;

out vec4 color;

// Use pretty aggressive bias factor to reduce light source sizes and thus fill less pixels with dynamic lights.
const float light_bias= 1.0 / 8.0; // This constant must match the same value used in the code calculating dynamic light for models!
const float min_square_distance= 1.0 * 1.0;
const float max_intensity= 2.0;

void main()
{
	// Attention!
	// This code should (roughly) match the same code calculating dynamic light for models!

	// Use quadratic attenuation.
	vec3 vec_to_light= fu_light_position - f_position;
	float distance_to_light= dot( vec_to_light, vec_to_light );
	float light_power_unbiased= fu_light_power / max( min_square_distance, distance_to_light );

	if( light_power_unbiased <= light_bias )
	{
		// Hope that both discard/return prevent further calculations and increase overall performance.
		discard;
		return;
	}

	vec3 light= ( light_power_unbiased - light_bias ) * fu_light_color;

	float max_component= max( max( light.r, light.g ), light.b ) ;
	if( max_component > max_intensity )
	{
		light *= max_intensity / max_component;
	}

	vec3 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) ).rgb;

	if( false )
	{
		texture_color= texture_color * 0.0001 + vec3( 0.75, 0.75, 0.75 );
	}

	color= vec4( texture_color * light, 1.0 );
}
