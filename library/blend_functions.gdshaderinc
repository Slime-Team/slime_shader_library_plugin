
float random_value(vec2 uv) {
    return fract(sin(dot(uv.xy,
        vec2(12.9898,78.233))) * 43758.5453123);
}

// Multiply   a * b
vec4 multiply(vec4 base, vec4 blend){
	return base * blend;
}

// Screen      1 - (1 - a) * (1 - b)
vec4 screen(vec4 base, vec4 blend, float factor){
	return mix(base, 1.0 - (1.0 - base) * (1.0 - blend), factor);
}

// Darken     min(a, b)
vec4 darken(vec4 base, vec4 blend){
	return min(base, blend);
}

// Lighten    max(a, b)
vec4 lighten(vec4 base, vec4 blend){
	return max(base, blend);
}

// Difference   abs(a - b)
vec4 difference(vec4 base, vec4 blend){
	return abs(base - blend);
}

// Exclusion    a + b - 2 * a * b
vec4 exclusion(vec4 base, vec4 blend){
	return base + blend - 2.0 * base * blend;
}

// Overaly
vec4 overlay(vec4 base, vec4 blend){
	vec4 limit = step(0.5, base);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}

// Hard Light
vec4 hard_light(vec4 base, vec4 blend){
	vec4 limit = step(0.5, blend);
	return mix(2.0 * base * blend, 1.0 - 2.0 * (1.0 - base) * (1.0 - blend), limit);
}

// Soft light
vec4 soft_light(vec4 base, vec4 blend){
	vec4 limit = step(0.5, blend);
	return mix(2.0 * base * blend + base * base * (1.0 - 2.0 * blend), sqrt(base) * (2.0 * blend - 1.0) + (2.0 * base) * (1.0 - blend), limit);
}

//Color dodge
vec4 color_dodge(vec4 base, vec4 blend){
	return base / (1.0 - blend);
}


vec4 linear_dodge(vec4 base, vec4 blend){
	return base + blend;
}

vec4 color_burn(vec4 base, vec4 blend){
	return 1.0 - (1.0 - base) / blend;
}

vec4 linear_burn (vec4 base, vec4 blend)
{
	return base + blend - 1.0;
}
