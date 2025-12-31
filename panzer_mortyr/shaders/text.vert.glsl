#version 330

const vec2 coord[3]= vec2[3]( vec2( -1.0, -1.0 ), vec2( -1.0, +1.0 ), vec2( +1.0, +1.0 ) );

layout( location= 0 ) in vec2 v_position;

void main()
{
	gl_Position= vec4( v_position, 0.0, 1.0 );
}
