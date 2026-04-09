#version 330

in vec3 f_normal;

out vec4 color;

void main()
{
	vec3 light= vec3( 0.5, 0.5, 0.125 );

	color= vec4( light, 1.0 );
}
