float2 vec2(float x0, float x1)
{
    return float2(x0, x1);
}
float4 vec4(float3 x0, float x1)
{
    return float4(x0, x1);
}
// Varyings
static float2 _v_texcoord = {0, 0};

static float4 gl_Color[1] =
{
    float4(0, 0, 0, 0)
};


uniform float _gm_AlphaRefValue : register(c3);
uniform bool _gm_AlphaTestEnabled : register(c4);
uniform sampler2D _gm_BaseTexture : register(s0);
uniform float4 _gm_FogColour : register(c5);
uniform bool _gm_PS_FogEnabled : register(c6);
uniform float _time : register(c7);

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
static float2 _resolution = float2(1.0, 1.0);
float _rand(in float2 _co)
{
{
return frac((sin(dot(_co.xy, float2(12.9898, 78.233002))) * 43758.547));
;
}
}
;
void gl_main()
{
{
float2 _q1 = (_v_texcoord.xy / _resolution.xy);
float2 _uv = (0.5 + ((_q1 - 0.5) * 0.986));
float3 _oricol = gl_texture2D(_gm_BaseTexture, vec2(_q1.x, (1.0 - _q1.y))).xyz;
float3 _col = {0, 0, 0};
(_col.x = gl_texture2D(_gm_BaseTexture, vec2((_uv.x + 0.003), _uv.y)).x);
(_col.y = gl_texture2D(_gm_BaseTexture, vec2((_uv.x + 0.0), _uv.y)).y);
(_col.z = gl_texture2D(_gm_BaseTexture, vec2((_uv.x - 0.003), _uv.y)).z);
(_col = clamp(((_col * 0.5) + (((0.5 * _col) * _col) * 1.2)), 0.0, 1.0));
(_col *= (0.60000002 + ((((6.4000001 * _uv.x) * _uv.y) * (1.0 - _uv.x)) * (1.0 - _uv.y))));
(_col *= float3(0.89999998, 1.0, 0.69999999));
(_col *= (0.80000001 + (0.2 * sin(((10.0 * _time) + (_uv.y * 512.0))))));
(_col *= (1.0 - (0.07 * _rand(vec2(_time, tan(_time))))));
float _comp = smoothstep(0.2, 0.69999999, sin(_time));
(gl_Color[0] = vec4(_col, 1.0));
}
}
;
struct PS_INPUT
{
    float2 v0 : TEXCOORD0;
};

struct PS_OUTPUT
{
    float4 gl_Color0 : COLOR0;
};

PS_OUTPUT main(PS_INPUT input)
{
    _v_texcoord = input.v0.xy;

    gl_main();

    PS_OUTPUT output;
    output.gl_Color0 = gl_Color[0];

    return output;
}
