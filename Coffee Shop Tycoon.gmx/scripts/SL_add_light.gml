/* SL_add_light(object);                                           */
/* Fonction permettant de définir un objet comme étant une lumière */

for (i=0; i>=0; i+=1)
{
    if global.sl_lightlist[i] = argument0 break;
     
    if global.sl_lightlist[i]=-1
    {
        global.sl_lightlist[i]   = argument0;
        global.sl_lightlist[i+1] = -1;
        break;
    }
}
