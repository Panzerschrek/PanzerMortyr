#version 330

// Use the same uniforms as in the corresponding vertex shader.
uniform vec3 vu_fog_volume_scale;
uniform vec3 vu_fog_volume_offset;

uniform vec3 fu_camera_position;
uniform vec3 fu_fog_color;

in vec3 f_position;

out vec4 color;

// Return near/far distance (in units of given direction vector).
// near <= far is has intersection.
vec2 CalculateRayBBoxIntersection( vec3 bbox_min, vec3 bbox_max, vec3 ray_start, vec3 ray_direction )
{
	const float inf= 99999999.0;

	float near_distance= -inf;
	float far_distance =  inf;

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

void main()
{
	vec3 view_ray_normalized= normalize( f_position - fu_camera_position );

	vec3 bbox_min= vu_fog_volume_offset - vu_fog_volume_scale;
	vec3 bbox_max= vu_fog_volume_offset + vu_fog_volume_scale;

	// Find near/far distance of ray with box intersection.
	// The difference between these two values is distance travveled within this fog volume.

	vec2 ray_bbox_intersection=
		CalculateRayBBoxIntersection( bbox_min, bbox_max, fu_camera_position, view_ray_normalized );

	float near_distance= max( ray_bbox_intersection.x, 0.0 );
	float far_distance= max( ray_bbox_intersection.y, near_distance );
	float distance_in_fog_volume= far_distance - near_distance;

	float distance_scale= 1.0 / 256.0;
	float fog_density= 1.0 - exp( -distance_in_fog_volume * distance_scale );

	color= vec4( fu_fog_color, fog_density );
}
