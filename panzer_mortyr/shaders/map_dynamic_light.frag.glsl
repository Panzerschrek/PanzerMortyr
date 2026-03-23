#version 330

uniform sampler2DArray fu_texture;

in vec2 f_texture_coordinates;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec3 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) ).rgb;

	if( false )
	{
		texture_color= texture_color * 0.0001 + vec3( 0.75, 0.75, 0.75 );
	}

	vec3 light= vec3( 1.0, 0.0, 1.0 ); // TODO - calculate it properly.

	color= vec4( texture_color * light, 1.0 );
}
