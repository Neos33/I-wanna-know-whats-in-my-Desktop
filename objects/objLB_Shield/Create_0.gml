/// @description 

owner = noone;
t = 0;

sys = part_system_create();
part_system_depth(sys,depth-1);

typ = part_type_create();
part_type_shape(typ,pt_shape_flare);
part_type_life(typ,20,40);
part_type_blend(typ,true);

part_type_speed(typ,1,4,0,0);
part_type_direction(typ,0,360,0,0);
part_type_gravity(typ,.1,270);
part_type_color1(typ,image_blend);
part_type_alpha2(typ,.8,0);

part_type_size(typ,.25,.5,-.005,0);