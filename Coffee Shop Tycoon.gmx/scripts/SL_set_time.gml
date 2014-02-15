/* SL_set_time(time);                     */
/* Fonction permettant de changer l'heure */

if argument0>=0 && argument0<24 global.sl_time=argument0 else global.sl_time=0; // Actualise la variable d'heure
for (i=1; sl_tod[i,0]<=global.sl_time; i+=1) sl_tod_index=i; // Actualise la variable d'index du ToD
