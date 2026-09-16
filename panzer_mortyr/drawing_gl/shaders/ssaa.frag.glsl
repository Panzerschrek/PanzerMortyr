#version 330

uniform sampler2D fu_texture;

out vec4 color;

void main()
{
	ivec2 coord= ivec2( gl_FragCoord.xy ) * 2;

	vec4 color0= texelFetch( fu_texture, coord + ivec2( 0, 0 ), 0 );
	vec4 color1= texelFetch( fu_texture, coord + ivec2( 0, 1 ), 0 );
	vec4 color2= texelFetch( fu_texture, coord + ivec2( 1, 0 ), 0 );
	vec4 color3= texelFetch( fu_texture, coord + ivec2( 1, 1 ), 0 );

	color= ( color0 + color1 + color2 + color3 ) * 0.25;
}
