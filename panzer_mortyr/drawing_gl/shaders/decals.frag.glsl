#version 330

uniform sampler2DArray fu_texture;

in vec2 f_texture_coordinates;
in vec3 f_light;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec4 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) );

	// Use alpha-test for decals.
	if( texture_color.a < 0.5 )
	{
		discard;
	}

	color= vec4( texture_color.rgb * f_light, 1.0 );
}
