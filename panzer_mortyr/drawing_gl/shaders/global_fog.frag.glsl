#version 330

uniform sampler2D fu_depth_texture;
uniform mat4 fu_inverse_projection_matrix;
uniform float fu_fog_distance_scale;
uniform vec3 fu_fog_color;

out vec4 color;

void main()
{
	float depth_buffer_value= texelFetch( fu_depth_texture, ivec2( gl_FragCoord.xy ), 0 ).r;
	vec4 view_space_position= vec4( gl_FragCoord.xy, depth_buffer_value, 1.0 ) * fu_inverse_projection_matrix;

	// Assume that the camera is located at origin.
	float linear_distance= length( view_space_position.xyz ) / view_space_position.w;

	// Use exponential fog formula.
	// This code should match code calculating fog for semitransparent geometry and for rain/snow!
	float fog_density= 1.0 - exp( linear_distance * fu_fog_distance_scale );

	color= vec4( fu_fog_color, fog_density );
}
