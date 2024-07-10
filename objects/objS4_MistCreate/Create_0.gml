/// @description 
psys = part_system_create();
part_system_depth(psys,depth-1);
 
 
ptyp = part_type_create();
part_type_sprite(ptyp,sprS4_Mist,0,0,0);
part_type_alpha3(ptyp,0,.24,0);
part_type_blend(ptyp,true);
part_type_size(ptyp,.75,1,0,0);

part_type_life(ptyp,50,200);
part_type_speed(ptyp,1,3,0,0);
part_type_direction(ptyp,0,0,0,0);

part_type_color1(ptyp,c_white);


alarm[0] = 1;