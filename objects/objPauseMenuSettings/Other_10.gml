/// @description Resume game
global.game_paused = false;
instance_activate_all();

// Resume time sources
with objLastBoss
{
	var _state = time_source_get_state(_ts)
	if _state == time_source_state_paused
	{
		time_source_resume(_ts);
	}
}

with objWorld
{
	if (sprite_exists(pause_screen)) {
		sprite_delete(pause_screen);
	}
		
	io_clear();
}
instance_destroy();
//print("Game resumed");