attribute vec3 in_Position;
attribute vec2 in_TextureCoord;
uniform vec2 uScale;
varying vec2 coord;
varying vec2 offset0;
varying vec2 offset1;
varying vec2 offset2;
varying vec2 offset3;

void main()
{
    coord = in_TextureCoord;
    offset0 = uScale * vec2(1.0);
    offset1 = uScale * vec2(2.0);
    offset2 = uScale * vec2(3.0);
    offset3 = uScale * vec2(4.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(in_Position, 1.0);
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~uniform float uIntensity;
varying vec2 coord;
varying vec2 offset0;
varying vec2 offset1;
varying vec2 offset2;
varying vec2 offset3;

void main()
{
    // sample texel from base texture.
    vec4 col = texture2D(gm_BaseTexture, coord) * vec4(0.227027027);
    
    col += texture2D(gm_BaseTexture, coord + offset0) * vec4(0.1945945946);
    col += texture2D(gm_BaseTexture, coord + offset1) * vec4(0.1216216216);
    col += texture2D(gm_BaseTexture, coord + offset2) * vec4(0.0540540541);
    col += texture2D(gm_BaseTexture, coord + offset3) * vec4(0.0162162162);
    
    col += texture2D(gm_BaseTexture, coord - offset0) * vec4(0.1945945946);
    col += texture2D(gm_BaseTexture, coord - offset1) * vec4(0.1216216216);
    col += texture2D(gm_BaseTexture, coord - offset2) * vec4(0.0540540541);
    col += texture2D(gm_BaseTexture, coord - offset3) * vec4(0.0162162162);
    
    gl_FragColor = col * vec4(uIntensity);
}

