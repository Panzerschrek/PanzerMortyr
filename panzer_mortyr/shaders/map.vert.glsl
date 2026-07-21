#version 330

uniform mat4 vu_matrix;

uniform vec3 vu_light_add;
uniform vec3 vu_light_scale;

layout( location= 0 ) in vec3 v_position;
layout( location= 1 ) in vec3 v_texture_coordinates;
layout( location= 2 ) in vec4 v_light;

noperspective out vec2 f_texture_coordinates;
out vec3 f_light;
flat out float f_texture_layer;

void main()
{
	gl_Position= vec4( v_position, 1.0 ) * vu_matrix;
	f_texture_coordinates= v_texture_coordinates.xy;
	f_texture_layer= v_texture_coordinates.z;
	f_light= vu_light_add + v_light.rgb * vu_light_scale;
}
