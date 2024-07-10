/// @description wave attack
var _sep = 20;
var wave = instance_create_layer(x+number*_sep,432,"Killers",objCherry);
wave . vspeed = -7;
wave . gravity = .25;
wave . image_speed = 0;
wave . sprite_index = sprite_index;
wave . image_xscale = .75;
wave . image_yscale = .75;
wave . image_blend = image_blend;

wave = instance_create_layer(x-number*_sep,432,"Killers",objCherry);
wave . vspeed = -7;
wave . gravity = .25;
wave . image_speed = 0;
wave . sprite_index = sprite_index;
wave . image_xscale = .75;
wave . image_yscale = .75;
wave . image_blend = image_blend;


number++;
alarm[0] = 2;
