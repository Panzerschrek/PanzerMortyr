#version 330

// A single triangle covering the whole screen.
const vec2 vertices[3]= vec2[3]( vec2( -1.1, -1.1 ), vec2( 3.1, -1.1 ), vec2( -1.0, 3.1 ) );

void main()
{
	gl_Position= vec4( vertices[ gl_VertexID ], 0.0, 1.0 );
}
