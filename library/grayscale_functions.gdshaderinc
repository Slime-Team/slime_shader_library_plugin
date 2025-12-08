
vec2 get_position_offsets(float _position, float _contrast){
	float left = clamp(_position - _contrast * 0.5, 0.0, 1.0);
	float right = clamp(_position + _contrast * 0.5, 0.0, 1.0);
	return vec2(left, right);
}


//get a liner gradient graycale and scan values
float grayscale_scan(float _in, float position, float contrast){
	vec2 offsets = get_position_offsets(position, contrast);
	_in = smoothstep(offsets.x, offsets.y, _in);
	return 	_in;
}

float grayscale_select(float _in){
	float _out = _in;
	return 	_out;
}

float grayscale_range(float _in){
	float _out = _in;
	return 	_out;
}

float grayscale_remap_range(float input_value,
				float input_min,
				float input_max,
				float output_min,
				float output_max){
	 return ((input_value - input_min) / (input_max - input_min) * (output_max - output_min) + output_min);
}