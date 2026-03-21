#version 330

uniform sampler2DArray fu_texture;

in vec2 f_texture_coordinates;
in vec4 f_light;
in vec4 f_fog_color;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	vec4 texture_color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) );

	if( false )
	{
		texture_color.rgb= texture_color.rgb * 0.0001 + vec3( 0.75, 0.75, 0.75 );
	}

	float alpha= texture_color.a * f_light.a;
	vec3 own_color= texture_color.rgb * f_light.rgb;

	color= vec4( own_color * ( 1.0 - f_fog_color.a ) + f_fog_color.rgb * ( f_fog_color.a * alpha ), alpha );
}
