#version 330

in vec3 f_position;

out vec4 color;

void main()
{
	vec3 view_vec_normalized= normalize( f_position );

	const float horizon_level= -0.1;
	float z_adjusted= view_vec_normalized.z + horizon_level;
	vec2 tc= view_vec_normalized.xy / ( abs(z_adjusted) + 0.05 );

	color= vec4( fract( tc ), 0.0, 1.0 );
}
