/* SL_draw_sprite_light(sprite,subimg,x,y,xscale,yxscale,rot,color,alpha); */
/* Fonction permettant d'afficher un sprite en tant que lumière            */

global.sl_texlist_light[global.sl_texlist_light_index,0] = argument0;
global.sl_texlist_light[global.sl_texlist_light_index,1] = argument1;
global.sl_texlist_light[global.sl_texlist_light_index,2] = argument2;
global.sl_texlist_light[global.sl_texlist_light_index,3] = argument3;
global.sl_texlist_light[global.sl_texlist_light_index,4] = argument4;
global.sl_texlist_light[global.sl_texlist_light_index,5] = argument5;
global.sl_texlist_light[global.sl_texlist_light_index,6] = argument6;
global.sl_texlist_light[global.sl_texlist_light_index,7] = argument7;
global.sl_texlist_light[global.sl_texlist_light_index,8] = argument8;

global.sl_texlist_light[global.sl_texlist_light_index+1,0] = -1;
global.sl_texlist_light_index += 1;
