///mouse_release_rectangle(x1,y1,x2,y2,tooltip)
if(device_mouse_raw_x(0)>=argument0
&& device_mouse_raw_y(0)>=argument1
&& device_mouse_raw_x(0)<=argument2
&& device_mouse_raw_y(0)<=argument3)
{
    Tooltip=argument4;
}
return(    device_mouse_raw_x(0)>=argument0
        && device_mouse_raw_y(0)>=argument1
        && device_mouse_raw_x(0)<=argument2
        && device_mouse_raw_y(0)<=argument3
        && mouse_check_button_released(mb_left) )
