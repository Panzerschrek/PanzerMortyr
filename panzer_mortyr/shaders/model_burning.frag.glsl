#version 330

uniform sampler3D fu_texture;
uniform float fu_texture_offet_y;
uniform float fu_texture_layer;
uniform float fu_burning_strength;

in vec3 f_position;
in vec3 f_normal;

out vec4 color;

void main()
{
	// Calculate fire light scale depending on direction of the fragment relative Z axis.
	// Surfaces which are facing down shouldn't burn.

	vec3 normal_normalized= f_normal / max( 0.00001, length( f_normal ) );

	float light_scale= max( 0.0, normal_normalized.z * -0.6 + 0.4 );

	vec3 tc_scale= vec3( 1.0 / 16.0, 1.0 / 16.0, 1.0 / 32.0 );
	vec3 tc= f_position * tc_scale;

	// Perform here biplanar texture mapping.

	vec2 normal_xy_normalized= f_normal.xy / max( 0.00001, length( f_normal.xy ) );
	float weight0= normal_xy_normalized.y * normal_xy_normalized.y;
	float weight1= normal_xy_normalized.x * normal_xy_normalized.x;

	float texture_value=
		texture( fu_texture, vec3( tc.x, tc.z + fu_texture_offet_y, fu_texture_layer ) ).r * weight0 +
		texture( fu_texture, vec3( tc.y, tc.z + fu_texture_offet_y, fu_texture_layer ) ).r * weight1;

	// Modulate normal-based power with texture.

	float fire_power= texture_value * light_scale * ( 2.0 * fu_burning_strength );

	vec3 color_dark= vec3( 0.0, 0.0, 0.0 );
	vec3 color_blue= vec3( 0.0, 0.0, 0.4 );
	vec3 color_orange= vec3( 0.5, 0.3, 0.1 );
	vec3 color_yellow= vec3( 0.8, 0.8, 0.2 );

	vec3 light_color;
	float edge0= 0.1;
	float edge1= 0.6;
	float edge2= 1.1;
	float edge3= 2.0;

	// A tricky code doing gradient with 4 different colors.
	light_color=
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

	color= vec4( light_color, 1.0 );
}
