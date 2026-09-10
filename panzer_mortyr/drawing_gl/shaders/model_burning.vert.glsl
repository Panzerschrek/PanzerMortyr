#version 330

uniform mat4 vu_matrix;
uniform float vu_frame_mix;

uniform sampler3D vu_texture;
uniform vec3 vu_light_scale;
uniform float vu_texture_offset_y;
uniform float vu_texture_layer;
uniform float vu_burning_strength;

layout( location= 0 ) in vec2 v_texture_coordinates;
layout( location= 1 ) in vec3 v_position0;
layout( location= 2 ) in vec3 v_position1;
layout( location= 3 ) in vec3 v_normal0;
layout( location= 4 ) in vec3 v_normal1;

out vec3 f_position;
out vec3 f_color;

void main()
{
	vec3 position= mix( v_position0, v_position1, vu_frame_mix );
	vec3 normal= mix( v_normal0, v_normal1, vu_frame_mix );

	gl_Position= vec4( position, 1.0 ) * vu_matrix;

	// Calculate fire power scale depending on Z coordinate of the fragment's normal.
	// Surfaces which are facing down shouldn't burn.

	vec3 normal_normalized= normal * inversesqrt( 0.00001 + dot( normal, normal ) );

	float normal_based_fire_power_scale= max( 0.0, normal_normalized.z * -0.6 + 0.4 );

	vec3 tc_scale= vec3( 1.0 / 32.0, 1.0 / 32.0, 1.0 / 64.0 );
	vec3 tc= position * tc_scale;
	tc.z+= vu_texture_offset_y;

	// Perform here biplanar texture mapping.

	float normal_xy_square_length= max( 0.00001, dot( normal.xy, normal.xy ) );
	float weight0= normal.y * normal.y / normal_xy_square_length;
	float weight1= normal.x * normal.x / normal_xy_square_length;

	float texture_value=
		texture( vu_texture, vec3( tc.xz, vu_texture_layer ) ).r * weight0 +
		texture( vu_texture, vec3( tc.yz, vu_texture_layer ) ).r * weight1;

	// Modulate normal-based power with texture.

	float fire_power= texture_value * normal_based_fire_power_scale * ( 2.0 * vu_burning_strength );

	const vec3 color_dark= vec3( 0.0, 0.0, 0.0 );
	const vec3 color_blue= vec3( 0.0, 0.0, 0.4 );
	const vec3 color_orange= vec3( 0.5, 0.3, 0.1 );
	const vec3 color_yellow= vec3( 0.8, 0.8, 0.2 );

	const float edge0= 0.1;
	const float edge1= 0.6;
	const float edge2= 1.1;
	const float edge3= 2.0;

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

	f_color= light_color * vu_light_scale;
}
