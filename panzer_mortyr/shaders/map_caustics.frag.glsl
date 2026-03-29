#version 330

uniform sampler2DArray fu_texture;
uniform sampler2D fu_caustics_texture;

in vec2 f_texture_coordinates;
in vec3 f_light;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec3 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) ).rgb;

	if( false )
	{
		texture_color= texture_color * 0.0001 + vec3( 0.75, 0.75, 0.75 );
	}

	float caustics_value= texture( fu_caustics_texture, f_texture_coordinates ).r * 4.0;

	color= vec4( texture_color * f_light * caustics_value, 1.0 );
}
