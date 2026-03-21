#version 330

const vec3 c_vertices[8]= vec3[8]
(
	vec3( -1.0, -1.0, -1.0 ),
	vec3( -1.0, -1.0,  1.0 ),
	vec3( -1.0,  1.0, -1.0 ),
	vec3( -1.0,  1.0,  1.0 ),
	vec3(  1.0, -1.0, -1.0 ),
	vec3(  1.0, -1.0,  1.0 ),
	vec3(  1.0,  1.0, -1.0 ),
	vec3(  1.0,  1.0,  1.0 )
);

const int c_num_indices= 6 * 2 * 3;

const int c_indeces[c_num_indices]= int[c_num_indices]
(
	0, 1, 3,  0, 3, 2,
	4, 5, 7,  4, 7, 6,
	0, 2, 4,  2, 4, 6,
	1, 3, 5,  3, 5, 7,
	0, 1, 4,  1, 4, 5,
	2, 3, 6,  3, 6, 7
);

uniform mat4 vu_matrix;

void main()
{
	vec3 pos= c_vertices[ c_indeces[ gl_VertexID ] ];
	gl_Position= vec4( pos * 32.0, 1.0 ) * vu_matrix;
}
