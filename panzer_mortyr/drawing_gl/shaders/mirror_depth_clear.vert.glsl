#version 330

uniform mat4 vu_matrix;

layout( location= 0 ) in vec3 v_position;

void main()
{
	gl_Position= vec4( v_position, 1.0 ) * vu_matrix;
}
