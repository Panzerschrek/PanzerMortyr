#version 330

// A single triangle covering the whole screen.
const vec2 vertices[3]= vec2[3]( vec2( -1.1, -1.1 ), vec2( 3.1, -1.1 ), vec2( -1.0, 3.1 ) );

out vec2 f_position;

void main()
{
	vec2 position= vertices[ gl_VertexID ];
	gl_Position= vec4( position, 0.0, 1.0 );
	f_position= position;
}
