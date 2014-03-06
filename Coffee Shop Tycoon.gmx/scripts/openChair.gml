if (random(4) <  2) {
    with obj_chair {
        if (open == true) {
            open = false;
            alarm[0] = 1000;
            return self.id;
        }
    }
}
return instance_nearest(x,y,obj_customerCreator);
