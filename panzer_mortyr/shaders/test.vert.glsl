#version 330

const vec2 coord[3]= vec2[3]( vec2( -1.0, -1.0 ), vec2( -1.0, +1.0 ), vec2( +1.0, +1.0 ) );

void main()
{
	gl_Position= vec4( coord[ gl_VertexID ].xy, 0.0, 1.0 );
}
