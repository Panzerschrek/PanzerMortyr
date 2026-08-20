#version 330

uniform mat4 vu_matrix;

uniform vec3 vu_light_scale;

layout( location= 0 ) in vec3 v_position;
layout( location= 1 ) in vec3 v_color;

out vec2 f_tex_coord;
out vec3 f_color;

void main()
{
	gl_Position= vec4( v_position, 1.0 ) * vu_matrix;

	f_color= v_color * vu_light_scale;

	vec3 view_vec_normalized= normalize( v_position );

	const float horizon_level= -0.1;
	float z_adjusted= view_vec_normalized.z + horizon_level;
	f_tex_coord= view_vec_normalized.xy / ( abs(z_adjusted) + 0.05 );
}
