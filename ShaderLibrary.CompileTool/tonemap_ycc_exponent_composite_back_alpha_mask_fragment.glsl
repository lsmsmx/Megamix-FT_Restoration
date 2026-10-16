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

layout (binding = 1, std140) uniform _ToneMap
{
    precise vec4 data[4096];
} fp_c4;


layout (binding = 1) uniform sampler2D g_textures_1_;
layout (binding = 0) uniform sampler2D g_textures_0_;
layout (binding = 4) uniform sampler2D g_textures_4_;
layout (binding = 10) uniform sampler2D g_scene_depth_texture;
layout (binding = 6) uniform sampler2D g_textures_6_;
layout (binding = 5) uniform sampler2D g_textures_5_;
layout (binding = 7) uniform sampler2D g_textures_7_;
layout (binding = 2) uniform sampler2D g_textures_2_;
layout (location = 0) in vec4 in_attr0;
layout (location = 1) in vec4 in_attr1;
layout (location = 2) in vec4 in_attr2;
layout (location = 3) in vec4 in_attr3;

layout (location = 0) out vec4 SV_Target0;


void main()
{
    bool keep = true;
    bool temp_0;
    precise float temp_1;
    precise float temp_2;
    precise vec3 temp_3;
    precise vec4 temp_4;
    precise float temp_5;
    precise float temp_6;
    precise float temp_7;
    precise float temp_8;
    precise float temp_9;
    precise float temp_10;
    precise float temp_11;
    precise float temp_12;
    precise float temp_13;
    precise float temp_14;
    bool temp_15;
    bool temp_16;
    precise float temp_17;
    precise float temp_18;
    precise float temp_19;
    precise vec3 temp_20;
    precise vec3 temp_21;
    precise float temp_22;
    precise float temp_23;
    precise float temp_24;
    precise float temp_25;
    precise float temp_26;
    precise float temp_27;
    precise float temp_28;
    precise float temp_29;
    precise float temp_30;
    precise float temp_31;
    precise float temp_32;
    precise vec3 temp_33;
    precise float temp_34;
    precise float temp_35;
    precise float temp_36;
    precise float temp_37;
    bool temp_38;
    precise float temp_39;
    precise float temp_40;
    precise float temp_41;
    precise float temp_42;
    precise float temp_43;
    precise float temp_44;
    precise float temp_45;
    bool temp_46;
    precise float temp_47;
    precise float temp_48;
    precise float temp_49;
    precise float temp_50;
    precise float temp_51;
    precise float temp_52;
    precise float temp_53;
    precise float temp_54;
    precise float temp_55;
    precise float temp_56;
    precise float temp_57;
    precise float temp_58;
    precise float temp_59;
    precise vec3 temp_60;
    precise float temp_61;
    precise float temp_62;
    precise float temp_63;
    precise vec2 temp_64;
    precise float temp_65;
    precise float temp_66;
    precise float temp_67;
    bool temp_68;
    bool temp_69;
    bool temp_70;
    precise float temp_71;
    precise float temp_72;
    precise float temp_73;
    precise float temp_74;
    int temp_75;
    int temp_76;
    int temp_77;
    int temp_78;
    int temp_79;
    int temp_80;
    int temp_81;
    int temp_82;
    int temp_83;
    temp_0 = 0.0 < fp_c4.data[4].w;
    temp_1 = in_attr0.x;
    temp_2 = in_attr0.y;
    temp_3 = texture(g_textures_1_, vec2(in_attr0.z, in_attr0.w)).xyz;
    temp_4 = texture(g_textures_0_, vec2(temp_1, temp_2)).xyzw;
    temp_5 = temp_4.x;
    temp_6 = temp_4.y;
    temp_7 = temp_4.z;
    temp_8 = intBitsToFloat(undef);
    temp_9 = temp_7;
    temp_10 = temp_5;
    temp_11 = temp_6;
    temp_12 = temp_1;
    if (temp_0)
    {
        temp_8 = in_attr1.x;
    }
    temp_13 = intBitsToFloat(undef);
    temp_14 = temp_8;
    if (temp_0)
    {
        temp_13 = in_attr1.y;
    }
    temp_15 = 0.0 < fp_c4.data[6].w;
    temp_16 = in_attr2.z > 0.0;
    temp_17 = temp_7 + temp_3.z;
    temp_18 = temp_13;
    if (!temp_16)
    {
        temp_17 = temp_7;
    }
    temp_19 = temp_17;
    if (temp_0)
    {
        temp_20 = texture(g_textures_4_, vec2(temp_8, temp_13)).xyz;
        temp_14 = temp_20.x;
        temp_9 = temp_20.z;
        temp_18 = temp_20.y;
    }
    temp_21 = texture(g_textures_6_, vec2(temp_1, temp_2)).xyz;
    temp_22 = temp_21.x;
    temp_23 = temp_21.z;
    temp_24 = temp_5 + temp_3.x;
    temp_25 = temp_6 + temp_3.y;
    temp_26 = temp_14;
    temp_27 = temp_9;
    temp_28 = temp_18;
    if (!temp_16)
    {
        temp_24 = temp_5;
    }
    temp_29 = temp_24;
    if (temp_15)
    {
        temp_10 = in_attr1.z;
    }
    temp_30 = temp_10;
    if (!temp_16)
    {
        temp_25 = temp_6;
    }
    temp_31 = temp_25;
    if (temp_15)
    {
        temp_11 = in_attr1.w;
    }
    temp_32 = temp_11;
    if (temp_15)
    {
        temp_33 = texture(g_textures_5_, vec2(temp_10, temp_11)).xyz;
        temp_12 = temp_33.z;
        temp_30 = temp_33.x;
        temp_32 = temp_33.y;
    }
    temp_34 = temp_12;
    temp_35 = temp_32;
    if (temp_0)
    {
        temp_26 = temp_14 * temp_14;
    }
    if (temp_0)
    {
        temp_27 = temp_9 * temp_9;
    }
    if (temp_0)
    {
        temp_28 = temp_18 * temp_18;
    }
    if (temp_0)
    {
        temp_29 = fma(temp_26, fp_c4.data[4].w, temp_24);
    }
    temp_36 = temp_29;
    if (temp_0)
    {
        temp_19 = fma(temp_27, fp_c4.data[4].w, temp_17);
    }
    temp_37 = temp_19;
    if (temp_0)
    {
        temp_31 = fma(temp_28, fp_c4.data[4].w, temp_25);
    }
    temp_38 = texture(g_scene_depth_texture, vec2(temp_1, temp_2)).x > 0.0;
    temp_39 = fma(temp_23, 0.1056, fma(temp_21.y, 0.5664, temp_22 * 0.288000017));
    temp_40 = log2(abs(temp_39)) * fp_c4.data[3].w;
    temp_41 = temp_40;
    temp_42 = temp_31;
    if (temp_15)
    {
        temp_34 = temp_12 * temp_12;
    }
    if (temp_15)
    {
        temp_37 = fma(temp_34, fp_c4.data[6].w, temp_19);
    }
    temp_43 = max(0.0, fma(temp_39, 2.0, -1.0)) * max(0.0, fma(temp_39, 2.0, -1.0)) * max(0.0, fma(temp_39, 2.0, -1.0)) * max(0.0, fma(temp_39, 2.0, -1.0)) * max(0.0, fma(temp_39, 2.0, -1.0)) * max(0.0, fma(temp_39, 2.0, -1.0)) * max(0.0, fma(temp_39, 2.0, -1.0)) * max(0.0, fma(temp_39, 2.0, -1.0));
    temp_44 = fma(temp_39, temp_43 * 0.0 - temp_43, temp_39);
    temp_45 = in_attr2.w;
    temp_46 = temp_44 != 0.0 || isnan(temp_44) || isnan(0.0);
    temp_47 = temp_45;
    temp_48 = temp_37;
    if (temp_46)
    {
        temp_41 = 1.0 / temp_44;
    }
    temp_49 = temp_41;
    if (!temp_46)
    {
        temp_49 = temp_44;
    }
    temp_50 = 0.0 - exp2(temp_40) + 1.0;
    temp_51 = fma(temp_22, 0.96, 0.0 - temp_39) * temp_49;
    temp_52 = log2(temp_50);
    temp_53 = temp_51;
    if (!(0.0 - exp2(temp_40) > -1.0))
    {
        temp_52 = temp_50;
    }
    temp_54 = temp_45 * temp_52;
    if (temp_15)
    {
        temp_47 = temp_30 * temp_30;
    }
    temp_55 = fma(temp_54, temp_51, temp_54);
    if (temp_15)
    {
        temp_53 = temp_32 * temp_32;
    }
    temp_56 = fma(temp_54, fma(temp_23, 0.96, 0.0 - temp_39) * temp_49, temp_54);
    if (temp_38)
    {
        temp_35 = 1.0;
    }
    temp_57 = temp_35;
    if (temp_15)
    {
        temp_36 = fma(temp_47, fp_c4.data[6].w, temp_29);
    }
    temp_58 = temp_36;
    if (!temp_38)
    {
        temp_57 = min(temp_4.w, 1.0);
    }
    if (temp_15)
    {
        temp_42 = fma(temp_53, fp_c4.data[6].w, temp_31);
    }
    temp_59 = temp_42;
    if (in_attr3.z > 0.0)
    {
        temp_60 = texture(g_textures_7_, vec2(in_attr3.x, in_attr3.y)).xyz;
        temp_58 = temp_36 + temp_60.x;
        temp_59 = temp_42 + temp_60.y;
        temp_48 = temp_37 + temp_60.z;
    }
    temp_61 = fma(temp_55, 0.0 - temp_57, temp_55) + temp_58;
    temp_62 = fma(temp_56, 0.0 - temp_57, temp_56) + temp_48;
    temp_63 = fma(temp_62, 0.11, fma(fma(fma(temp_56, -0.18644, fma(temp_54, 1.6949, temp_55 * -0.508469999)), 0.0 - temp_57, fma(temp_56, -0.18644, fma(temp_54, 1.6949, temp_55 * -0.508469999))) + temp_59, 0.59, temp_61 * 0.300000012));
    temp_64 = textureLod(g_textures_2_, vec2(temp_63 * in_attr2.y, 0.0), 0.0).xy;
    temp_65 = temp_64.x;
    temp_66 = temp_61 + 0.0 - temp_63;
    temp_67 = temp_62 + 0.0 - temp_63;
    temp_68 = 0.0 == fp_c4.data[2].w;
    temp_69 = 0.0 < fp_c4.data[1].w;
    temp_70 = fp_c4.data[2].w == 2.0;
    temp_71 = temp_64.y * in_attr2.x;
    temp_72 = clamp(fma(fma(temp_71, temp_66, temp_65), fp_c4.data[2].x, fp_c4.data[3].x), 0.0, 1.0);
    temp_73 = clamp(fma(fma(temp_71, temp_67, temp_65), fp_c4.data[2].z, fp_c4.data[3].z), 0.0, 1.0);
    temp_74 = clamp(fma(fma(temp_71 * temp_67, -0.186441, fma(temp_71 * temp_66, -0.508475, temp_65)), fp_c4.data[2].y, fp_c4.data[3].y), 0.0, 1.0);
    temp_75 = floatBitsToInt(temp_72 * fp_c4.data[1].x);
    if (temp_70)
    {
        temp_75 = floatBitsToInt(temp_72 + fp_c4.data[1].x);
    }
    temp_76 = floatBitsToInt(temp_73 * fp_c4.data[1].z);
    temp_77 = temp_75;
    temp_78 = floatBitsToInt(temp_74 * fp_c4.data[1].y);
    if (temp_70)
    {
        temp_76 = floatBitsToInt(temp_73 + fp_c4.data[1].z);
    }
    temp_79 = temp_76;
    if (temp_68)
    {
        temp_77 = floatBitsToInt(fma(0.0 - temp_72 + fp_c4.data[1].x, fp_c4.data[1].w, temp_72));
    }
    temp_80 = temp_77;
    if (temp_70)
    {
        temp_78 = floatBitsToInt(temp_74 + fp_c4.data[1].y);
    }
    temp_81 = temp_78;
    if (temp_68)
    {
        temp_79 = floatBitsToInt(fma(0.0 - temp_73 + fp_c4.data[1].z, fp_c4.data[1].w, temp_73));
    }
    temp_82 = temp_79;
    if (!temp_69)
    {
        temp_80 = floatBitsToInt(temp_72);
    }
    if (!temp_69)
    {
        temp_82 = floatBitsToInt(temp_73);
    }
    if (temp_68)
    {
        temp_81 = floatBitsToInt(fma(0.0 - temp_74 + fp_c4.data[1].y, fp_c4.data[1].w, temp_74));
    }
    temp_83 = temp_81;
    if (!temp_69)
    {
        temp_83 = floatBitsToInt(temp_74);
    }
    // [MODDED] PS4 Rec.709 Contrast + Fake BT.2020 + Debanding
    vec3 col_out = vec3(intBitsToFloat(temp_80), intBitsToFloat(temp_83), intBitsToFloat(temp_82));
    
    // 1. PS4 HDTV Rec.709 Curve
    vec3 r709 = mix(col_out * 0.2222, pow(max((col_out + vec3(0.099)) * 0.9099, vec3(0.0)), vec3(2.222)), step(vec3(0.081), col_out));
    col_out = mix(col_out, r709, 0.35);
    
    // 2. Fake BT.2020 Gamut Expansion
    float luma_out = dot(col_out, vec3(0.2126, 0.7152, 0.0722));
    vec3 chroma_out = col_out - luma_out;
    float boost_out = 0.15 * pow(max(1.0 - luma_out, 0.0001), 1.5);
    col_out = luma_out + chroma_out * (1.0 + boost_out);
    
    // 3. Debanding Dithering
    float dither_out = fract(sin(dot(gl_FragCoord.xy, vec2(12.9898, 78.233))) * 43758.5453) - 0.5;
    col_out += dither_out * (1.0 / 255.0);
    
    SV_Target0.xyz = clamp(col_out, 0.0, 1.0);
    SV_Target0.w = temp_57;
    // return; Yuzu crash;
}
