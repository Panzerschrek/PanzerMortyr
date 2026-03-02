#version 330

uniform sampler2DArray fu_texture;

in vec2 f_texture_coordinates;
in vec3 f_light;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec4 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) );

	if( false )
	{
		texture_color.rgb= texture_color.rgb * 0.0001 + vec3( 0.75, 0.75, 0.75 );
	}

	color= vec4( texture_color.rgb * f_light, texture_color.a );
}
