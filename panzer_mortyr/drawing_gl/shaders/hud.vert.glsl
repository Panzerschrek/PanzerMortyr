#version 330

layout( location= 0 ) in vec2 v_position;
layout( location= 1 ) in vec2 v_texture_coordinates;

out vec2 f_texture_coordinates;

void main()
{
	gl_Position= vec4( v_position, 0.0, 1.0 );
	f_texture_coordinates= v_texture_coordinates;
}
