#version 460

uniform float u_time;

uniform mat4 u_projection;
uniform mat4 u_view;
uniform mat4 u_model;

layout(location = 0) in vec4 i_position;
layout(location = 1) in vec4 i_normal;

out VS_OUT
{
	vec3 position;
	flat vec3 normal; // Draw with flat shading
} vs_out;

void main() 
{
    gl_Position = u_projection * u_view * u_model * i_position;

    vs_out.position = i_position.xyz;
    vs_out.normal = normalize(i_normal.xyz);
}