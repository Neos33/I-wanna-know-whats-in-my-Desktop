/// @description 


//play_sfx(sndStarFinale);

sys = part_system_create();
part_system_depth(sys,depth+1);

typ = part_type_create();
part_type_alpha2(typ,1,0);
part_type_shape(typ,pt_shape_flare);
part_type_blend(typ,true);

part_type_speed(typ,1,10,0,0);
part_type_direction(typ,0,360,0,0);
part_type_life(typ,300,500);

part_type_color1(typ,c_white);
part_type_size(typ,1.25,1.5,-.005,0);