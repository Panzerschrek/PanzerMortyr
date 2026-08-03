#version 330

uniform mat4 vu_matrix;
uniform float vu_frame_mix;

layout( location= 0 ) in vec2 v_texture_coordinates;
layout( location= 1 ) in vec3 v_position0;
layout( location= 2 ) in vec3 v_position1;
layout( location= 3 ) in vec3 v_normal0;
layout( location= 4 ) in vec3 v_normal1;

out vec2 f_texture_coordinates;
out vec3 f_normal;

void main()
{
	gl_Position= vec4( mix( v_position0, v_position1, vu_frame_mix ), 1.0 ) * vu_matrix;
	f_texture_coordinates= v_texture_coordinates;
	f_normal= mix( v_normal0, v_normal1, vu_frame_mix );
}
