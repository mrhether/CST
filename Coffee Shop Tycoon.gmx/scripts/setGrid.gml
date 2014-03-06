grid = mp_grid_create(0,0,room_width/16,room_height/16,16,16);
mp_grid_add_instances(grid,objWall,0);
mp_grid_add_instances(grid,obj_worker,0);
var mask_width=bbox_right-bbox_left;
var mask_height=bbox_bottom-bbox_top;
mp_grid_clear_rectangle(grid,x-mask_width/2,y-mask_height/2,x+mask_width/2,y+mask_height/2)
path = path_add();
