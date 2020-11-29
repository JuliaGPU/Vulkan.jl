#version 450
#extension GL_ARB_separate_shader_objects : enable

layout(binding = 0) uniform MVP {
    mat4 model;
    mat4 view;
    mat4 proj;
} mvp;

layout(location = 0) in vec2 in_position;
layout(location = 1) in vec4 in_color;

layout(location = 0) out vec4 frag_color;

void main() {
    // gl_Position = mvp.proj * mvp.view * mvp.model * vec4(in_position, 0.0, 1.0);
    gl_Position = vec4(in_position, 0.0, 1.0);
    frag_color = in_color;
}
