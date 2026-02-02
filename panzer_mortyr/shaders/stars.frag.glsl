#version 330

uniform sampler2DArray fu_texture;

in vec2 f_texture_coordinates;
flat in float f_texture_layer;

out vec4 color;

void main()
{
	// Make stars/moon a little bit darker, in order to avoid overbright (we use additve blending for them).
	color= texture( fu_texture, vec3( f_texture_coordinates, f_texture_layer ) ) * 0.7;
}
