/// @description 
psys = part_system_create();
part_system_layer(psys,layer);

var p = part_type_create();

part_type_sprite(p,sprS3_RainParticle,0,0,0);
part_type_blend(p,true);
part_type_life(p,100,150);

part_type_speed(p,10,14,.05,0);
part_type_direction(p,245-10,245+10,0,.4);
part_type_orientation(p,0,0,0,0,true);

part_type_alpha1(p,.2);
part_type_scale(p,1.5,1);
part_type_size(p,1,1.5,0,0);
part_type_color_mix(p,c_grey,c_white);

ptyp = p;

repeat 10
{
	part_system_update(psys);	
}

alarm[0] = 1;

//part_sys