#version 330

uniform sampler3D fu_texture;
uniform float fu_texture_offet_y;

in vec3 f_position;
in vec3 f_normal;

out vec4 color;

void main()
{
	// Calculate fire light scale depending on direction of the fragment relative Z axis.
	// Surfaces which are facing down shouldn't burn.

	vec3 normal_normalized= f_normal / max( 0.00001, length( f_normal ) );

	float light_scale_raw= max( 0.0, normal_normalized.z * -0.6 + 0.4 );
	float light_scale= light_scale_raw * light_scale_raw;

	vec3 light_color= vec3( 0.75, 0.75, 0.25 );

	float tc_scale= 1.0 / 16.0;
	vec3 tc= f_position * tc_scale;

	vec2 normal_xy_normalized= f_normal.xy / max( 0.00001, length( f_normal.xy ) );
	float weight0= normal_xy_normalized.y * normal_xy_normalized.y;
	float weight1= normal_xy_normalized.x * normal_xy_normalized.x;

	float texture_value=
		texture( fu_texture, vec3( tc.x, tc.z + fu_texture_offet_y, 0.0 ) ).r * weight0 +
		texture( fu_texture, vec3( tc.y, tc.z + fu_texture_offet_y, 0.0 ) ).r * weight1;

	color= vec4( light_color * ( light_scale * texture_value ), 1.0 );
}
