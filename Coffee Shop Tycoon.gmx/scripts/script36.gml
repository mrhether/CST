///draw_curve(x1,y1,x2,y2,direction,detail)
/*
**  Usage:
**      draw_curve(x1,y1,x2,y2,direction,detail)
**
**  Arguments:
**      x1,y1       position of start of curve, real
**      x2,y2       position of end of curve, real
**      direction   start angle of the curve, real
**      detail      number of segments in the curve, real
**
**  Returns:
**      nothing
**
**  Notes:
**      Draws a curve between two points with the given starting angle.
**
**  Dependencies:
**      http://www.gmlscripts.com/script/angle_difference
**
**  GMLscripts.com
*/
{
    var x1, y1, x2, y2, start_angle, detail, dist, dist_ang, step, draw_x, draw_y;
    x1 = argument[0];
    y1 = argument[1];
    x2 = argument[2];
    y2 = argument[3];
    start_angle = argument[4];
    detail = argument[5];

    dist = point_distance(x1,y1,x2,y2);
    dist_ang = ((((point_direction(x1,y1,x2,y2) - start_angle) mod 360) + 540) mod 360) - 180; 
    angle_difference(point_direction(x1,y1,x2,y2),start_angle);
    step = (1/detail);

    draw_primitive_begin(pr_linestrip);
    for (i=0; i<1+step; i+=step) {
        draw_x = x1 + (lengthdir_x(i * dist, i * dist_ang + start_angle));
        draw_y = y1 + (lengthdir_y(i * dist, i * dist_ang + start_angle));
        draw_vertex(draw_x,draw_y);
    }
    draw_primitive_end();
}
