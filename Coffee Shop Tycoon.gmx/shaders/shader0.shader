attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_texcoord;
varying vec4 v_color;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_color = in_Colour;
    v_texcoord = in_TextureCoord;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~varying vec2 v_texcoord;
varying vec4 v_color;
uniform float time;

vec2 resolution = vec2(1.0,1.0);


float rand(vec2 co) {
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}


void main()
{
    vec2 q1 = v_texcoord.xy / resolution.xy;
    vec2 uv = 0.5 + (q1-0.5)*(0.98 + 0.006);//*sin(0.9));
    vec3 oricol = texture2D(gm_BaseTexture,vec2(q1.x,1.0-q1.y)).xyz;
    vec3 col;
    
    col.r = texture2D(gm_BaseTexture,vec2(uv.x+0.003,uv.y)).x;
    col.g = texture2D(gm_BaseTexture,vec2(uv.x+0.000,uv.y)).y;
    col.b = texture2D(gm_BaseTexture,vec2(uv.x-0.003,uv.y)).z;
    
    col = clamp(col*0.5+0.5*col*col*1.2,0.0,1.0);
    col *= 0.6 + 0.4*16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y);
    
    col *= vec3(0.9,1.0,0.7);
    col *= 0.8+0.2*sin(10.0*time+uv.y*512.0);
    
    col *= 1.0-0.07*rand(vec2(time, tan(time)));
     
    float comp = smoothstep( 0.2, 0.7, sin(time) );
    
    gl_FragColor = vec4(col,1.0);
}
