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

	f_tex_coord= view_vec_normalized.xy / ( 0.5001 - 0.5 * view_vec_normalized.z );
}
