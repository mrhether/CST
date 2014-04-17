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

void main()
{

    vec4 sum = vec4(0.0);
    vec2 q1 = v_texcoord;
    vec4 oricol = texture2D(gm_BaseTexture,vec2(q1.x,q1.y));
    vec3 col;
    
    for(int i=-2;i<2;i++) {
        for (int j=-3;j<3;j++) {
            sum += texture2D(gm_BaseTexture,vec2(j,i)*0.002 + vec2(q1.x,q1.y)) * 0.25;
        }
   }
 
  if (oricol.r < 0.4) {
       gl_FragColor = sum*sum*0.012 + oricol;
   } else {
       if (oricol.r < 0.6) {
          gl_FragColor = sum*sum*0.009 + oricol;
       } else {
          gl_FragColor = sum*sum*0.0075 + oricol;
       }
   }
}
