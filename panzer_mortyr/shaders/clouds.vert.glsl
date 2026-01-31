#version 330

const vec3 c_vertices[5]= vec3[5]
(
	vec3( 1.0,  1.0, 0.2),
	vec3(-1.0,  1.0, 0.2),
	vec3( 1.0, -1.0, 0.2),
	vec3(-1.0, -1.0, 0.2),
	vec3(0, 0, -1.0)
);

const int c_num_indices= 4 * 3;

const int c_indeces[c_num_indices]= int[c_num_indices]
(
	4, 1, 0,
	4, 3, 1,
	4, 2, 3,
	4, 0, 2
);

uniform mat4 vu_matrix;

out vec3 f_position;

void main()
{
	vec3 pos= c_vertices[ c_indeces[ gl_VertexID ] ];
	gl_Position= vec4( pos, 1.0 ) * vu_matrix;
	f_position= pos;
}
