#version 330

layout( location= 0 ) in vec2 v_position;
layout( location= 1 ) in vec2 v_texture_coordinates;
layout( location= 2 ) in vec4 v_foreground_color;
layout( location= 3 ) in vec4 v_background_color;

out vec2 f_texture_coordinates;
out vec4 f_foreground_color;
out vec4 f_background_color;

void main()
{
	gl_Position= vec4( v_position, 0.0, 1.0 );
	f_texture_coordinates= v_texture_coordinates;
	f_foreground_color= v_foreground_color;
	f_background_color= v_background_color;
}
