/// @description 

image_speed = 0;
image_index = 1;

touchedWater = false;


	psys = part_system_create();
	part_system_depth(psys,depth-1);
	
	var p = part_type_create();
	
	part_type_shape(p,pt_shape_sphere);
	part_type_color1(p,c_white);
	part_type_size(p,.35,.45,-0.005,0);
	part_type_scale(p,.5,.5)
	part_type_blend(p,true);
	part_type_alpha3(p,.1,.4,0);
	part_type_life(p,20,50);
	part_type_direction(p,65,115,0,0);
	//part_type_orientation(p,0,360,0,0,0);
	part_type_gravity(p,.075,270);
	part_type_speed(p,.5,2,0,0);
	ptyp = p;