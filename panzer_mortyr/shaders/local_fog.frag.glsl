#version 330

// Use the same uniforms as in the corresponding vertex shader.
uniform vec3 vu_fog_volume_scale;
uniform vec3 vu_fog_volume_offset;

uniform vec2 fu_inverse_viewport_size;
uniform sampler2D fu_depth_texture;
uniform mat4 fu_inverse_projection_matrix;

uniform vec3 fu_camera_position;
uniform vec3 fu_fog_color;

in vec3 f_position;

out vec4 color;

const float inf= 99999999.0;

// Returns near/far distance (in units of given direction vector).
// near <= far is has intersection.
vec2 CalculateRayIntersectionWithUnitBBox( vec3 ray_start, vec3 ray_direction )
{
	float near_distance= -inf;
	float far_distance =  inf;

	const vec3 bbox_min= vec3( -1.0, -1.0, -1.0 );
	const vec3 bbox_max= vec3(  1.0,  1.0,  1.0 );

	if( ray_direction.x > 0.0 )
	{
		float near_distance_x= ( bbox_min.x - ray_start.x ) / ray_direction.x;
		if( near_distance_x > near_distance )
		{
			near_distance= near_distance_x;
		}

		float far_distance_x= ( bbox_max.x - ray_start.x ) / ray_direction.x;
		if( far_distance_x < far_distance )
		{
			far_distance= far_distance_x;
		}
	}
	else if( ray_direction.x < 0.0 )
	{
		float near_distance_x= ( bbox_max.x - ray_start.x ) / ray_direction.x;
		if( near_distance_x > near_distance )
		{
			near_distance= near_distance_x;
		}

		float far_distance_x= ( bbox_min.x - ray_start.x ) / ray_direction.x;
		if( far_distance_x < far_distance )
		{
			far_distance= far_distance_x;
		}
	}
	else
	{
		if( ray_start.x <= bbox_min.x || ray_start.x >= bbox_max.x )
		{
			return vec2( inf, -inf );
		}
	}

	if( ray_direction.y > 0.0 )
	{
		float near_distance_y= ( bbox_min.y - ray_start.y ) / ray_direction.y;
		if( near_distance_y > near_distance )
		{
			near_distance= near_distance_y;
		}

		float far_distance_y= ( bbox_max.y - ray_start.y ) / ray_direction.y;
		if( far_distance_y < far_distance )
		{
			far_distance= far_distance_y;
		}
	}
	else if( ray_direction.y < 0.0 )
	{
		float near_distance_y= ( bbox_max.y - ray_start.y ) / ray_direction.y;
		if( near_distance_y > near_distance )
		{
			near_distance= near_distance_y;
		}

		float far_distance_y= ( bbox_min.y - ray_start.y ) / ray_direction.y;
		if( far_distance_y < far_distance )
		{
			far_distance= far_distance_y;
		}
	}
	else
	{
		if( ray_start.y <= bbox_min.y || ray_start.y >= bbox_max.y )
		{
			return vec2( inf, -inf );
		}
	}

	if( ray_direction.z > 0.0 )
	{
		float near_distance_z= ( bbox_min.z - ray_start.z ) / ray_direction.z;
		if( near_distance_z > near_distance )
		{
			near_distance= near_distance_z;
		}

		float far_distance_z= ( bbox_max.z - ray_start.z ) / ray_direction.z;
		if( far_distance_z < far_distance )
		{
			far_distance= far_distance_z;
		}
	}
	else if( ray_direction.z < 0.0 )
	{
		float near_distance_z= ( bbox_max.z - ray_start.z ) / ray_direction.z;
		if( near_distance_z > near_distance )
		{
			near_distance= near_distance_z;
		}

		float far_distance_z= ( bbox_min.z - ray_start.z ) / ray_direction.z;
		if( far_distance_z < far_distance )
		{
			far_distance= far_distance_z;
		}
	}
	else
	{
		if( ray_start.z <= bbox_min.z || ray_start.z >= bbox_max.z )
		{
			return vec2( inf, -inf );
		}
	}

	return vec2( near_distance, far_distance );
}

