#version 330

uniform mat4 vu_matrix;

uniform vec3 vu_light_scale;

layout( location= 0 ) in vec3 v_position;
layout( location= 1 ) in vec3 v_texture_coordinates;
layout( location= 2 ) in vec4 v_light;
layout( location= 3 ) in vec4 v_fog_params;

out vec2 f_texture_coordinates;
out vec4 f_light;
out float f_fog_density;
out float f_additive_fog_density;
flat out float f_texture_layer;

void main()
{
	gl_Position= vec4( v_position, 1.0 ) * vu_matrix;
	f_texture_coordinates= v_texture_coordinates.xy;
	f_texture_layer= v_texture_coordinates.z;
	f_light= vec4( v_light.rgb * vu_light_scale, v_light.a );
	f_fog_density= v_fog_params.r;
	f_additive_fog_density= v_fog_params.g;
}
