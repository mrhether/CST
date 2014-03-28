///drawSpeachBubble(text)

    draw_set_halign(fa_left)
    draw_set_valign(fa_center)
    x1 = round(x);
    y1 = round(y);
    
    draw_set_font(fTwCenConS)
    var text = argument0;//"I'm still thirsty"
    var ww =string_width_ext(text,-1,300);
    
    draw_set_alpha(0.8)
    draw_set_colour(c_black)
    draw_roundrect(x1+30-1,y1-12-1,x1+ww+40+1,y1+12+1,false);
    draw_triangle(x1+20-2,y1,x1+32,y1-8-2,x1+32,y1+8+2,false);
    draw_set_alpha(1)
    draw_set_colour(c_white)
    draw_triangle(x1+20,y1,x1+32,y1-8,x1+32,y1+8,false);
    draw_roundrect(x1+30,y1-12,x1+ww+40,y1+12,false);

    draw_text_color(x1+36,y1-1,text,c_black,c_black,c_black,c_black,1);
//}
