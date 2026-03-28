#version 330

layout( points ) in;
layout( triangle_strip, max_vertices = 3 ) out;

uniform mat4 gu_matrix;

in vec3 g_position[];

void main()
{
	vec3 position= g_position[0];
	vec3 v0= position + vec3( 0.0, 0.0, -60.0 );
	vec3 v1= position + vec3(  -5.0, 0.0, 0.0 );
	vec3 v2= position + vec3(   5.0, 0.0, 0.0 );

	gl_Position= vec4( v0, 1.0 ) * gu_matrix;
	EmitVertex();

	gl_Position= vec4( v1, 1.0 ) * gu_matrix;
	EmitVertex();

	gl_Position= vec4( v2, 1.0 ) * gu_matrix;
	EmitVertex();

	EndPrimitive();
}
