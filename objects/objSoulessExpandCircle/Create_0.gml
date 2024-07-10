/// @description 


radius = 0;
radiusLimit = 64;
radiusHalfLimit = radiusLimit / 2;

duration = 150;
start = duration*.75;;

angle = 0;
angle_speed = 3;

speed_start = 2;
angle_factor = random_range(.5,1);
//speed = speed_start;
hspd = 0;
alarm[3] = irandom_range(100,200);

t = 0;

total = 8;

alarm[0] = 1;

#region
pp = part_system_create();
part_system_depth(pp,depth+1);

tt = part_type_create();
part_type_sprite(tt,sprNeosTHBullet,false,false,false);
part_type_blend(tt,true);
part_type_life(tt,20,20);
part_type_alpha2(tt,.5,0);
#endregion

function is_in_the_view()
{
	var cam = camera_properties(0);
	return x >= cam.view_x - radius
	    && x < cam.view_x + cam.view_w + radius
	    && y >= cam.view_y - radius
	    && y < cam.view_y + cam.view_h + radius
}