#version 330

in vec3 f_normal;

out vec4 color;

void main()
{
	// Calculate fire light scale depending on direction of the fragment relative Z axis.
	// Surfaces which are facing down shouldn't burn.

	vec3 normal_normalized= f_normal / max( 0.00001, length( f_normal ) );

	float light_scale_raw= max( 0.0, normal_normalized.z * -0.6 + 0.4 );
	float light_scale= light_scale_raw * light_scale_raw;

	vec3 light_color= vec3( 0.5, 0.5, 0.125 );

	color= vec4( light_color * light_scale, 1.0 );
}
