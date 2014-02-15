/* SL_light_ini_begin();                        */
/* Commence l'initialisation de l'objet lumière */

// Variables modulables
sl_light_active          = true;    // Détermine si le rendu de la lumière doit être effectué ou non
sl_light_x               = x;       // Position de la lumière dans la room
sl_light_y               = y;
sl_light_xscale          = 1;       // Facteurs de scale de la lumière
sl_light_yscale          = 1;
sl_light_angle           = 0;       // Angle de la texture de lumière
sl_light_color           = c_white; // Couleur de la lumière
sl_light_power           = 1;       // Puissance de la lumière
sl_light_ambientpower    = 0;       // Puissance résiduelle de la lumière
sl_light_shadowlength    = 4;       // Longueur des ombres (détermine le nombre d'itérations)
sl_light_shadowfactor    = 1.03;    // Grossissement appliqué à chaque sample d'ombre lors du rendu (doit être obligatoirement supérieur à 1)
sl_light_shadowsharpness = 0.8;     // Facteur d'atténuation des ombres (entre 0 et 1)
sl_light_castshadow      = true;    // Détermine si la lumière projette des ombres ou non
sl_light_refresh         = true;    // Détermine si les ombres sont rafraîchies ou non
sl_light_refreshrate     = 0;       // Fréquence de rafraîchissement des ombres, en steps (<=0 pour un rafraîchissement continu)

// Variables automatiques
sl_light_shadowlist[0,0] = -1; // Liste les objets 'ombrés' par l'objet lumière
