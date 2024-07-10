/// @description 
timer = 0;
radius = 0;
angle = 0;
angle_speed = 1;
total = 24;
tag = "";
rad_offset = 0;

canKill = false;

#region
psys = part_system_create();
part_system_depth(psys,depth + 1);

var p = part_type_create();
part_type_sprite(p,sprite_index,false,false,false);
part_type_life(p,80,80);
part_type_alpha2(p,0.5,1);

ptyp = p;
#endregion