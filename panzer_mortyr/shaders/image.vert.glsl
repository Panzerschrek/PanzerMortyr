#version 330

const vec2 vertices[4]= vec2[4](
	vec2( 0.0, 0.0 ),
	vec2( 1.0, 0.0 ),
	vec2( 0.0, 1.0 ),
	vec2( 1.0, 1.0 ) );

const int indices[6]= int[6]( 0, 1, 2, 1, 2, 3 );

uniform vec2 vu_scale;
uniform vec2 vu_offset;

uniform vec2 vu_tc_scale;
uniform vec2 vu_tc_offset;

out vec2 f_texture_coordinates;

void main()
{
	vec2 coord= vertices[ indices[ gl_VertexID ] ];
	gl_Position= vec4( coord * vu_scale + vu_offset, 0.0, 1.0 );
	f_texture_coordinates= coord * vu_tc_scale + vu_tc_offset;
}
