/// @description 
t = 0;


psys = part_system_create();
part_system_depth(psys,depth-1);

ptyp = part_type_create();

part_type_alpha2(ptyp,.4,0);
part_type_life(ptyp,100,150);
part_type_shape(ptyp,pt_shape_flare);
part_type_color_mix(ptyp,make_color_hsv(color_get_hue(c_aqua),170,255),make_color_hsv(color_get_hue(c_green),170,255));

part_type_direction(ptyp,87,93,0,2);
part_type_speed(ptyp,3,6,.05,0);
part_type_blend(ptyp,true);

part_type_size(ptyp,.5,.75,0,.02);