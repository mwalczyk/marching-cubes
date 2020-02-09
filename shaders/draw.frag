#version 460

layout(location = 0) out vec4 o_color;

in VS_OUT
{
	vec3 position;
	flat vec3 normal;
} fs_in;

void main() 
{	
	// Some very basic diffuse lighting...
	const vec3 light_position = vec3(1.0, 5.0, 0.0);
	const vec3 to_light = normalize(light_position - fs_in.position);
	float intensity = max(0.5, dot(to_light, fs_in.normal));

	const vec3 ambient = vec3(0.15);

	// Quantize position
	const int steps = 10;
	vec3 position = fs_in.position * 0.5 + 0.5;
	vec3 quantized = floor(position * steps + 0.5) / steps;

	vec3 color = quantized;
	color *= intensity;
	color += ambient;

	o_color = vec4(color, 1.0);
}