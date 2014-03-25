///nearestInstances(x,y,obj,n)
//Returns the n nearest object of obj for coordinates x,y

var i,j,l;

l=ds_list_create()

repeat(min(argument3-1,instance_number(argument2)-1))
{
    i=instance_nearest(argument0,argument1,argument2)
    ds_list_add(l,i)
    instance_deactivate_object(i)
}

j=instance_nearest(argument0,argument1,argument2)


i=0
repeat(ds_list_size(l))
{
    instance_activate_object(ds_list_find_value(l,i))
    i+=1
}
ds_list_add(l,j)

return l
