#version 330

const vec2 vertices[4]= vec2[4](
	vec2( -1.0, -1.0 ),
	vec2(  1.0, -1.0 ),
	vec2( -1.0,  1.0 ),
	vec2(  1.0,  1.0 ) );

const int indices[6]= int[6]( 0, 1, 2, 1, 2, 3 );

void main()
{
	gl_Position= vec4( vertices[ indices[ gl_VertexID ] ] * 0.5, 0.0, 1.0 );
}