// Returns near/far distance.
vec2 CalculateRayUnitSphereIntersection( vec3 ray_start, vec3 ray_normalized_direction )
{
	vec3 vec_to_center= -ray_start;
	float perpendicular_distance= length( cross( ray_normalized_direction, vec_to_center ) );

	float side_step= sqrt( max( 0.0, 1.0 - perpendicular_distance * perpendicular_distance ) );

	float dinstance_to_closest_point= dot( vec_to_center, ray_normalized_direction );
	return vec2( dinstance_to_closest_point - side_step, dinstance_to_closest_point + side_step );
}

void main()
{
	// Warning!
	// This code should be kept synchronized with code calculating local fog for semitransparent geometry!
	//

	// Calculate linear distance to the fragment stored in the depth buffer.

	vec2 screen_coords= gl_FragCoord.xy * fu_inverse_viewport_size;

	float depth_buffer_value= texture( fu_depth_texture, screen_coords ).r;
	float depth_value_symmetric= depth_buffer_value * 2.0 - 1.0; // in -1 to 1 range
	vec4 clip_space_position= vec4( ( screen_coords * 2.0 - vec2( 1.0, 1.0 ) ), depth_value_symmetric, 1.0 );
	vec4 view_space_position= clip_space_position * fu_inverse_projection_matrix;

	float linear_fragment_distance= length( view_space_position.xyz ) / view_space_position.w;

	vec3 view_ray_normalized= normalize( f_position - fu_camera_position );

	// Perform calculations in space of the box, so that it's assumed that we search for intersection with a cube or sphere with min/max dimensions equal to [-1;1].
	// It seems like the original game does the same.
	// Doing so allows reducing fog density while tracing along the longest axis of a box and preserving density when tracing along the shortest axis.

	vec3 box_space_ray= view_ray_normalized / vu_fog_volume_scale;
	vec3 box_space_ray_normalized= normalize( box_space_ray );
	vec3 box_space_camera_position= ( fu_camera_position - vu_fog_volume_offset ) / vu_fog_volume_scale;
	float box_space_fragment_distance= linear_fragment_distance * length( box_space_ray );

	vec2 intersection_near_far_distances;
	float fog_density_scale;

	// HACK! In the original game all fog volumes are ellipsoids.
	// But we use cubes for flat volumes, used on some maps. Ellipsoids for them look ugly.
	if( vu_fog_volume_scale.z * 2.0 < min( vu_fog_volume_scale.x, vu_fog_volume_scale.y ) )
	{
		// Find near/far distance of ray with box intersection.
		// The difference between these two values is distance travelled within this fog volume.
		intersection_near_far_distances=
			CalculateRayIntersectionWithUnitBBox( box_space_camera_position, box_space_ray_normalized );

		// For box-shaped fog use constant density scale.
		fog_density_scale= 0.5;
	}
	else
	{
		intersection_near_far_distances=
			CalculateRayUnitSphereIntersection( box_space_camera_position, box_space_ray_normalized );

		// For elliptical fog make density depending on distance travelled within fog boundaries.
		// Otherwise fog edges look too sharp.
		fog_density_scale= 0.3 * ( intersection_near_far_distances.y - intersection_near_far_distances.x );
	}

	float near_distance= max( intersection_near_far_distances.x, 0.0 );
	// Limit far distance to fragment depth.
	float far_distance= max( min( intersection_near_far_distances.y, box_space_fragment_distance ), near_distance );
	float distance_in_fog_volume= far_distance - near_distance;

	// Use linear density function (appropriate for emissive fog) and additive blending.
	// It seems that the original game uses the same approach.
	float fog_density= distance_in_fog_volume * fog_density_scale;

	color= vec4( fu_fog_color * fog_density, 0.0 );
}
