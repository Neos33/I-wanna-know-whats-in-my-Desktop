/// @description 
if !global.basicTrigger[trigger] 
{
	global.basicTrigger[trigger] = true;

	
	if soundID != noone
		play_sfx(soundID, soundVolume);

	
	with objNeosTrigger_Parent
	{
		if !trigger_in_action 
			trigger_in_action = true;
	}
	with objNeosTriggerKiller_Parent
	{
		if !trigger_in_action 
			trigger_in_action = true;
	}
	with objNeosTriggerBlock_Parent
	{
		if !trigger_in_action 
			trigger_in_action = true;
	}
}