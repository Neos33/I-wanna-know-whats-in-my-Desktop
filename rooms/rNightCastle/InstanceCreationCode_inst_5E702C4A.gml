visible = false;
myTrap = new trigger_dynamic();

myTrap.action_begin = function()
{
	t = 0;
}
myTrap.action_step = function()
{
	if exists()
		t++;
	else
		t = -1;
	
	switch t
	{
		case 1:
			play_sfx(sndUnfart);
			with objS3_BrickKiller
			{
				var _rng = irandom_range(90,100);
				move_to_position(,,xstart,ystart,false,animCurve_Back,0,_rng);
				angle_to_destination(,0,false,animCurve_Back,0,_rng);
			}
		break;
		
		case 101:
			for (var i = 0; i < 4; ++i) {
				for (var j = 0; j < 4; ++j) {
				    var _b = Create(3520+16+32*i,672+16+32*j,"Collisions",objBlock,sprBlock_Texture_Center,6,0,1,1,0,c_white,1);
					_b . visible = true;
				}
			    
			}
			
			instance_destroy(objS3_BrickKiller);
			
		break;
	}
}

init_trigger(myTrap);