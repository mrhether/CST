/* SL_engine_draw();                         */
/* Affiche l'ensemble des ombres et lumières */

// Gestion de la synchronisation affichage/view
if sl_buffer_sync
{sl_view_xspeed = view_xview[global.sl_viewid]-sl_view_xprevious;
 sl_view_yspeed = view_yview[global.sl_viewid]-sl_view_yprevious};
else { sl_view_xspeed=0 sl_view_yspeed=0 };

// Affichage des buffers
draw_set_blend_mode_ext(bm_dest_color,bm_zero);
draw_surface_ext(sl_buffer_surface1,view_xview[global.sl_viewid]-sl_buffer_xmargin-sl_view_xspeed,view_yview[global.sl_viewid]-sl_buffer_ymargin-sl_view_yspeed,1/sl_buffer_texturesize,1/sl_buffer_texturesize,0,c_white,1);
draw_set_blend_mode(bm_add);
draw_surface_ext(sl_buffer_surface2,view_xview[global.sl_viewid]-sl_buffer_xmargin-sl_view_xspeed,view_yview[global.sl_viewid]-sl_buffer_ymargin-sl_view_yspeed,1/sl_buffer_texturesize,1/sl_buffer_texturesize,0,c_white,sqr(global.sl_ambient_light));
draw_set_blend_mode(bm_normal);

if sl_buffer_sync
{sl_view_xprevious = view_xview[global.sl_viewid];
 sl_view_yprevious = view_yview[global.sl_viewid]};
