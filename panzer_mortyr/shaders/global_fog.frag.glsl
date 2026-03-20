#version 330

uniform sampler2D fu_depth_texture;

in vec2 f_tex_coord;

out vec4 color;

void main()
{
	float val= texture( fu_depth_texture, f_tex_coord ).r;
	color= vec4( 1.0, 0.0, 1.0, 0.01 / ( 1.01 - val ) );
}
