#version 330

uniform vec4 fu_triangle_color= vec4( 0.0, 0.0, 1.0, 1.0 );

out vec4 color;

void main()
{
	color= fu_triangle_color;
}
