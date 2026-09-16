#version 330

// Modyfied by "Panzerschrek"
/**
Basic FXAA implementation based on the code on geeks3d.com with the
modification that the texture2DLod stuff was removed since it's
unsupported by WebGL.
--
From:
https://github.com/mitsuhiko/webgl-meincraft
Copyright (c) 2011 by Armin Ronacher.
Some rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * The names of the contributors may not be used to endorse or
      promote products derived from this software without specific
      prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

uniform sampler2D fu_texture;

out vec4 color;
#define FXAA_REDUCE_MIN   (1.0/ 128.0)
#define FXAA_REDUCE_MUL   (1.0 / 8.0)
#define FXAA_SPAN_MAX      8.0

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
