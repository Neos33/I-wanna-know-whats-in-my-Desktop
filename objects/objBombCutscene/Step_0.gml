/// @description 
switch state_feeling
{
	case "WakeUp":
		if bomb_anim_index < bomb_anim_wake_total
			bomb_anim_index += bomb_anim_speed;
	break;
	
	case "Alert":
		if bomb_anim_index < bomb_anim_wake_total
			bomb_anim_index += bomb_anim_speed;
	break;
}
/*
if state_feeling = wakeup
{
	if bomb_anim_index < bomb_anim_wake_total
		bomb_anim_index += bomb_anim_speed;
}
