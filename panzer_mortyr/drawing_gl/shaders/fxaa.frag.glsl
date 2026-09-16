#version 330

uniform sampler2D fu_texture;

out vec4 color;

void main()
{
	// TODO - perform actual FXAA.

	ivec2 coord= ivec2( gl_FragCoord.xy );

	color= texelFetch( fu_texture, coord, 0 );
}
