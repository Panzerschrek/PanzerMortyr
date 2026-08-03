#version 330

// Don't bother with vertex/index buffer for local fog volumes.
// Just use hardcoded vertex coordinates and indices for a cube.

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
	5, 4, 7,  7, 4, 6,
	0, 2, 4,  4, 2, 6,
	3, 1, 5,  3, 5, 7,
	0, 4, 1,  1, 4, 5,
	2, 3, 6,  3, 7, 6
);

uniform mat4 vu_matrix;
uniform vec3 vu_fog_volume_scale;
uniform vec3 vu_fog_volume_offset;

out vec3 f_position;

void main()
{
	vec3 pos= c_vertices[ c_indeces[ gl_VertexID ] ] * vu_fog_volume_scale + vu_fog_volume_offset;
	gl_Position= vec4( pos, 1.0 ) * vu_matrix;
	f_position= pos;
}
