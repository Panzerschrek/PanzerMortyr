#version 330

uniform mat4 vu_matrix;

const vec3 coord[3]= vec3[3]( vec3( 0.0, 0.75, 0.5 ), vec3( +0.5, -0.5, 0.0 ), vec3( -0.5, -0.5, 0.0 ) );

void main()
{
	gl_Position= vu_matrix * vec4( coord[ gl_VertexID ], 1.0 );
}
