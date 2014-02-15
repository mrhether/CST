/* SL_global_cast_obj(layer,object,sprite,sun,ambient);                      */
/* Fonction permettant de définir un objet comme projetant une ombre globale */ 

// Actualise le compteur des layers
sl_layers_count = max(argument0,sl_layers_count);

// Liste globale
for (i=0; i>=0; i+=1)
{
    if sl_global_list[i,1]=argument1 break;
    else if sl_global_list[i,1]=-1
    { 
        sl_global_list[i,0]   = argument0;
        sl_global_list[i,1]   = argument1;
        sl_global_list[i+1,1] = -1;
        break;
    }
}

// Liste des ombres solaires "objets"
if argument3=1
{
    global.sl_z[argument1] = 0;
    
    for (i=0; i>=0; i+=1)
    {
        if sl_sunshadows_list[i,1]=argument1 break;
        else if sl_sunshadows_list[i,1]=-1
        {
            sl_sunshadows_list[i,0]   = argument0;
            sl_sunshadows_list[i,1]   = argument1;
            sl_sunshadows_list[i,2]   = argument2;
            sl_sunshadows_list[i+1,1] = -1;
            break;
        }
    }
}

// Liste des ombres solaires "textures"
if argument3=2
{
    global.sl_z[argument1] = 0;
    
    for (i=0; i>=0; i+=1)
    {
        if sl_sunshadows_texlist[i,1]=argument1 break;
        else if sl_sunshadows_texlist[i,1]=-1
        {
            sl_sunshadows_texlist[i,0]   = argument0;
            sl_sunshadows_texlist[i,1]   = argument1;
            sl_sunshadows_texlist[i,2]   = argument2;
            sl_sunshadows_texlist[i,3]   = sprite_get_width(argument2);
            sl_sunshadows_texlist[i+1,1] = -1;
            break;
        }
    }
}

// Liste des ombres ambiantes
if argument4=1
{
    for (i=0; i>=0; i+=1)
    {
        if sl_ambientshadows_list[i,1]=argument1 break;
        else if sl_ambientshadows_list[i,1]=-1
        {
            sl_ambientshadows_list[i,0]   = argument0;
            sl_ambientshadows_list[i,1]   = argument1;
            sl_ambientshadows_list[i+1,1] = -1;
            break;
        } 
    }
}
