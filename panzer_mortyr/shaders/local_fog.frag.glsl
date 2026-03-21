#version 330

uniform vec3 fu_camera_position;
uniform vec3 fu_fog_color;

in vec3 f_position;

out vec4 color;

void main()
{
	float distance_to_fog_volume_back_side= distance( fu_camera_position, f_position );

	float distance_scale= 1.0 / 256.0;
	float fog_density= 1.0 - exp( -distance_to_fog_volume_back_side * distance_scale );

	color= vec4( fu_fog_color, fog_density );
}
