#version 330

uniform mat4 vu_matrix;

layout( location= 0 ) in vec2 v_texture_coordinates;
layout( location= 1 ) in vec3 v_position;
layout( location= 2 ) in vec3 v_normal;

out vec2 f_texture_coordinates;
out vec3 f_normal;

void main()
{
	gl_Position= vec4( v_position, 1.0 ) * vu_matrix;
	f_texture_coordinates= v_texture_coordinates;
	f_normal= v_normal;
}
