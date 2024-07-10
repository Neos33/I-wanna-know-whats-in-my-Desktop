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
			var _fist = Create(2752,1424,"Triggers",objFist,sprFist,0,0,0.4705883,0.4705883,0,,);
			_fist . depth = copyDepth("Tiles_Back") + 1;
			with _fist{
				path_start(pthLeft,6,path_action_stop,false);
				path_scale = 2.5;
			}
			
			play_sfx(sndPunchAttack);
			instance_destroy();
			
		break;
	}
}

init_trigger(myTrap);