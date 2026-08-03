#version 330

uniform sampler3D fu_texture;
uniform vec3 fu_light_scale;
uniform float fu_texture_offset_y;
uniform float fu_texture_layer;
uniform float fu_burning_strength;

in vec3 f_position;
in vec3 f_normal;

out vec4 color;

void main()
{
	// Calculate fire power scale depending on Z coordinate of the fragment's normal.
	// Surfaces which are facing down shouldn't burn.

	vec3 normal_normalized= f_normal * inversesqrt( 0.00001 + dot( f_normal, f_normal ) );

	float normal_based_fire_power_scale= max( 0.0, normal_normalized.z * -0.6 + 0.4 );

	vec3 tc_scale= vec3( 1.0 / 32.0, 1.0 / 32.0, 1.0 / 64.0 );
	vec3 tc= f_position * tc_scale;
	tc.z+= fu_texture_offset_y;

	// Perform here biplanar texture mapping.

	float normal_xy_square_length= max( 0.00001, dot( f_normal.xy, f_normal.xy ) );
	float weight0= f_normal.y * f_normal.y / normal_xy_square_length;
	float weight1= f_normal.x * f_normal.x / normal_xy_square_length;

	float texture_value=
		texture( fu_texture, vec3( tc.xz, fu_texture_layer ) ).r * weight0 +
		texture( fu_texture, vec3( tc.yz, fu_texture_layer ) ).r * weight1;

	// Modulate normal-based power with texture.

	float fire_power= texture_value * normal_based_fire_power_scale * ( 2.0 * fu_burning_strength );

	vec3 color_dark= vec3( 0.0, 0.0, 0.0 );
	vec3 color_blue= vec3( 0.0, 0.0, 0.4 );
	vec3 color_orange= vec3( 0.5, 0.3, 0.1 );
	vec3 color_yellow= vec3( 0.8, 0.8, 0.2 );

	float edge0= 0.1;
	float edge1= 0.6;
	float edge2= 1.1;
	float edge3= 2.0;

	// A tricky code doing gradient with 4 different colors.
	vec3 light_color=
		mix(
			mix(
				mix( color_dark, color_blue, ( fire_power - 0.0 ) / ( edge0 - 0.0 ) ),
				mix( color_blue, color_orange, ( fire_power - edge0 ) / ( edge1 - edge0 ) ),
				step( edge0, fire_power ) ),
			mix(
				mix( color_orange, color_yellow, ( fire_power - edge1 ) / ( edge2 - edge1 ) ),
				mix( color_yellow, color_dark, ( fire_power - edge2 ) / ( edge3 - edge2 ) ),
				step( edge2, fire_power ) ),
			step( edge1, fire_power ) );

	color= vec4( light_color * fu_light_scale, 1.0 );
}
