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


layout (binding = 0) uniform sampler2D g_texture;
layout (location = 0) in vec4 in_attr0;
layout (location = 1) in vec4 in_attr1;
layout (location = 2) in vec4 in_attr2;

layout (location = 0) out vec4 SV_Target0;


void main()
{
    bool keep = true;
    precise vec3 temp_0;
    precise vec3 temp_1;
    precise float temp_2;
    precise float temp_3;
    precise float temp_4;
    precise vec3 temp_5;
    temp_0 = texture(g_texture, vec2(in_attr1.x, in_attr1.y)).xyz;
    temp_1 = texture(g_texture, vec2(in_attr0.x, in_attr0.y)).xyz;
    temp_2 = temp_1.x;
    temp_3 = temp_1.y;
    temp_4 = temp_1.z;
    temp_5 = texture(g_texture, vec2(in_attr2.x, in_attr2.y)).xyz;
    SV_Target0.x = intBitsToFloat(max(abs(temp_0.x + 0.0 - temp_2), max(abs(temp_0.y + 0.0 - temp_3), abs(temp_0.z + 0.0 - temp_4))) > 0.055 ? 0x3F800000 : 0); // improvement
    SV_Target0.y = intBitsToFloat(max(abs(0.0 - temp_2 + temp_5.x), max(abs(0.0 - temp_3 + temp_5.y), abs(0.0 - temp_4 + temp_5.z))) > 0.055 ? 0x3F800000 : 0); // improvement
    SV_Target0.z = 0.0;
    SV_Target0.w = 0.0;
    // return; Yuzu crash
}
