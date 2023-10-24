﻿Shader "MagmaMc/Decal"
{
    Properties
    {
        [MainTexture]MainTex ("Texture", 2D) = "white" {}
    }

    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue"="Geometry+1" "ForceNoShadowCasting"="True" }
        LOD 200
        Offset -1, -1

        CGPROGRAM

        #pragma surface surf Lambert decal:blend

        struct Input
        {
            float2 uv_MainTex;
        };

        sampler2D MainTex;

        void surf (Input IN, inout SurfaceOutput o)
        {
            half4 c = tex2D (MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }

        ENDCG
    }
    CustomEditor "EasyShaderUI"

}
