/// @description 


gravity = .15;
setScale(.5);

alarm[0] = 5;
//tex = sprite_get_texture(sprite_index,image_index);
sonicMode = true;


#region Particles
sys = part_system_create();
part_system_depth(sys,depth + 1);

typ = part_type_create();
part_type_sprite(typ,sprite_index,false,false,false);
part_type_life(typ,10,10);
part_type_blend(typ,true);

part_type_alpha2(typ,1,0);
part_type_orientation(typ,0,0,0,0,0);
part_type_scale(typ,.5,.5);


#endregion;