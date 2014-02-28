grid = mp_grid_create(0,0,room_width/16,room_height/16,16,16);
mp_grid_add_instances(grid,objWall,0);
mp_grid_add_instances(grid,obj_worker,0);
mp_grid_clear_rectangle(grid,x-16,y-16,x+16,y+16)
path = path_add();
