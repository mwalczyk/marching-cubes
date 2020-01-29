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
	vec3 normal;
} vs_out;

void main() 
{
	vec4 world_space = u_model * i_position;

    gl_Position = u_projection * u_view * world_space;

    vs_out.position = world_space.xyz;
    vs_out.normal = normalize(i_normal.xyz);
}