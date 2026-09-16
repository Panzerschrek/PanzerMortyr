#version 330

uniform sampler2D fu_texture;

out vec4 color;

const float FXAA_REDUCE_MIN = 1.0 / 128.0;
const float FXAA_REDUCE_MUL = 1.0 / 8.0;
const float FXAA_SPAN_MAX = 8.0;

void main()
{
	ivec2 tex_coord_i= ivec2( gl_FragCoord.xy );

	vec2 texture_size= textureSize( fu_texture, 0 );

	vec2 tex_coord= ( vec2( tex_coord_i ) + vec2( 0.5, 0.5 ) ) / texture_size;
	vec2 texel_step= vec2( 1.0, 1.0 ) / texture_size;

	vec4 c[5];
	c[0]= texelFetch( fu_texture, tex_coord_i, 0 );
	c[1]= texelFetch( fu_texture, tex_coord_i + ivec2( -1, +1 ), 0 );
	c[2]= texelFetch( fu_texture, tex_coord_i + ivec2( +1, +1 ), 0 );
	c[3]= texelFetch( fu_texture, tex_coord_i + ivec2( -1, -1 ), 0 );
	c[4]= texelFetch( fu_texture, tex_coord_i + ivec2( +1, -1 ), 0 );

	const vec3 luma= vec3( 0.299, 0.587, 0.114 );
	float l[5];
	l[0]= dot( c[0].rgb, luma );
	l[1]= dot( c[1].rgb, luma );
	l[2]= dot( c[2].rgb, luma );
	l[3]= dot( c[3].rgb, luma );
	l[4]= dot( c[4].rgb, luma );

	float l_min= min( l[0], min( min(l[1], l[2]), min(l[3], l[4]) ) );
	float l_max= max( l[0], max( max(l[1], l[2]), max(l[3], l[4]) ) );

	vec2 dir= vec2(
		-( (l[1] + l[2]) - (l[3] + l[4]) ),
		+( (l[1] + l[3]) - (l[2] + l[4]) ) );

	float dir_reduce= max( ( l[1] + l[2] + l[3] + l[4] ) * ( 0.25 * FXAA_REDUCE_MUL ), FXAA_REDUCE_MIN );

	float inv_dir_reduce= 1.0 / ( min( abs( dir.x ), abs( dir.y ) ) + dir_reduce );
	dir=
		min(
			vec2( +FXAA_SPAN_MAX, +FXAA_SPAN_MAX ),
			max( vec2( -FXAA_SPAN_MAX, -FXAA_SPAN_MAX ), dir * inv_dir_reduce ) ) * texel_step;

	vec4 rgb_a= 0.5 * (
		texture( fu_texture, tex_coord + dir * ( -1.0 / 6.0 ) ) +
		texture( fu_texture, tex_coord + dir * ( +1.0 / 6.0 ) ) );
	vec4 rgb_b= rgb_a * 0.5 + 0.25 * (
		texture( fu_texture, tex_coord + dir * -0.5 ) +
		texture( fu_texture, tex_coord + dir * +0.5 ) );

	float l_b= dot( rgb_b.rgb, luma );

	if( l_b < l_min || l_max > l_b )
		color= rgb_a;
	else
		color= rgb_b;
}
