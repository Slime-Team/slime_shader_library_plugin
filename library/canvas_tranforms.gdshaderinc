
vec2 transform_vec2(mat4 tranform_matrix, vec2 map)
{
	return (tranform_matrix * vec4(map.x, map.y, 0.0,1.0)).xy;
}

vec2 inverse_transform_vec2(mat4 tranform_matrix, vec2 map)
{
	mat4 _inverse_matrix = inverse(tranform_matrix);
	return (_inverse_matrix * vec4(map.x, map.y, 0.0,1.0)).xy;
}

vec2 scale_from_center(vec2 uv_map, vec2 offset, vec2 scale){
	mat2 scale_factor  = mat2(vec2(scale.x, 0.0), vec2(0.0, scale.y));
	uv_map -= offset;
	uv_map = scale * uv_map;
	uv_map += offset;
	return uv_map;
}

vec2 uv_to_polar_coordinates(vec2 uv, vec2 center, float radialScale, float lengthScale) {
	vec2 m_delta = uv - center;
	float m_radius = length(m_delta) * 2.0 * radialScale;
	float m_Pi = 6.28318530718;
	float m_angle = atan(m_delta.y, m_delta.x) / (m_Pi * lengthScale);
	return vec2(m_radius, m_angle);
}
