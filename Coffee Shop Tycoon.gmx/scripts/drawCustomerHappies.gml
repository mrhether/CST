///drawCustomerHappies()

draw_set_font(fTwCenConM);
var instCount = instance_number(obj_customer);

var tt = 0
for (var i=0; i < instCount; i++) {
    var c = instance_find(obj_customer,i);
    if (c.team == team) {
        tt++;
    
        var xx = x;
        var yy = 160+y+tt*32
        if  (c.happiness < -2) draw_set_color(c_red);
        else if  (c.happiness > 2) draw_set_color(c_green);
        else draw_set_color(c_yellow);
        
        draw_circle(xx,yy,16,false);
        draw_set_color(c_black);
        draw_circle(xx,yy,16,true);
        draw_curve(xx-10,yy+5,xx+10,yy+5,c.happiness*-10,6);
        draw_circle(xx-5,yy-5,1,false);
        draw_circle(xx+5,yy-5,1,false);
    }

}

