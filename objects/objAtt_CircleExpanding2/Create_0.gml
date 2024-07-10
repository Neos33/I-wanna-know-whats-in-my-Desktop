/// @description 
timer = 0;
radius = 800;
angle = irandom(360);
angle_speed = 1;
total = 24;

alarm[0] = 1;
alarm[1] = 1;

canKill = true;
alphaCircleBase = 0;
value_to_destination(alphaCircleBase,.8,"alphaCircleBase",,,,20);

//audio_falloff_set_model(audio_falloff_exponent_distance_clamped);


#region Particles
psys = part_system_create();
part_system_depth(psys,depth + 1);

var p = part_type_create();
part_type_sprite(p,sprite_index,false,false,false);
part_type_life(p,80,80);
part_type_alpha2(p,0.5,1);

ptyp = p;
#endregion