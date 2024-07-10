/// @description 
expand = new trigger_dynamic();
MoveUp = new trigger_dynamic();

expand.action_begin = function()
{
	timer = 30;
	trigger = 35;
	size_spd = 2/timer;
	//hspeed = -1;
}
expand.action_step = function()
{
	timer--
	image_xscale -= size_spd;
	if timer == 0
	{
		play_sfx(sndSpikeTrap);
		hspeed = 0;
		set_next_trigger(MoveUp);
	}
}

MoveUp.action_begin = function()
{
	timer = 1;
	trigger = 33;
}
MoveUp.action_step = function()
{
	timer--
	if timer == 0
	{
		play_sfx(sndSpikeTrap);
		hspeed = 0;
		vspeed = -1;
	}
}

init_trigger(expand,2);
