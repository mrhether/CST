/* SL_light_free();                                            */
/* Libère la mémoire occupée par la surface de l'objet lumière */

surface_free(sl_light_surface);
sl_light_surface = -1;
