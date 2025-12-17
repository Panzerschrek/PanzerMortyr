#version 330

uniform vec4 fu_triangle_color= vec4( 1.0, 0.0, 1.0, 1.0 );

in vec2 f_texture_coordinates;

out vec4 color;

void main()
{
	color= fu_triangle_color * ( 0.5 + 0.25 * ( step( 0.5, fract( f_texture_coordinates.x ) ) + step( 0.5, fract( f_texture_coordinates.y ) ) ) );
}
