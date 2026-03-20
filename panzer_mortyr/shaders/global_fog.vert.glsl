#version 330

// A single triangle covering the whole screen.
const vec2 vertices[3]= vec2[3]( vec2( -1.1, -1.1 ), vec2( 3.1, -1.1 ), vec2( -1.0, 3.1 ) );

out vec2 f_tex_coord;
flat out mat4 f_inverse_projection_matrix;

void main()
{
	vec2 v= vertices[ gl_VertexID ];
	gl_Position= vec4( v, 0.0, 1.0 );
	f_tex_coord= v * 0.5 + vec2( 0.5, 0.5 );
}
