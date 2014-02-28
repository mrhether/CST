///moveToPoint(x1,y1,x2,y2,pathSpeed)

var x1, y1, x2, y2, pathSpeed;
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
pathSpeed = argument[4];

path_clear_points(path);
path = path_add();
if (mp_grid_path(grid,path,x1,y1,x2,y2,1)) {
    path_start(path,pathSpeed,false,false);
} else {
    grid = mp_grid_create(0,0,room_width/16,room_height/16,16,16);
    mp_grid_add_instances(grid,objWall,0);
    mp_grid_clear_rectangle(grid,x-16,y-16,x+16,y+16)
    path = path_add();
    path_clear_points(path);
    if mp_grid_path(grid,path,x1,y1,x2,y2,1) {
        path_start(path,pathSpeed,false,false);
    }
}
