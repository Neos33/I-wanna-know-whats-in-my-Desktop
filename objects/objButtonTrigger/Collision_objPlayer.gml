if !global.basicTrigger[trigger] 
{
	global.basicTrigger[trigger] = true;
	image_index = 1;
	
	if soundID != noone
		play_sfx(soundID, soundVolume);
	
	//Activates every triggereable object
	//with (objTriggereable) {
	//	trigger_activate();
	//}
	
	//with objTriggereableBlock {
	//	trigger_activate();	
	//}
	
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
	
	if destroy 
		instance_destroy();
}