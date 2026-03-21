#version 330

uniform vec3 fu_fog_color;

out vec4 color;

void main()
{
	color= vec4( fu_fog_color, 0.5 );
}
