/// @description 
event_inherited();
image_speed = 0;
count = 0;
spd = 5;
reverse = 0;
orienta = 0;

surf_grieta = -1;
surf_begin = false;
surf_index = 0;
surf_w = 32;
surf_h = 32;

path_first = noone;
path_second = noone;

#region Particles
var _de = depth+1;
psys = part_system_create();
part_system_depth(psys,_de);

var p = part_type_create();
part_type_shape(p,pt_shape_smoke);
part_type_color_mix(p,c_maroon,c_dkgrey);
part_type_size(p,.1,.25,-0.005,0);
part_type_blend(p,true);
part_type_alpha2(p,1,0);
part_type_life(p,20,50);
part_type_direction(p,65,115,0,0);
part_type_orientation(p,0,360,0,0,0);
part_type_gravity(p,.04,270);
part_type_speed(p,1,3,0,0);
ptyp = p;



#endregion

execute = false;
scr = function(){}

everything_break = new trigger_dynamic();


everything_break.action_step = function()
{
	if !execute
	{
		execute = true;
		scr();
		orienta = -90;
	}
	
}

init_trigger(everything_break);