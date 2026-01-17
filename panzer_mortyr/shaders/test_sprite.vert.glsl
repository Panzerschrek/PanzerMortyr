#version 330

uniform mat4 vu_matrix;

void main()
{
	gl_Position= vec4( 0.0, 0.0, 0.0, 1.0 ) * vu_matrix;
}
