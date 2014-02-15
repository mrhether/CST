/* SL_sprite_set_ambient(sprite);                                   */
/* Fonction permettant de générer une ombre ambiante pour un sprite */

var j1, j2, rad, nbr, sl_w, sl_h, sl_xx, sl_yy, sl_spr, sl_alpha, s, a, surface_s, surface_a;

j1   = 5;  // Saut de rayon
j2   = 5;  // Saut d'angle
rad  = 30; // Radius
nbr  = sprite_get_number(argument0);
sl_w = (sprite_get_width (argument0)+rad*2) * sl_ambientshadows_mapscale;
sl_h = (sprite_get_height(argument0)+rad*2) * sl_ambientshadows_mapscale;

for (i=0; i<nbr; i+=1)
{
    surface_s[i] = surface_create(sl_w,sl_h);
    surface_set_target(surface_s[i]);
    draw_clear(c_black);
    surface_reset_target();

    surface_a[i] = surface_create(sl_w,sl_h);
    surface_set_target(surface_a[i]);
    draw_clear(c_white);
    
    sl_xx = (rad + sprite_get_xoffset(argument0)) * sl_ambientshadows_mapscale;
    sl_yy = (rad + sprite_get_yoffset(argument0)) * sl_ambientshadows_mapscale;
    
    for (len=j1; len<rad; len+=j1) for (dir=0; dir<360; dir+=j2)
    draw_sprite_ext(argument0,i,sl_xx+lengthdir_x(len,dir)*sl_ambientshadows_mapscale,sl_yy+lengthdir_y(len,dir)*sl_ambientshadows_mapscale,sl_ambientshadows_mapscale,sl_ambientshadows_mapscale,0,c_black,2/(floor((rad/j1)*(360/j2))));
    
    draw_set_blend_mode_ext(bm_inv_dest_color, bm_inv_src_color);
    draw_set_color(c_white);
    draw_rectangle(0,0,sl_w,sl_h,0);
    draw_set_blend_mode(bm_normal);
    
    surface_reset_target();
}

for (i=0; i<nbr; i+=1)
{
    if i=0
    {
        sl_spr   = sprite_create_from_surface(surface_s[i],0,0,sl_w,sl_h,false,false,sl_xx,sl_yy);
        sl_alpha = sprite_create_from_surface(surface_a[i],0,0,sl_w,sl_h,false,false,sl_xx,sl_yy);
    }
    else
    {
        sprite_add_from_surface(sl_spr  ,surface_s[i],0,0,sl_w,sl_h,false,false);
        sprite_add_from_surface(sl_alpha,surface_a[i],0,0,sl_w,sl_h,false,false);
    }
    
    surface_free(surface_s[i]);
    surface_free(surface_a[i]);
}

s = sprite_duplicate(sl_spr);
a = sprite_duplicate(sl_alpha);

sprite_set_alpha_from_sprite(s,a);
sl_ambientshadows_map[argument0] = s;

sprite_delete(sl_spr);
sprite_delete(sl_alpha);
sprite_delete(a);

sl_ambientshadows_lock = false;
