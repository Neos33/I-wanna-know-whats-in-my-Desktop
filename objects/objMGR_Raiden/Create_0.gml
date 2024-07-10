/// @description 

debug_init_position_command();
raidenShoot = new state();
canPunch = false;

raidenShoot.start = function()
{
	//timer = 60;
	image_speed = .2;
}
raidenShoot.run = function()
{
	//timer--;
	//if timer == 0
	if canPunch and is_pressed(global.controls.shoot)
	{
		play_sfx(sndShoot);	
		var inst = instance_create_depth(x + 11 * image_xscale, y - 2, depth, objBullet);
		inst . speed = 9 //* sign(image_xscale);
		inst . direction = point_direction(x,y,objMGR_Armstrong.x,objMGR_Armstrong.y-48);
		inst . image_xscale = 2;
		inst . image_yscale = inst . image_xscale;
		
		image_speed = .5;
		timer = 10;
	}
}

init_state(raidenShoot);
