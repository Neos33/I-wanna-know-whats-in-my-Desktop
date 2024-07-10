/// @description 

timer = 0;
image_speed = .5;
pp = part_system_create();
part_system_depth(pp,depth);

tt = part_type_create();

part_type_shape(tt,pt_shape_sphere);
part_type_life(tt,20,60);
part_type_blend(tt,true);
part_type_alpha2(tt,.8,0);

part_type_color_mix(tt,c_white,c_yellow);
part_type_speed(tt,2,5,0,0);
part_type_direction(tt,90,250,0,0);
part_type_size(tt,.25,.5,-0.012,0);
part_type_gravity(tt,.17,270);

/*summon_clock = new state();
//debug_init_position_command();

summon_clock.start = function()
{
	timer = 60;
	image_speed = .2;
}
summon_clock.run = function()
{
	timer--;
	if timer == 0
	{
		play_sfx(sndShoot);	
		var inst = instance_create_depth(x + 58 * image_xscale, y - 41,depth,objBullet);
		inst . hspeed = 5 * sign(image_xscale);
		with inst setScale(8);
		
		image_speed = .5;
		timer = 5;
	}
}

init_state(summon_clock);
