alarm[0] = 1000;
with obj_field {
        if (harvest == true) {
            return self.id;
        }
    }
return instance_nearest(x,y,obj_field); //buy from store?