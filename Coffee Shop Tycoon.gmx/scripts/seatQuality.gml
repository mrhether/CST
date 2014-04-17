///seatQuality(object)

temp=0
with (argument0)
{
    if distance_to_object(other)<50 
    other.temp+=1
}

if (temp <= 3) return c_green;
if (temp <= 5) return c_yellow;
return c_red

