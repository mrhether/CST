float4 vec4(float x0)
{
    return float4(x0, x0, x0, x0);
}
// Varyings
static float2 _coord = {0, 0};
static float2 _offset0 = {0, 0};
static float2 _offset1 = {0, 0};
static float2 _offset2 = {0, 0};
static float2 _offset3 = {0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};


uniform float _gm_AlphaRefValue : register(c3);
uniform bool _gm_AlphaTestEnabled : register(c4);
uniform sampler2D _gm_BaseTexture : register(s0);
uniform float4 _gm_FogColour : register(c5);
uniform bool _gm_PS_FogEnabled : register(c6);
uniform float _uIntensity : register(c7);

float4 gl_texture2D(sampler2D s, float2 t)
{
    return tex2D(s, t);
}

#define GL_USES_FRAG_COLOR
;
;
;
;
;
void _DoAlphaTest(in float4 _SrcColour)
{
{
if(_gm_AlphaTestEnabled)
{
{
if((_SrcColour.w <= _gm_AlphaRefValue))
{
{
discard;
;
}
;
}
;
}
;
}
;
}
}
;
void _DoFog(inout float4 _SrcColour, in float _fogval)
{
{
if(_gm_PS_FogEnabled)
{
{
(_SrcColour = lerp(_SrcColour, _gm_FogColour, clamp(_fogval, 0.0, 1.0)));
}
;
}
;
}
}
;
;
;
;
;
;
;
void gl_main()
{
{
float4 _col = (gl_texture2D(_gm_BaseTexture, _coord) * float4(0.22702703, 0.22702703, 0.22702703, 0.22702703));
(_col += (gl_texture2D(_gm_BaseTexture, (_coord + _offset0)) * float4(0.19459459, 0.19459459, 0.19459459, 0.19459459)));
(_col += (gl_texture2D(_gm_BaseTexture, (_coord + _offset1)) * float4(0.12162162, 0.12162162, 0.12162162, 0.12162162)));
(_col += (gl_texture2D(_gm_BaseTexture, (_coord + _offset2)) * float4(0.054054055, 0.054054055, 0.054054055, 0.054054055)));
(_col += (gl_texture2D(_gm_BaseTexture, (_coord + _offset3)) * float4(0.016216217, 0.016216217, 0.016216217, 0.016216217)));
(_col += (gl_texture2D(_gm_BaseTexture, (_coord - _offset0)) * float4(0.19459459, 0.19459459, 0.19459459, 0.19459459)));
(_col += (gl_texture2D(_gm_BaseTexture, (_coord - _offset1)) * float4(0.12162162, 0.12162162, 0.12162162, 0.12162162)));
(_col += (gl_texture2D(_gm_BaseTexture, (_coord - _offset2)) * float4(0.054054055, 0.054054055, 0.054054055, 0.054054055)));
(_col += (gl_texture2D(_gm_BaseTexture, (_coord - _offset3)) * float4(0.016216217, 0.016216217, 0.016216217, 0.016216217)));
(gl_Color[0] = (_col * vec4(_uIntensity)));
}
}
;
struct PS_INPUT
{
    float2 v0 : TEXCOORD0;
    float2 v1 : TEXCOORD1;
    float2 v2 : TEXCOORD2;
    float2 v3 : TEXCOORD3;
    float2 v4 : TEXCOORD4;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT input)
{
    _coord = input.v0.xy;
    _offset0 = input.v1.xy;
    _offset1 = input.v2.xy;
    _offset2 = input.v3.xy;
    _offset3 = input.v4.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];

    return output;
}
