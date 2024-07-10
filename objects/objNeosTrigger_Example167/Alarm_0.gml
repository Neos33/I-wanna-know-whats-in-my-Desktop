/// @description 2nd pattern

var inst = instance_create_layer(1024/2+irandom_range(-96,96),432,"Killers",objS4_Bullet);
inst . vspeed = -15;
inst . gravity = .4;
play_sfx(sndCherry);

alarm[0] = 15;
