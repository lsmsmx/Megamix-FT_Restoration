#version 450 core
#extension GL_ARB_gpu_shader_int64 : enable
#extension GL_ARB_shader_ballot : enable
#extension GL_ARB_shader_group_vote : enable
#extension GL_EXT_shader_image_load_formatted : enable
#extension GL_EXT_texture_shadow_lod : enable
#extension GL_ARB_fragment_shader_interlock : enable
#extension GL_NV_viewport_array2 : enable
#pragma optionNV(fastmath off)

const int undef = 0;

layout (binding = 0, std140) uniform _support_buffer
{
    uint alpha_test;
    uint is_bgra[8];
    precise vec4 viewport_inverse;
    precise vec4 viewport_size;
    int frag_scale_count;
    precise float render_scale[73];
    ivec4 tfe_offset;
    int tfe_vertex_count;
} support_buffer;

layout (binding = 0, std140) uniform _Quad
{
    precise vec4 data[4096];
} fp_c3;


layout (binding = 0) uniform sampler2D g_texture;
layout (location = 0) in vec4 in_attr0;
layout (location = 1) in vec4 in_attr1;

layout (location = 0) out vec4 SV_Target0;


void main()
{
    bool keep = true;
    precise vec3 temp_0;
    precise float temp_1;
    precise float temp_2;
    precise float temp_3;
    precise vec3 temp_4;
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise vec3 temp_8;
    precise float temp_9;
    precise float temp_10;
    precise float temp_11;
    precise vec3 temp_12;
    precise float temp_13;
    precise float temp_14;
    precise float temp_15;
    temp_0 = texture(g_texture, vec2(in_attr0.z, in_attr0.w)).xyz;
    temp_1 = temp_0.x;
    temp_2 = temp_0.y;
    temp_3 = temp_0.z;
    temp_4 = texture(g_texture, vec2(in_attr0.x, in_attr0.y)).xyz;
    temp_5 = temp_4.x;
    temp_6 = temp_4.y;
    temp_7 = temp_4.z;
    temp_8 = texture(g_texture, vec2(in_attr1.x, in_attr1.y)).xyz;
    temp_9 = temp_8.x;
    temp_10 = temp_8.y;
    temp_11 = temp_8.z;
    temp_12 = texture(g_texture, vec2(in_attr1.z, in_attr1.w)).xyz;
    temp_13 = temp_12.x;
    temp_14 = temp_12.y;
    temp_15 = temp_12.z;
    // [MODDED] Bloom Luminance Threshold
    vec3 c_max = vec3(max(temp_13, max(temp_9, max(temp_1, temp_5))), max(temp_14, max(temp_10, max(temp_2, temp_6))), max(temp_15, max(temp_11, max(temp_3, temp_7))));
    float luma = dot(c_max, vec3(0.299, 0.587, 0.114));
    float thresh = dot(fp_c3.data[2].xyz, vec3(0.299, 0.587, 0.114));
    float factor = clamp((luma - thresh) / max(luma, 0.0001), 0.0, 1.0);
    SV_Target0.xyz = c_max * factor;
    SV_Target0.w = fma(temp_3 + temp_7 + temp_11 + temp_15, 0.05, fma(temp_2 + temp_6 + temp_10 + temp_14, 0.1125, (temp_1 + temp_5 + temp_9 + temp_13) * 0.0874999985));
    // return; Yuzu crash
}
