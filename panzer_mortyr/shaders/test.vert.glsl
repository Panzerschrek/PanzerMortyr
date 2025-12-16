#version 330

uniform vec3 vu_translate= vec3( 0.0, 0.0, 0.0 );


const vec2 coord[3]= vec2[3]( vec2( 0.0, 0.75 ), vec2( +0.5, -0.5 ), vec2( -0.5, -0.5 ) );

void main()
{
	gl_Position= vec4( vec3( coord[ gl_VertexID ].xy, 0.0 ) + vu_translate, 1.0 );
}
