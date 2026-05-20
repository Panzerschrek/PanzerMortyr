#version 330

const vec2 vertices[4]= vec2[4](
	vec2( 0.0, 0.0 ),
	vec2( 1.0, 0.0 ),
	vec2( 0.0, 1.0 ),
	vec2( 1.0, 1.0 ) );

const int indices[6]= int[6]( 0, 1, 2, 1, 2, 3 );

out vec2 f_texture_coordinates;

void main()
{
	vec2 coord= vertices[ indices[ gl_VertexID ] ];
	// Flip vertically. Videos are stored in top to bottom lines order.
	gl_Position= vec4( coord.x * 2.0 - 1.0, 1.0 - coord.y * 2.0, 0.0, 1.0 );
	f_texture_coordinates= coord;
}
