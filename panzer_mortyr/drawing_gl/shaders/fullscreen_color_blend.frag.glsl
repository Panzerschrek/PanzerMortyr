#version 330

uniform vec4 fu_color;

in vec2 f_position;

out vec4 color;

void main()
{
	// Apply some simple radial gradient for alpha.
	float alpha_scale= min( 1.0, dot( f_position, f_position ) );
	color= vec4( fu_color.rgb, fu_color.a * alpha_scale );
}
