/// @description 
if exists(objPlayer)
{
	run_state();

	if canFlip
		image_xscale = (x < objPlayer.x) ? -1 : 1;
	
	
	if infinite_jump 
	{
		reset_jumps();
	
	}
}
else
{
	// Kid is dead, stop the time sources
	if time_source_get_state(_ts) = time_source_state_active and time_source_exists(_ts)
	{
		time_source_stop(_ts);
		print("Kid is dead, time sources is gone");
	}
}
	
/*
if (keyboard_check_pressed(vk_space))
{
    var _state = time_source_get_state(time_source);

    if (_state == time_source_state_active)
    {
        time_source_pause(time_source);
    }
    else if (_state == time_source_state_paused)
    {
        time_source_start(time_source);
    }
}