#version 330

uniform mat4 vu_matrix;

uniform vec3 vu_light_scale;

layout( location= 0 ) in vec3 v_position;
layout( location= 1 ) in vec3 v_color;

out vec2 f_tex_coord;
out vec3 f_color;

void main()
{
	gl_Position= vec4( v_position, 1.0 ) * vu_matrix;

	// Use sky texture transformation similar to what Quake does.
	// It's not linear and strictly-speaking it's not correct to calculate texture coordinates in vertex shader.
	// But do this anyway, since calculation error isn't noticeable if sky geometry is enough tessellated.

	// This code should match code in software sky rasterization!

	f_tex_coord= normalize( vec3( v_position.xy, v_position.z * 3.0 ) ).xy;

	f_color= v_color * vu_light_scale;
}
